import firebase from 'firebase/app';
import 'firebase/auth';
import axios from 'axios';
import { baseUrl } from '../constants.json';

// interceptors work by changing the outbound request before the xhr is sent
// or by changing the response before it's returned to our .then() method.
axios.interceptors.request.use((request) => {
  const token = sessionStorage.getItem('token');
  if (token != null) {
    request.headers.Authorization = `Bearer ${token}`;
  }
  return request;
}, (err) => Promise.reject(err));

// sub out whatever auth method firebase provides that you want to use.
const registerUser = (user) => firebase.auth().createUserWithEmailAndPassword(user.email, user.password)
  .then((cred) => {
    console.error('sending to FB', user.email);
    console.error('getting back from FB', cred.user);
    // get email and other user data from firebase
    const userInfo = {
      firebaseUid: firebase.auth().currentUser.uid,
      email: user.email,
      password: user.password,
      firstName: user.firstName,
      lastName: user.lastName,
      photoUrl: user.photoUrl,
    };

    // get token from firebase
    cred.user.getIdToken()
      // save the token to the session storage
      .then((token) => sessionStorage.setItem('token', token))
      // save the user to the the api
      .then(() => {
        console.error('new user object', userInfo);
        axios.post(`${baseUrl}/users`, userInfo);
      });
  });

// sub out whatever auth method firebase provides that you want to use.
const loginUser = (user) => firebase.auth().signInWithEmailAndPassword(user.email, user.password)
  .then((cred) => {
    // get token from firebase
    cred.user.getIdToken()
      // save the token to the session storage
      .then((token) => sessionStorage.setItem('token', token));
  });
const logoutUser = () => firebase.auth().signOut();

const getUid = () => firebase.auth().currentUser.uid;

export default {
  getUid,
  loginUser,
  logoutUser,
  registerUser,
};
