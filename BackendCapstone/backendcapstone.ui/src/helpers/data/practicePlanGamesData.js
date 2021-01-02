import axios from 'axios';
import { baseUrl } from '../constants.json';

const updatePracticePlanGame = (id, updatedPracticePlanGameRecord) => axios.put(`${baseUrl}/practiceplangames/${id}`, updatedPracticePlanGameRecord);

const createNewPracticePlanGame = (newPracticePlanGameRecord) => axios.post(`${baseUrl}/practiceplangames`, newPracticePlanGameRecord);

const getPracticePlanGamesByPlanId = (planId) => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/practiceplangames/plan/${planId}`)
    .then((ppgResponse) => {
      resolve(ppgResponse.data);
    })
    .catch((error) => reject(error));
});

export default { updatePracticePlanGame, createNewPracticePlanGame, getPracticePlanGamesByPlanId };
