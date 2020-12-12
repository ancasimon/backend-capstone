import axios from 'axios';
import { baseUrl } from '../constants.json';

const getPreworkLevelsList = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/preworkLevels`)
    .then((preworkLevelsResponse) => {
      resolve(preworkLevelsResponse.data);
    })
    .catch((error) => reject(error));
});

export default { getPreworkLevelsList };
