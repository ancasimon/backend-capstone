import axios from 'axios';
import { baseUrl } from '../constants.json';

const updatePracticePlanGame = (id, updatedPracticePlanGameRecord) => axios.put(`${baseUrl}/practiceplangames/${id}`, updatedPracticePlanGameRecord);

const createNewPracticePlanGame = (newPracticePlanGameRecord) => axios.post(`${baseUrl}/practiceplangames`, newPracticePlanGameRecord);

export default { updatePracticePlanGame, createNewPracticePlanGame };
