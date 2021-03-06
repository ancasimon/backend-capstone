import React from 'react';
import firebase from 'firebase/app';
import 'firebase/auth';

import {
  BrowserRouter,
  Route,
  Redirect,
  Switch,
} from 'react-router-dom';

import fbConnection from '../helpers/data/connection';

import usersData from '../helpers/data/usersData';

import Footer from '../components/shared/Footer/Footer';
import GameNewOrEdit from '../components/pages/GameNewOrEdit/GameNewOrEdit';
import Games from '../components/pages/Games/Games';
import Home from '../components/pages/Home/Home';
import Login from '../components/pages/Login/Login';
import MyPracticePlans from '../components/pages/MyPracticePlans/MyPracticePlans';
import PracticePlanNewOrEdit from '../components/pages/PracticePlanNewOrEdit/PracticePlanNewOrEdit';
import Profile from '../components/pages/Profile/Profile';
import Register from '../components/pages/Register/Register';
import SingleGameView from '../components/pages/SingleGameView/SingleGameView';
import SinglePracticePlanView from '../components/pages/SinglePracticePlanView/SinglePracticePlanView';

import MyNavbar from '../components/shared/MyNavbar/MyNavbar';

import './App.scss';

fbConnection();

const PrivateRoute = ({ component: Component, authed, ...rest }) => {
  const routeChecker = (props) => (authed === true
    ? (<Component {...props} />)
    : (<Redirect to={{ pathname: '/auth', state: { from: props.location } }} />));
  return <Route {...rest} render={(props) => routeChecker(props)} />;
};

class App extends React.Component {
  state = {
    authed: false,
    user: {},
    file: {},
  }

  getUser = () => {
    usersData.getSingleUser()
      .then((userResponse) => {
        this.setState({ user: userResponse.data });
      })
      .catch((error) => console.error('Could not get user data.', error));
  }

  componentDidMount() {
    this.removeListener = firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        // get token from firebase
        user.getIdToken()
        // save the token to the session storage
          .then((token) => sessionStorage.setItem('token', token));
        this.getUser();
        this.setState({ authed: true });
      } else {
        this.setState({ authed: false });
      }
    });
  }

  componentWillUnmount() {
    this.removeListener();
  }

  render() {
    const { authed, user } = this.state;

    return (
      <div className="App">
        <BrowserRouter>
          <React.Fragment>
            <MyNavbar authed={authed} />
              <div className="container">
                <div className="row">
                  <Switch authed={authed}>
                    <PrivateRoute path='/games/edit/:gameid' component={GameNewOrEdit} authed={authed} />
                    <PrivateRoute path='/games/new' component={GameNewOrEdit} authed={authed} />
                    <PrivateRoute path='/practiceplans/edit/:practiceplanid' component={PracticePlanNewOrEdit} authed={authed} />
                    <PrivateRoute path='/practiceplans/new' component={PracticePlanNewOrEdit} authed={authed} />
                    <PrivateRoute path='/practiceplans/:practiceplanid' component={SinglePracticePlanView} authed={authed} />
                    <PrivateRoute path='/practiceplans' component={MyPracticePlans} authed={authed} />
                    <PrivateRoute path='/profile' component={Profile} authed={authed} />

                    <Route path='/home' render={(props) => <Home authed={authed} user={user} {...props} />}/>
                    <Route path='/login' component={Login} authed={authed} />
                    <Route path='/games/:gameid' render={(props) => <SingleGameView authed={authed} user={user} {...props} />} />
                    <Route path='/games' render={(props) => <Games authed={authed} {...props} />} />
                    <Route path='/register' render={(props) => <Register authed={authed} user={user} getUser={this.getUser} {...props} />} />

                    <Redirect from="*" to='/home'></Redirect>
                  </Switch>
                </div>
              </div>
          </React.Fragment>
        </BrowserRouter>
        <Footer></Footer>
      </div>
    );
  }
}

export default App;
