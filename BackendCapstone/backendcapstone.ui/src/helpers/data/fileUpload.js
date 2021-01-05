import axios from 'axios';

import { baseUrl } from '../constants.json';

const uploadFile = (file) => new Promise((resolve, reject) => {
  let form = new FormData();
  form.append('file', file);

  axios.post(`${baseUrl}/files`, form)
    .then(() => {
      resolve();
    })
    .catch((error) => reject(error));
})

export default { uploadFile };
