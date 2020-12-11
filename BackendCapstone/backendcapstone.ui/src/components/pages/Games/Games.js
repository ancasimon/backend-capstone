import React from 'react';
import { Link } from 'react-router-dom';

import AgeFilterItem from '../../shared/AgeFilterItem/AgeFilterItem';
import GameItem from '../../shared/GameItem/GameItem';

import gamesData from '../../../helpers/data/gamesData';

import ageShape from '../../../helpers/propz/ageShape';

import './Games.scss';

class Games extends React.Component {
  state = {
    gamesList: [],
    agesList: [1],
    instrumentsList: [],
    preworkLevelsList: [],
  }

  componentDidMount() {
    this.getGames();
  }

  getGames = () => {
    gamesData.getAllActiveGames()
      .then((gamesResponse) => {
        this.setState({ gamesList: gamesResponse });
      });
  }

  render() {
    const {
      gamesList,
      agesList,
      instrumentsList,
      preworkLevelsList,
    } = this.state;

    const buildGames = () => gamesList.map((game) => (
      <GameItem key={game.id} gameItem={game} />
    ));

    const buildAgeFilters = () => agesList.map((age) => (
      <AgeFilterItem key={age.id} ageFilter={age} />
    ));

    return (
      <div className="Games container">
        <div className="row">
          <div className="col-md-3 topMargin">
            <h3>Filter</h3>
            <div>
              <h4>Age</h4>
              {buildAgeFilters()}
            </div>
          </div>
          <div className="col-md-9">
            <div className="row">
              <div className="col-md-9">
                <h2 className="pageTitle">Games</h2>
              </div>
              <div className="col-sm-3">
                <div className="buttonDiv">
                  <Link to='/games/new' className="mainButtons p-2">Add New Game</Link>
                </div>
              </div>
            </div>
            <div className="d-flex flex-wrap">
              {buildGames()}
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Games;
