import React from 'react';
import PropTypes from 'prop-types';

import authData from '../../../helpers/data/authData';
import usersData from '../../../helpers/data/usersData';

import userShape from '../../../helpers/propz/userShape';

import './Home.scss';

class Home extends React.Component {
  static propTypes = {
    authed: PropTypes.bool.isRequired,
    user: userShape.userShape,
  }

  render() {
    const { authed, user } = this.props;

    return (
      <div className="Home">
        {
          authed ? <h2 className="pageTitle">Welcome to Unlimited, {user.firstName}!</h2> : <h2 className="pageTitle">Welcome to Unlimited!</h2>
        }
      </div>
    );
  }
}

export default Home;
