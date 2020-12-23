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
  }

  componentDidMount() {
    this.buildNewGameForm();
  }

  buildNewGameForm = () => {
    this.getAges();
    this. getInstruments();
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

  render() {
    const { agesList, instrumentsList, preworkLevelsList } = this.state;

    const buildAgesList = () => agesList.map((age) => (
      <option>{age.name}</option>
    ));

    const buildInstrumentsList = () => instrumentsList.map((instrument) => (
      <option key={instrument.id} value={instrument.id}>{instrument.name}</option>
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
              <Input type="input" name="name" id="gameName" placeholder="Enter a name for the game." />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameDescription" sm={2}>Description</Label>
            <Col sm={10}>
              <Input type="textarea" name="description" id="gameDescription" />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameInstruments" sm={2}>Select instruments:</Label>
            <Col sm={10}>
              <Input type="select" name="instruments" id="gameInstruments" multiple>
                {buildInstrumentsList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameAges" sm={2}>Select student ages:</Label>
            <Col sm={10}>
              <Input type="select" name="ages" id="gameAges" multiple>
                {buildAgesList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gamePreworkLevel" sm={2}>Select the prework level:</Label>
            <Col sm={10}>
              <Input type="select" name="preworkLevel" id="gamePreworkLevel">
                {buildPreworkLevelsList()}
              </Input>
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gamePrework" sm={2}>Prework Steps</Label>
            <Col sm={10}>
              <Input type="textarea" name="prework" id="gamePrework" />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameInstructions" sm={2}>Game Instructions</Label>
            <Col sm={10}>
              <Input type="textarea" name="instructions" id="gameInstructions" />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gamePhoto" sm={2}>Photo URL</Label>
            <Col sm={10}>
              <Input type="input" name="photo" id="gamePhoto" />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameCredit" sm={2}>Credit</Label>
            <Col sm={10}>
              <Input type="input" name="credit" id="gameCredit" />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameWebsite" sm={2}>Game Website</Label>
            <Col sm={10}>
              <Input type="input" name="website" id="gameWebsite" />
            </Col>
          </FormGroup>
          <FormGroup check row>
            <Col>
              <Button>Submit</Button>
            </Col>
          </FormGroup>
        </Form>
      </div>
    );
  }
}

export default GameNew;
