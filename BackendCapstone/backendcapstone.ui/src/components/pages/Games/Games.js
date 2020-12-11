import React from 'react';
import { Link } from 'react-router-dom';

import AgeFilterItem from '../../shared/AgeFilterItem/AgeFilterItem';
import GameItem from '../../shared/GameItem/GameItem';
import InstrumentFilterItem from '../../shared/InstrumentFilterItem/InstrumentFilterItem';
import PreworkLevelFilterItem from '../../shared/PreworkLevelFilterItem/PreworkLevelFilterItem';

import agesData from '../../../helpers/data/agesData';
import gamesData from '../../../helpers/data/gamesData';
import instrumentsData from '../../../helpers/data/instrumentsData';
import preworkLevelsData from '../../../helpers/data/preworkLevelsData';

import ageShape from '../../../helpers/propz/ageShape';

import './Games.scss';

class Games extends React.Component {
  state = {
    gamesList: [],
    agesList: [],
    instrumentsList: [],
    preworkLevelsList: [],
  }

  componentDidMount() {
    this.getGames();
    this.getAges();
    this.getInstruments();
    this.getPreworkLevels();
  }

  getGames = () => {
    gamesData.getAllActiveGames()
      .then((gamesResponse) => {
        this.setState({ gamesList: gamesResponse });
      });
  }

  getAges = () => {
    agesData.getAgesList()
      .then((agesResponse) => {
        this.setState({ agesList: agesResponse });
      });
  }

  getInstruments = () => {
    instrumentsData.getInstrumentsList()
      .then((instrumentsResponse) => {
        this.setState({ instrumentsList: instrumentsResponse });
      });
  }

  getPreworkLevels = () => {
    preworkLevelsData.getPreworkLevelsList()
      .then((preworkLevelsResponse) => {
        this.setState({ preworkLevelsList: preworkLevelsResponse });
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

    const buildInstrumentFilters = () => instrumentsList.map((instrument) => (
      <InstrumentFilterItem key={instrument.id} instrumentFilter={instrument} />
    ));

    const buildPreworkLevelsFilters = () => preworkLevelsList.map((level) => (
      <PreworkLevelFilterItem key={level.id} preworkLevelFilter={level} />
    ));

    return (
      <div className="Games container">
        <div className="row">
          <div className="col-md-3 topMargin">
            <div className="row">
              <div className="col-md-6">
                <h3>Filter</h3>
              </div>
              <div className="col-md-6">
                <button type="button" className="mainButtons">Clear All</button>
              </div>
            </div>
            <div>
              <h4>Age</h4>
              {buildAgeFilters()}
            </div>
            <div>
              <h4>Instrument</h4>
              {buildInstrumentFilters()}
            </div>
            <div>
              <h4>Prework Level</h4>
              {buildPreworkLevelsFilters()}
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
