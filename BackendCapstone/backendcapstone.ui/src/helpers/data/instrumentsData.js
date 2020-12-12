import axios from 'axios';
import { baseUrl } from '../constants.json';

const getInstrumentsList = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/instruments`)
    .then((instrumentsResponse) => {
      resolve(instrumentsResponse.data);
    })
    .catch((error) => reject(error));
});

export default { getInstrumentsList };
