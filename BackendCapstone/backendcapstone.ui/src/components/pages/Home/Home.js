import React from 'react';
import authData from '../../../helpers/data/authData';

import usersData from '../../../helpers/data/usersData';

import './Home.scss';

class Home extends React.Component {
  state = {
    user: {},
    userLoggedIn: false,
  }

  componentDidMount() {
    this.getUser();
  }

  getUser = () => {
    usersData.getSingleUser()
      .then((userResponse) => {
        this.setState({ user: userResponse.data, userLoggedIn: true });
      })
      .catch((error) => console.error('Could not get user data.', error));
  }

  render() {
    const { user, userLoggedIn } = this.state;

    return (
      <div className="Home">
        {
          userLoggedIn === false ? <h2 className="pageTitle">Welcome to Unlimited!</h2> : <h2 className="pageTitle">Welcome to Unlimited, {user.firstName}!</h2>
        }
      </div>
    );
  }
}

export default Home;
