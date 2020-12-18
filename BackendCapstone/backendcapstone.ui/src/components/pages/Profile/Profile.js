import React from 'react';

import MyContributions from '../../shared/MyContributions/MyContributions';

import usersData from '../../../helpers/data/usersData';

import './Profile.scss';

class Profile extends React.Component {
  state = {
    user: {},
  }

  getUser = () => {
    usersData.getSingleUser()
      .then((singleUserResponse) => {
        this.setState({ user: singleUserResponse.data });
        console.error('singleUserResp', singleUserResponse);
      })
      .catch((error) => console.error('Unable to get user data.', error));
  }

  componentDidMount() {
    this.getUser();
  }

  render() {
    const { user } = this.state;

    return (
      <div className="Profile">
        <h2 className="pageTitle">My Profile</h2>
        <div className="container">
          <div className="row">
          <div className="col-md-6">
              <img src={user.photoUrl} als="user photo" className="userPhoto"/>
            </div>
            <div className="col-md-6">
              <h4>Hello, {user.firstName} {user.lastName}!</h4>
              <p>Active member since: {user.activeDate}</p>
              <p>User ID: {user.id}</p>
              <p>Email: {user.email}</p>
            </div>
            <div>
              <MyContributions />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Profile;
