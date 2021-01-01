import axios from 'axios';
import { baseUrl } from '../constants.json';

const getAllActiveGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games/all`)
    .then((gamesResponse) => {
      resolve(gamesResponse.data);
    })
    .catch((error) => reject(error));
});

const getLatestGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games/latest`)
    .then((latestGamesResponse) => {
      resolve(latestGamesResponse.data);
    })
    .catch((error) => reject(error));
});

const getMostPopularGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games/popular`)
    .then((mostPopularGamesResponse) => {
      resolve(mostPopularGamesResponse.data);
    })
    .catch((error) => reject(error));
});

const getGamesContributedByAuthedUser = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games/submittedby`)
    .then((userContributedGamesResponse) => {
      resolve(userContributedGamesResponse.data);
    })
    .catch((error) => reject(error));
});

// Passing in filter values for selected games:
const getFilteredGames = (searchInput, selectedAges, selectedInstruments, selectedPreworkLevels) => new Promise((resolve, reject) => {
  const buildAgeFilters = () => selectedAges.map((age) => `selectedAges=${age}&`).join('');
  const buildInstrumentFilters = () => selectedInstruments.map((instrument) => `selectedInstruments=${instrument}&`).join('');
  const buildPreworkLevelFilters = () => selectedPreworkLevels.map((preworkLevel) => `selectedPreworkLevels=${preworkLevel}&`).join('');
  axios.get(`${baseUrl}/games?searchInput=${searchInput}&${buildAgeFilters()}&${buildInstrumentFilters()}&${buildPreworkLevelFilters()}`)
    .then((filteredGamesResponse) => {
      resolve(filteredGamesResponse.data);
    })
    .catch((error) => reject(error));
});

const getGameById = (id) => axios.get(`${baseUrl}/games/${id}`);

const addGame = (newGame) => axios.post(`${baseUrl}/games`, newGame);

const deleteGame = (gameId) => axios.delete(`${baseUrl}/games/${gameId}`);

const updateGame = (gameId, updatedGame) => axios.put(`${baseUrl}/games/${gameId}`, updatedGame);

export default {
  getAllActiveGames,
  getGameById,
  getFilteredGames,
  getGamesContributedByAuthedUser,
  getLatestGames,
  getMostPopularGames,
  addGame,
  deleteGame,
  updateGame,
};
