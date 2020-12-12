import axios from 'axios';
import { baseUrl } from '../constants.json';

const getAllActiveGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games`)
    .then((gamesResponse) => {
      resolve(gamesResponse.data);
    })
    .catch((error) => reject(error));
});

const getFilteredGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games/filtered`)
    .then((filteredGamesResponse) => {
      resolve(filteredGamesResponse.data);
    })
    .catch((error) => reject(error));
});

// MEED TO UPDATE THIS FUNCTION TO PASS THE FILTER PARAMETERS!
// const getFilteredGames = (selectedAges) => new Promise((resolve, reject) => {
//   axios.get(`${baseUrl}/games/filtered/${selectedAges}`)
//     .then((filteredGamesResponse) => {
//       resolve(filteredGamesResponse.data);
//     })
//     .catch((error) => reject(error));
// });

const getGameById = (id) => axios.get(`${baseUrl}/games/${id}`);

export default { getAllActiveGames, getGameById, getFilteredGames };
