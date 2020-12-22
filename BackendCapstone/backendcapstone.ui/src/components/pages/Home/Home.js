import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

import authData from '../../../helpers/data/authData';
import gamesData from '../../../helpers/data/gamesData';
import usersData from '../../../helpers/data/usersData';

import userShape from '../../../helpers/propz/userShape';

import './Home.scss';

class Home extends React.Component {
  static propTypes = {
    authed: PropTypes.bool.isRequired,
    user: userShape.userShape,
  }

  state = {
    latestGames: [],
  }

  getLatestGames = () => {
    gamesData.getLatestGames()
      .then((latestGamesResponse) => {
        this.setState({ latestGames: latestGamesResponse });
      })
      .catch((error) => console.error('Could not get latest games.', error));
  }

  componentDidMount() {
    this.getLatestGames();
  }

  render() {
    const { authed, user } = this.props;
    const { latestGames } = this.state;

    const buildLatestGames = () => latestGames.map((game) => (
      <p>{game.name}</p>
    ));

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
        <div>
          <h3>Our Latest games</h3>
          {buildLatestGames()}
        </div>
      </div>
    );
  }
}

export default Home;
