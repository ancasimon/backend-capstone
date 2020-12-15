import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import $ from 'jquery';

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
    selectedAges: [],
    selectedInstruments: [],
    selectedPreworkLevels: [],
    filteredGamesList: [],
    searchInput: '',
  }

  componentDidMount() {
    this.buildGamesPage();
  }

  buildGamesPage = () => {
    this.getGames();
    this.getAges();
    this.getInstruments();
    this.getPreworkLevels();
    this.clearCheckboxes();
  }

  clearCheckboxes = () => {
    { $('.filterCheckbox').prop('checked', false); }
    this.setState({
      selectedAges: [],
      selectedInstruments: [],
      selectedPreworkLevels: [],
      searchInput: '',
    });
  }

  getGames = () => {
    gamesData.getAllActiveGames()
      .then((gamesResponse) => {
        this.setState({ gamesList: gamesResponse });
      });
  }

  getFilteredGamesList = () => {
    const {
      selectedAges,
      selectedInstruments,
      selectedPreworkLevels,
      searchInput,
    } = this.state;
    gamesData.getFilteredGames(searchInput, selectedAges, selectedInstruments, selectedPreworkLevels)
      .then((filteredGamesResponse) => {
        this.setState({ filteredGamesList: filteredGamesResponse, gamesList: filteredGamesResponse });
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

  changeSearchInput = (e) => {
    e.preventDefault();
    this.setState({ searchInput: e.target.value });
    console.error('searchinput in state', this.state.searchInput);
  }

  changeAgeFilter = (e) => {
    const { selectedAges } = this.state;
    if (e.target.checked === true) {
      this.setState({ selectedAges: [...this.state.selectedAges, e.target.value] });
    } else if (e.target.checked === false) {
      const index = this.state.selectedAges.indexOf(e.target.value);
      if (index > -1) {
        this.state.selectedAges.splice(index, 1);
        this.setState({ selectedAges });
        this.getFilteredGamesList();
      }
    }
  }

  changeInstrumentFilter = (e) => {
    const { selectedInstruments } = this.state;
    if (e.target.checked === true) {
      this.setState({ selectedInstruments: [...this.state.selectedInstruments, e.target.value] });
    } else if (e.target.checked === false) {
      const index = this.state.selectedInstruments.indexOf(e.target.value);
      if (index > -1) {
        this.state.selectedInstruments.splice(index, 1);
        this.setState({ selectedInstruments });
        this.getFilteredGamesList();
      }
    }
  }

  changePreworkLevelFilter = (e) => {
    const { selectedPreworkLevels } = this.state;
    if (e.target.checked === true) {
      this.setState({ selectedPreworkLevels: [...this.state.selectedPreworkLevels, e.target.value] });
    } else if (e.target.checked === false) {
      const index = this.state.selectedPreworkLevels.indexOf(e.target.value);
      if (index > -1) {
        this.state.selectedPreworkLevels.splice(index, 1);
        this.setState({ selectedPreworkLevels });
        this.getFilteredGamesList();
      }
    }
  }

  // componentDidUpdate(prevProps, prevState) {
  //   if (prevState.selectedAges !== this.state.selectedAges
  //   || prevState.selectedInstruments !== this.state.selectedInstruments
  //   || prevState.selectedPreworkLevels !== this.state.selectedPreworkLevels
  //   // || prevState.searchInput != this.state.searchInput
  //   ) {
  //     console.error('get filtered list now');
  //     this.getFilteredGamesList();
  //   }
  // }

  render() {
    const {
      gamesList,
      agesList,
      instrumentsList,
      preworkLevelsList,
      selectedAges,
      selectedInstruments,
      selectedPreworkLevels,
      searchInput,
    } = this.state;

    const buildGames = () => gamesList.map((game) => (
      <GameItem key={game.id} gameItem={game} />
    ));

    const buildAgeFilters = () => agesList.map((age) => (
      <AgeFilterItem key={age.id} ageFilter={age} onClick={this.changeAgeFilter} />
    ));

    const buildInstrumentFilters = () => instrumentsList.map((instrument) => (
      <InstrumentFilterItem key={instrument.id} instrumentFilter={instrument} onClick={this.changeInstrumentFilter} />
    ));

    const buildPreworkLevelsFilters = () => preworkLevelsList.map((level) => (
      <PreworkLevelFilterItem key={level.id} preworkLevelFilter={level} onClick={this.changePreworkLevelFilter} />
    ));

    return (
      <div className="Games container">
        <div className="row">
          <div className="col-md-3">
            <div className="row">
              <div className="col-md-6">
                <h3>Filter</h3>
              </div>
              <div className="col-md-6 buttonDiv">
                <button type="button" className="mainButtons p-2" onClick={this.buildGamesPage}>Clear</button>
              </div>
            </div>
            <div className="row">
              <div className="col-md-6 buttonDiv">
                <form>
                  <input type="text" placeholder="Search keywords" name="search" value={searchInput} onChange={this.changeSearchInput} />
                </form>
              </div>
              <div className="col-md-6 buttonDiv">
                <button type="button" className="mainButtons p-2" onClick={this.getFilteredGamesList}><i className="fas fa-search"></i></button>
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
