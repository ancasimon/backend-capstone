import axios from 'axios';
import { baseUrl } from '../constants.json';

const updatePracticePlanGame = (id, updatedPracticePlanGameRecord) => axios.put(`${baseUrl}/practiceplangames/${id}`, updatedPracticePlanGameRecord);

export default { updatePracticePlanGame };
