import axios from 'axios';
import { baseUrl } from '../constants.json';

const getSingleUser = () => axios.get(`${baseUrl}/users/user`);

export default { getSingleUser };
