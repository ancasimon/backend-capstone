import axios from 'axios';

import { baseUrl } from '../constants.json';

const uploadFile = (file) => new Promise((resolve, reject) => {
  const form = new FormData();
  form.append('file', file);

  axios.post(`${baseUrl}/images`, form)
    .then((fileResponse) => {
      resolve(fileResponse);
      console.error('new file to upload', file);
      console.error('file uploaded response', fileResponse);
    })
    .catch((error) => reject(error));
});

export default { uploadFile };
