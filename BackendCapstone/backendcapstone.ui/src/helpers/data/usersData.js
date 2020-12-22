import axios from 'axios';
import { baseUrl } from '../constants.json';

const getSingleUser = () => axios.get(`${baseUrl}/users/user`);

const checkUserEmail = (email) => axios.get(`${baseUrl}/users/email/${email}`);

export default { getSingleUser, checkUserEmail };
