import axios from 'axios';
import { baseUrl } from '../constants.json';

const getUserPracticePlans = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/practiceplans`)
    .then((userPracticePlansResponse) => {
      resolve(userPracticePlansResponse.data);
      console.error('pp cominging from db', userPracticePlansResponse.data);
    })
    .catch((error) => reject(error));
});

const getSinglePracticePlan = (planId) => axios.get(`${baseUrl}/practiceplans/${planId}`);

export default { getUserPracticePlans, getSinglePracticePlan };
