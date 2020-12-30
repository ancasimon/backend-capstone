import React from 'react';
import { Link } from 'react-router-dom';
import {
  Col,
  Button,
  Form,
  FormGroup,
  Label,
  Input,
  FormText,
} from 'reactstrap';

import agesData from '../../../helpers/data/agesData';
import gameIconsData from '../../../helpers/data/gameIconsData';
import gamesData from '../../../helpers/data/gamesData';
import instrumentsData from '../../../helpers/data/instrumentsData';
import preworkLevelsData from '../../../helpers/data/preworkLevelsData';

import './GameNewOrEdit.scss';

class GameNewOrEdit extends React.Component {
  state = {
    newGameForm: true,
    agesList: [],
    instrumentsList: [],
    preworkLevelsList: [],
    gameIcons: [],
    gameName: '',
    gameDescription: '',
    gameInstruments: [1],
    gameAges: [5],
    gamePreworkLevel: 1,
    gamePrework: '',
    gameInstructions: '',
    gamePhoto: '',
    gameCredit: '',
    gameWebsite: '',
    gameIcon: 42,
    gameKeywords: '',
    gameSongs: '',
    currentGameId: this.props.match.params.gameid * 1,
    currentGame: {},
  }

  componentDidMount() {
    this.buildNewGameForm();
  }

  buildNewGameForm = () => {
    this.getAges();
    this.getInstruments();
    this.getPreworkLevels();
    this.getGameIcons();
    this.getCurrentGame();
  }

  getCurrentGame = () => {
    const { currentGameId } = this.state;
    if (currentGameId) {
      this.setState({ newGameForm: false });
      gamesData.getGameById(currentGameId)
        .then((currentGameResponse) => {
          this.setState({
            gameName: currentGameResponse.data.name,
            gameDescription: currentGameResponse.data.description,
            gameInstruments: currentGameResponse.data.instrumentsForGame,
            gameAges: currentGameResponse.data.agesForGame,
            gamePreworkLevel: currentGameResponse.data.preworkLevelId,
            gamePrework: currentGameResponse.data.prework,
            gameInstructions: currentGameResponse.data.instructions,
            gamePhoto: currentGameResponse.data.photoUrl,
            gameCredit: currentGameResponse.data.credit,
            gameWebsite: currentGameResponse.data.websiteUrl,
            gameIcon: currentGameResponse.data.gameIconId,
            gameKeywords: currentGameResponse.data.keyowrds,
            gameSongs: currentGameResponse.data.songs,
          });
        })
        .catch((error) => console.error('Could not get current game.', error));
    }
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

  getGameIcons = () => {
    gameIconsData.getGameIcons()
      .then((gameIconsResponse) => {
        this.setState({ gameIcons: gameIconsResponse });
      });
  }

  // change functions for the fields on the new game form:
  changeGameName = (e) => {
    e.preventDefault();
    this.setState({ gameName: e.target.value });
  }

  changeGameDescription = (e) => {
    e.preventDefault();
    this.setState({ gameDescription: e.target.value });
  }

  changeGameIcon = (e) => {
    e.preventDefault();
    this.setState({ gameIcon: e.target.value * 1 });
  }

  changeInstruments = (event) => {
    const opts = [];
    let opt;
    for (let i = 0, len = event.target.options.length; i < len; i += 1) {
      opt = event.target.options[i];
      if (opt.selected) {
        opts.push(opt.value * 1);
      }
    }
    this.setState({ gameInstruments: opts });
  }

  changeAges = (event) => {
    const opts = [];
    let opt;
    for (let i = 0, len = event.target.options.length; i < len; i += 1) {
      opt = event.target.options[i];
      if (opt.selected) {
        opts.push(opt.value * 1);
      }
    }
    this.setState({ gameAges: opts });
  }

  changeGameKeywords = (e) => {
    e.preventDefault();
    this.setState({ gameKeywords: e.target.value });
  }

  changeGameSongs = (e) => {
    e.preventDefault();
    this.setState({ gameSongs: e.target.value });
  }

  changeGamePreworkLevel = (e) => {
    e.preventDefault();
    this.setState({ gamePreworkLevel: e.target.value * 1 });
  }

  changeGamePrework = (e) => {
    e.preventDefault();
    this.setState({ gamePrework: e.target.value });
  }

  changeGameInstructions = (e) => {
    e.preventDefault();
    this.setState({ gameInstructions: e.target.value });
  }

  changeGamePhoto = (e) => {
    e.preventDefault();
    this.setState({ gamePhoto: e.target.value });
  }

  changeGameCredit = (e) => {
    e.preventDefault();
    this.setState({ gameCredit: e.target.value });
  }

  changeGameWebsite = (e) => {
    e.preventDefault();
    this.setState({ gameWebsite: e.target.value });
  }

  saveNewGame = () => {
    const {
      gameName,
      gameDescription,
      gameInstruments,
      gameAges,
      gamePreworkLevel,
      gamePrework,
      gameInstructions,
      gamePhoto,
      gameCredit,
      gameWebsite,
      gameIcon,
      gameKeywords,
      gameSongs,
    } = this.state;
    const newGameObject = {
      name: gameName,
      description: gameDescription,
      preworkLevelId: gamePreworkLevel,
      prework: gamePrework,
      instructions: gameInstructions,
      photoUrl: gamePhoto,
      credit: gameCredit,
      website: gameWebsite,
      gameIconId: gameIcon,
      keyowrds: gameKeywords,
      songs: gameSongs,
      gameInstruments,
      gameAges,
    };
    console.error('gameInsList', gameInstruments);
    console.error('gameAgeList', gameAges);
    console.error('new game', newGameObject);
    gamesData.addGame(newGameObject)
      .then((newGameResponse) => {
        console.error('new game just created', newGameResponse);
        this.props.history.push(`/games/${newGameResponse.data}`);
      })
      .catch((error) => console.error('Could not create the new game.', error));
  }

  render() {
    const {
      agesList,
      instrumentsList,
      preworkLevelsList,
      gameIcons,
      gameName,
      gameDescription,
      gameInstruments,
      gameAges,
      gamePreworkLevel,
      gamePrework,
      gameInstructions,
      gamePhoto,
      gameCredit,
      gameWebsite,
      gameIcon,
      gameKeywords,
      gameSongs,
      newGameForm,
    } = this.state;

    const buildAgesList = () => agesList.map((age) => (
      <option
        key={age.id}
        value={age.id}
      >{age.name}</option>
    ));

    const buildInstrumentsList = () => instrumentsList.map((instrument) => (
      <option
        key={instrument.id}
        value={instrument.id}
      >{instrument.name}</option>
    ));

    const buildPreworkLevelsList = () => preworkLevelsList.map((level) => (
      <option key={level.id} value={level.id}>{level.name}</option>
    ));

    const buildGameIconsList = () => gameIcons.map((icon) => (
      <option key={icon.id} value={icon.id}>{icon.name}</option>
    ));

    return (
      <div className="GameNew">
        { newGameForm
          ? <h2 className="pageTitle">Add a New Game</h2>
          : <h2 className="pageTitle">Update Game: {gameName}</h2>
        }
        <Form>
          <FormGroup row>
            <Label for="gameName" sm={2}>Game Name</Label>
            <Col sm={10}>
              <Input
                type="input"
                name="name"
                id="gameName"
                placeholder="Enter a name for the game."
                value={gameName}
                onChange={this.changeGameName}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameDescription" sm={2}>Description</Label>
            <Col sm={10}>
              <Input
                type="textarea"
                name="description"
                id="gameDescription"
                value={gameDescription}
                onChange={this.changeGameDescription}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameIcon" sm={2}>Select an icon:</Label>
            <Col sm={10}>
              <Input
                type="select"
                name="icon"
                id="gameIcon"
                value={gameIcon}
                onChange={this.changeGameIcon}
              >
                {buildGameIconsList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameInstruments" sm={2}>Select instruments:</Label>
            <Col sm={10}>
              <Input
                type="select"
                name="instruments"
                id="gameInstruments"
                multiple
                value={this.state.gameInstruments}
                onChange={(event) => { this.changeInstruments(event); }}
              >
                {buildInstrumentsList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameAges" sm={2}>Select student ages:</Label>
            <Col sm={10}>
              <Input
                type="select"
                name="ages"
                id="gameAges"
                multiple
                value={this.state.gameAges}
                onChange={this.changeAges}
              >
                {buildAgesList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameKeywords" sm={2}>Keywords</Label>
            <Col sm={10}>
              <Input
                type="textarea"
                name="keywords"
                id="gameKeywords"
                value={gameKeywords}
                onChange={this.changeGameKeywords}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameSongs" sm={2}>Songs</Label>
            <Col sm={10}>
              <Input
                type="textarea"
                name="songs"
                id="gameSongs"
                value={gameSongs}
                onChange={this.changeGameSongs}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gamePreworkLevel" sm={2}>Select the prework level:</Label>
            <Col sm={10}>
              <Input
                type="select"
                name="preworkLevel"
                id="gamePreworkLevel"
                value={gamePreworkLevel}
                onChange={this.changeGamePreworkLevel}
              >
                {buildPreworkLevelsList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gamePrework" sm={2}>Prework Steps</Label>
            <Col sm={10}>
              <Input
                type="textarea"
                name="prework"
                id="gamePrework"
                value={gamePrework}
                onChange={this.changeGamePrework}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameInstructions" sm={2}>Game Instructions</Label>
            <Col sm={10}>
              <Input
                type="textarea"
                name="instructions"
                id="gameInstructions"
                value={gameInstructions}
                onChange={this.changeGameInstructions}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gamePhoto" sm={2}>Photo URL</Label>
            <Col sm={10}>
              <Input
                type="input"
                name="photo"
                id="gamePhoto"
                value={gamePhoto}
                onChange={this.changeGamePhoto}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameCredit" sm={2}>Credit</Label>
            <Col sm={10}>
              <Input
                type="input"
                name="credit"
                id="gameCredit"
                value={gameCredit}
                onChange={this.changeGameCredit}
              />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameWebsite" sm={2}>Game Website</Label>
            <Col sm={10}>
              <Input
                type="input"
                name="website"
                id="gameWebsite"
                value={gameWebsite}
                onChange={this.changeGameWebsite}
              />
            </Col>
          </FormGroup>
          <FormGroup check row>
            { newGameForm
              ? <Col>
              <Button onClick={this.saveNewGame}>Add New Game</Button>
            </Col>
              : <Col>
              <Button onClick={this.editGame}>Save Changes</Button>
            </Col>
            }
          </FormGroup>
        </Form>
      </div>
    );
  }
}

export default GameNewOrEdit;
