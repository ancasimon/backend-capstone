import React from 'react';
import { Link } from 'react-router-dom';

import AgeItem from '../../shared/AgeItem/AgeItem';
import InstrumentItem from '../../shared/InstrumentItem/InstrumentItem';

import gamesData from '../../../helpers/data/gamesData';

import './SingleGameView.scss';

class SingleGameView extends React.Component {
  state = {
    selectedGame: {},
    selectedGameId: this.props.match.params.gameid,
    instrumentsForGame: [],
    agesForGame: [],
  }

  buildSingleGameView = () => {
    const { selectedGameId } = this.state;
    gamesData.getGameById(selectedGameId)
      .then((singleGameResponse) => {
        this.setState({
          selectedGame: singleGameResponse.data,
          instrumentsForGame: singleGameResponse.data.instrumentsForGame,
          agesForGame: singleGameResponse.data.agesForGame,
        });
        console.error('single game respo', singleGameResponse);
      })
      .catch((error) => console.error('Could not get this game.', error));
  }

  componentDidMount() {
    this.buildSingleGameView();
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }

  render() {
    const { selectedGame, instrumentsForGame, agesForGame } = this.state;

    const displayInstruments = () => instrumentsForGame.map((instrument) => (
      <InstrumentItem key={instrument.id} instrument={instrument} />
    ));

    const displayAges = () => agesForGame.map((age) => (
      <AgeItem key={age.id} age={age} />
    ));

    return (
      <div className="SingleGameView">
        <div className="container">
          <div className="row">
            <div className="col-md-9">
              <h2>Game Details: {selectedGame.name}</h2>
            </div>
            <div className="col-md-3 buttonDiv">
              <Link to='/games' className="mainButtons p-2">Back</Link>
            </div>
          </div>
        </div>

        {/* game data below: */}
        <div className="container">
          <div className="row justify-content-around">
            <div className="col col-md-6">
              <img src={selectedGame.photoUrl} alt="Photo of game in action" className="gameImage" />
            </div>
            <div className="col-md-6">
            <h5>{selectedGame.description}</h5>
              <h6>Instrument(s): {displayInstruments()}</h6>
              {
                (selectedGame.songs != '')
                  ? <h6>Song(s): {selectedGame.songs}</h6>
                  : ''
              }
              <h6>Ages: {displayAges()}</h6>
              <h6>Prework Level: {selectedGame.preworkLevelName}</h6>
              <h6>Keywords: {selectedGame.keywords}</h6>
              <h6>Submitted by: {selectedGame.userFirstName} {selectedGame.userLastName}</h6>
            </div>
          </div>
          <div className="row">
            <div className="col">
              <h6>Prework:</h6>
              <p>{selectedGame.prework}</p>
              <h6>Instructions:</h6>
              {selectedGame.instructions}
            </div>
          </div>
          {
            selectedGame.credit != ''
              ? <div className="row">
              <div className="col credit">
                <h6>Credit: {selectedGame.credit}</h6>
                <a href={selectedGame.websiteUrl} target="_blank"><h6>Click here to visit the website!</h6></a>
              </div>
            </div>
              : ''
          }
        </div>
      </div>
    );
  }
}

export default SingleGameView;
