import React from 'react';

import usersData from '../../../helpers/data/usersData';

import './Home.scss';

class Home extends React.Component {
  state = {
    user: {},
  }

  componentDidMount() {
    this.getUser();
  }

  getUser = () => {
    usersData.getSingleUser()
      .then((userResponse) => {
        this.setState({ user: userResponse.data });
      })
      .catch((error) => console.error('Could not get user data.', error));
  }

  render() {
    const { user } = this.state;

    return (
      <div className="Home">
        {
          user ? <h2 className="pageTitle">Welcome to Unlimited, {user.firstName}!</h2> : <h2 className="pageTitle">Welcome to Unlimited!</h2>
        }
      </div>
    );
  }
}

export default Home;
