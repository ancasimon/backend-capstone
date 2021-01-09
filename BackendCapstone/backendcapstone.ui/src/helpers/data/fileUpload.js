import axios from 'axios';

import { baseUrl } from '../constants.json';

const uploadFile = (file) => new Promise((resolve, reject) => {
  const form = new FormData();
  form.append('file', file);

  axios.post(`${baseUrl}/images`, form)
    .then((fileResponse) => {
      resolve(fileResponse);
    })
    .catch((error) => reject(error));
});

const uploadPhoto = (file) => new Promise((resolve, reject) => {
  const form = new FormData();
  form.append('file', file);

  axios.post(`${baseUrl}/images/games`, form)
    .then((fileResponse) => {
      resolve(fileResponse);
      console.error('filerespo in data file', fileResponse);
    })
    .catch((error) => reject(error));
});

export default { uploadFile, uploadPhoto };
