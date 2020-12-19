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
        <p>We're glad you're here!</p>
        <p>
          Go ahead, check out our database of fun games for the young musicians in your family. 
          Register with us and you can take your practice planning to a next level - and will you be glad you did! 
          You will be able to create practice plans, select games for each practice, and keep notes about how they went and maybe what to do differently or the same next time!
          You can even keep track of whether your child completed the scheduled practices for a given plan!
          And you know what all those completed checkboxes can mean - an extra trip to the treasure box! Or whatever their preffered incentive may be!
        </p>
      </div>
    );
  }
}

export default Home;
