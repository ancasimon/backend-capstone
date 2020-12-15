import axios from 'axios';
import { baseUrl } from '../constants.json';

const getAllActiveGames = () => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/games/all`)
    .then((gamesResponse) => {
      resolve(gamesResponse.data);
    })
    .catch((error) => reject(error));
});

// Passing in filter values for selected games:
const getFilteredGames = (searchInput, selectedAges, selectedInstruments, selectedPreworkLevels) => new Promise((resolve, reject) => {
  const buildAgeFilters = () => selectedAges.map((age) => `selectedAges=${age}`);
  const buildInstrumentFilters = () => selectedInstruments.map((instrument) => `selectedInstruments=${instrument}`);
  const buildPreworkLevelFilters = () => selectedPreworkLevels.map((preworkLevel) => `selectedPreworkLevels=${preworkLevel}`);
  axios.get(`${baseUrl}/games?searchInput=${searchInput}&${buildAgeFilters()}&${buildInstrumentFilters()}&${buildPreworkLevelFilters()}`)
    .then((filteredGamesResponse) => {
      resolve(filteredGamesResponse.data);
      console.error('selected filters passed to backend', searchInput, selectedAges, selectedInstruments, selectedPreworkLevels);
    })
    .catch((error) => reject(error));
});

const getGameById = (id) => axios.get(`${baseUrl}/games/${id}`);

export default { getAllActiveGames, getGameById, getFilteredGames };
