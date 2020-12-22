import React from 'react';
import { Link } from 'react-router-dom';
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
        <p>We're glad you're here!</p>
        <h6>Go ahead, check out our <Link to='/games'>database of fun games</Link> for the young musicians in your family.</h6>
        <h6>
          <Link to='/register'>Register</Link> with us and you can take your practice planning to a next level - and will you be glad you did!
        </h6>
      </div>
    );
  }
}

export default Home;
