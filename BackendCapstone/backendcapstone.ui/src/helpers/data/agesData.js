import axios from 'axios';
import { baseUrl } from '../constants.json';

const getAgesList = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/ages`)
    .then((agesResponse) => {
      resolve(agesResponse.data);
    })
    .catch((error) => reject(error));
});

export default { getAgesList };
