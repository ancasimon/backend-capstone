import axios from 'axios';
import { baseUrl } from '../constants.json';

const getGameIcons = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/gameIcons`)
    .then((gameIconsResponse) => {
      resolve(gameIconsResponse.data);
    })
    .catch((error) => reject(error));
});

export default { getGameIcons };
