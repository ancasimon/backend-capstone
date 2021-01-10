import React from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';

import gamesData from '../../../helpers/data/gamesData';

import './ChartLatestGames.scss';

class ChartLatestGames extends React.Component {
  state = {
    data: [],
  }

  getLatestGames = () => {
    gamesData.getLatestGames()
      .then((latestGamesResponse) => {
        this.setState({ data: latestGamesResponse });
      })
      .catch((error) => console.error('Could not get latest games.', error));
  }

  componentDidMount() {
    this.getLatestGames();
  }

  render() {
    const { data } = this.state;
    const buildLatestGames = () => data.map((entry) => (
      <Link to={`/games/${entry.id}`} key={entry.id} gameid={entry.id} className="orangeList">{entry.name}: {moment(entry.dateCreated).format('L')}<br /></Link>
    ));

    return (
      <div className="ChartLatestGames">
        <ul>
          {buildLatestGames()}
        </ul>
      </div>
    );
  }
}

export default ChartLatestGames;
