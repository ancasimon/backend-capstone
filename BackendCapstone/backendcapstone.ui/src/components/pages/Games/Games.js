import React from 'react';
import { Link } from 'react-router-dom';

import GameItem from '../../shared/GameItem/GameItem';

import gamesData from '../../../helpers/data/gamesData';

import './Games.scss';

class Games extends React.Component {
  state = {
    gamesList: [],
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
    const { gamesList } = this.state;

    const buildGames = () => gamesList.map((game) => (
      <GameItem key={game.id} gameItem={game} />
    ));

    return (
      <div className="Games container">
        <div className="row">
          <div className="col-md-3 topMargin">
            <p>Filter 1</p>
            <p>Filter 1</p>
            <p>Filter 1</p>
          </div>
          <div className="col-md-9">
            <div className="row">
              <div className="col-md-9">
                <h2 className="text-center">Games</h2>
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
