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
  Dropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
} from 'reactstrap';
import Swal from 'sweetalert2';

import FileUpload from '../../shared/FileUpload/FileUpload';

import { baseUrl } from '../../../helpers/constants.json';
import uploadFile from '../../../helpers/data/fileUpload';

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
    gameCredit: '',
    gameWebsite: '',
    gameIcon: 42,
    gameKeywords: '',
    gameSongs: '',
    currentGameId: this.props.match.params.gameid * 1,
    currentGame: {},
    file: {},
    gamePhotoId: 0,
    iconsDropdownOpen: false,
    selectedIconUrl: '',
  }

  componentDidMount() {
    this.buildNewGameForm();
  }

  buildNewGameForm = () => {
    this.getCurrentGame();
    this.getAges();
    this.getInstruments();
    this.getPreworkLevels();
    this.getGameIcons();
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
            gameInstruments: currentGameResponse.data.instrumentIdsForGame,
            gameAges: currentGameResponse.data.ageIdsForGame,
            gamePreworkLevel: currentGameResponse.data.preworkLevelId,
            gamePrework: currentGameResponse.data.prework,
            gameInstructions: currentGameResponse.data.instructions,
            gameCredit: currentGameResponse.data.credit,
            gameWebsite: currentGameResponse.data.websiteUrl,
            gameIcon: currentGameResponse.data.gameIconId,
            gameKeywords: currentGameResponse.data.keywords,
            gameSongs: currentGameResponse.data.songs,
            gamePhotoId: currentGameResponse.data.gamePhotoId,
            selectedIconUrl: currentGameResponse.data.gameIconUrl,
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

  toggleIconsDropdown = () => {
    this.setState({ iconsDropdownOpen: !this.state.iconsDropdownOpen });
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
    console.error('e.target', e.target.value);
    this.setState({ gameIcon: e.target.value * 1, selectedIconUrl: e.target.src });
    this.toggleIconsDropdown();
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

  changeGameCredit = (e) => {
    e.preventDefault();
    this.setState({ gameCredit: e.target.value });
  }

  changeGameWebsite = (e) => {
    e.preventDefault();
    this.setState({ gameWebsite: e.target.value });
  }

  validationAlert = () => {
    Swal.fire('You must specify a NAME for this game.');
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
      gameCredit,
      gameWebsite,
      gameIcon,
      gameKeywords,
      gameSongs,
      gamePhotoId,
      file,
    } = this.state;
    if (gameName === '') {
      this.validationAlert();
    } else if (gamePhotoId === 0 && file.lastModifiedDate) {
      this.validationPhotoSelectedButNotUploaded();
    } else {
      const newGameObject = {
        name: gameName,
        description: gameDescription,
        preworkLevelId: gamePreworkLevel,
        prework: gamePrework,
        instructions: gameInstructions,
        credit: gameCredit,
        websiteUrl: gameWebsite,
        gameIconId: gameIcon,
        keywords: gameKeywords,
        songs: gameSongs,
        gameInstruments,
        gameAges,
        gamePhotoId,
      };
      gamesData.addGame(newGameObject)
        .then((newGameResponse) => {
          this.props.history.push(`/games/${newGameResponse.data}`);
        })
        .catch((error) => console.error('Could not create the new game.', error));
    }
  }

  editGame = () => {
    const {
      currentGameId,
      gameName,
      gameDescription,
      gameInstruments,
      gameAges,
      gamePreworkLevel,
      gamePrework,
      gameInstructions,
      gameCredit,
      gameWebsite,
      gameIcon,
      gameKeywords,
      gameSongs,
      gamePhotoId,
      file,
      fileUploaded,
    } = this.state;
    if (gameName === '') {
      this.validationAlert();
    } else if (file.lastModifiedDate) {
      this.validationPhotoSelectedButNotUploaded();
    } else {
      const updatedGameObject = {
        name: gameName,
        description: gameDescription,
        preworkLevelId: gamePreworkLevel,
        prework: gamePrework,
        instructions: gameInstructions,
        credit: gameCredit,
        websiteUrl: gameWebsite,
        gameIconId: gameIcon,
        keywords: gameKeywords,
        songs: gameSongs,
        instrumentIdsForGame: gameInstruments,
        ageIdsForGame: gameAges,
        gamePhotoId,
      };
      gamesData.updateGame(currentGameId, updatedGameObject)
        .then((updatedGameResponse) => {
          this.props.history.push(`/games/${currentGameId}`);
        })
        .catch((error) => console.error('Could not save your changes to this game.', error));
    }
  }

  validationNoPhotoSelected = () => {
    Swal.fire('You must first choose a photo to upload.');
  }

  confirmationPhotoUploaded = () => {
    Swal.fire('Your photo has been uploaded.');
  }

  validationPhotoSelectedButNotUploaded = () => {
    Swal.fire('Please upload the photo you have selected.');
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
      gameCredit,
      gameWebsite,
      gameIcon,
      gameKeywords,
      gameSongs,
      newGameForm,
      fileUploaded,
      iconsDropdownOpen,
      selectedIconUrl,
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

    const buildGameIconsList = () => this.state.gameIcons.map((icon) => (
      // <DropdownItem key={icon.id} className="container" value={icon.id} icon={icon} onClick={this.changeGameIcon} src={icon.iconUrl}><img src={icon.iconUrl} alt="icon link" className="icon" /></DropdownItem>
      <img src={icon.iconUrl} alt="icon path" className="icon" key={icon.id} value={icon.id} onClick={this.changeGameIcon} />
    ));

    const uploadPhotoOnClick = (e) => {
      e.preventDefault();
      const { file } = this.state;
      if (file.lastModifiedDate) {
        uploadFile.uploadPhoto(file)
          .then((newPhotoFileResponse) => {
            console.error('newphotofile', newPhotoFileResponse);
            this.setState({ gamePhotoId: newPhotoFileResponse.data, file: {} });
            this.confirmationPhotoUploaded();
          })
          .catch((error) => console.error('Unable to upload photo.', error));
      } else {
        this.validationNoPhotoSelected();
      }
    };

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
          <Label for="selectedIcon" sm={2}>Select an Icon:</Label>
          <Dropdown direction="right" isOpen={iconsDropdownOpen} toggle={this.toggleIconsDropdown} sm={10}>
            <DropdownToggle className="container mainButtons p-2" caret>
              Click Here
              </DropdownToggle>
            <DropdownMenu className="container">
              {buildGameIconsList()}
            </DropdownMenu>
          </Dropdown>
          </FormGroup>
          <FormGroup row>
            <Label for="selectedIcon" sm={2}>Selected Icon:</Label>
            <Col sm={1}>
              <img src={selectedIconUrl} className="icon" />
            </Col>
          </FormGroup>
          <FormGroup row>
            <Label for="gameInstruments" sm={2}>Select Instruments:</Label>
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
            <Label for="gameAges" sm={2}>Select Student Ages:</Label>
            <Col sm={10}>
              <Input
                type="select"
                name="ages"
                id="gameAges"
                multiple
                value={this.state.gameAges}
                onChange={(event) => { this.changeAges(event); }}
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
            <Label for="gamePreworkLevel" sm={2}>Select Prework Level:</Label>
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
            <FileUpload fileUploaded={fileUploaded} onChange={(file) => this.setState({ file })} />
            <button onClick={uploadPhotoOnClick} className="mainButtons p-2">Click Here to Upload</button>
          </FormGroup>
          <FormGroup row>
          <div>
            {
              (this.state.gamePhotoId !== 0)
                ? <div><p>Selected Photo: </p><img src={`${baseUrl}/images/${this.state.gamePhotoId}`} alt="game photo" className="userPhoto"/></div>
                : 'No selected photo.'
            }
            </div>
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
              <Button onClick={this.saveNewGame} className="mainButtons p-2">Add New Game</Button>
            </Col>
              : <Col>
              <Button onClick={this.editGame} className="mainButtons p-2">Save Changes</Button>
            </Col>
            }
          </FormGroup>
        </Form>
      </div>
    );
  }
}

export default GameNewOrEdit;
