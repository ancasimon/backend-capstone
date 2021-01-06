import React from 'react';
import {
  Button,
  Form,
  FormGroup,
  Label,
  Input,
} from 'reactstrap';

import FileUpload from '../../shared/FileUpload/FileUpload';
import MyContributions from '../../shared/MyContributions/MyContributions';

import { baseUrl } from '../../../helpers/constants.json';
import uploadFile from '../../../helpers/data/fileUpload';
import usersData from '../../../helpers/data/usersData';

import './Profile.scss';

class Profile extends React.Component {
  state = {
    user: {},
    file: {},
  }

  getUser = () => {
    usersData.getSingleUser()
      .then((singleUserResponse) => {
        this.setState({ user: singleUserResponse.data });
      })
      .catch((error) => console.error('Unable to get user data.', error));
  }

  componentDidMount() {
    this.getUser();
  }

  render() {
    const { user } = this.state;

    const uploadOnClick = () => {
      const { file } = this.state;
      uploadFile.uploadFile(file)
        .then((fileIdResponse) => {
          this.getUser();
        })
        .catch((error) => console.error('Unable to upload image file.', error));
    };

    return (
      <div className="Profile">
        <h2 className="pageTitle">My Profile</h2>
        <div className="container">
          <div className="row">
            <div className="col-md-6">
              <h4>Hello, {user.firstName} {user.lastName}!</h4>
              <p>Active member since: {user.activeDate}</p>
              <p>User ID: {user.id}</p>
              <p>Email: {user.email}</p>
            </div>
            <div className="col-md-6">
              <img src={`${baseUrl}/images/${user.imageFileId}`} alt="user photo" className="userPhoto"/>
              <FormGroup>
                <FileUpload onChange={(file) => this.setState({ file })} />
                <button onClick={uploadOnClick} className="mainButtons p-2 m-2">Click Here to Upload</button>
              </FormGroup>
            </div>
          </div>
          <div className="row">
            <MyContributions />
          </div>
        </div>
      </div>
    );
  }
}

export default Profile;
