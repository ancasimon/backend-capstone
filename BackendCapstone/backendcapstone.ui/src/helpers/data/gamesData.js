import axios from 'axios';
import { baseUrl } from '../constants.json';

const getAllActiveGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games`)
    .then((gamesResponse) => {
      resolve(gamesResponse.data);
      console.error('games axios resp', gamesResponse);
    })
    .catch((error) => reject(error));
});

const getGameById = (id) => axios.get(`${baseUrl}/games/${id}`);

export default { getAllActiveGames, getGameById };
