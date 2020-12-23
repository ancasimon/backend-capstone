import React from 'react';
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
import instrumentsData from '../../../helpers/data/instrumentsData';
import preworkLevelsData from '../../../helpers/data/preworkLevelsData';

import './GameNew.scss';

class GameNew extends React.Component {
  state = {
    agesList: [],
    instrumentsList: [],
    preworkLevelsList: [],
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
  }

  componentDidMount() {
    this.buildNewGameForm();
  }

  buildNewGameForm = () => {
    this.getAges();
    this.getInstruments();
    this.getPreworkLevels();
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

  // change functions for the fields on the new game form:
  changeGameName = (e) => {
    e.preventDefault();
    this.setState({ gameName: e.target.value });
  }

  changeGameDescription = (e) => {
    e.preventDefault();
    this.setState({ gameDescription: e.target.value });
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
    } = this.state;
    const newGameObject = {
      name: gameName,
      description: gameDescription,
      preworkLevel: gamePreworkLevel,
      prework: gamePrework,
      instructions: gameInstructions,
      photoUrl: gamePhoto,
      credit: gameCredit,
      website: gameWebsite,
    };
    gameInstruments.forEach((item) => {
      const newGameInstrumentObject = {
        instrumentId: item.id,
      };
      console.error('new inst', newGameInstrumentObject);
    });
    gameAges.forEach((item) => {
      const newGameAgeObject = {
        ageId: item.id,
      };
      console.error('new age', newGameAgeObject);
    });
    console.error('new game', newGameObject);
  }

  render() {
    const {
      agesList,
      instrumentsList,
      preworkLevelsList,
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

    return (
      <div className="GameNew">
        <h2 className="pageTitle">Add a New Game</h2>
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
            <Col>
              <Button onClick={this.saveNewGame}>Submit</Button>
            </Col>
          </FormGroup>
        </Form>
      </div>
    );
  }
}

export default GameNew;
