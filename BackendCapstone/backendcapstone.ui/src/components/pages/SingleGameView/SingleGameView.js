import React from 'react';
import {
  Col,
  FormText,
  Button,
  Dropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  Form,
  FormGroup,
  Label,
  Input,
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Table,
} from 'reactstrap';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';

import AgeItem from '../../shared/AgeItem/AgeItem';
import InstrumentItem from '../../shared/InstrumentItem/InstrumentItem';

import gamesData from '../../../helpers/data/gamesData';
import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';
import practicePlansData from '../../../helpers/data/practicePlansData';

import userShape from '../../../helpers/propz/userShape';

import './SingleGameView.scss';

class SingleGameView extends React.Component {
  static propTypes = {
    user: userShape.userShape,
  }

  state = {
    selectedGame: {},
    selectedGameId: this.props.match.params.gameid * 1,
    instrumentsForGame: [],
    agesForGame: [],
    // adding the following variable for the feature to allow users to add a game to a practice plan from this page:
    practicePlansDropdownOpen: false,
    practicePlansModal: false,
    selectedPracticePlanId: 0,
    userPracticePlans: [],
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
      })
      .catch((error) => console.error('Could not get this game.', error));
  }

  componentDidMount() {
    this.buildSingleGameView();
    this.getPracticePlans();
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }

  deleteGame = () => {
    const { selectedGameId } = this.state;
    gamesData.deleteGame(selectedGameId)
      .then(() => this.props.history.push('/games'))
      .catch((error) => console.error('Could not delete this game.', error));
  };

  deleteConfirmationMessage = () => {
    Swal.fire({
      title: 'Are you sure you want to delete this game?',
      text: 'You will not be able to undo this action!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#008900',
      cancelButtonColor: '#960018',
      confirmButtonText: 'Yes, delete it!',
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Deleted!',
          'Your game has been deleted.',
          'success',
        );
        this.deleteGame();
      }
    });
  }

  // functions supporting the ability to add this game to an existing practice plan:
  togglePracticePlansModal = () => {
    this.setState({ practicePlansModal: !this.state.practicePlansModal });
  }

  closePracticePlansModal = () => {
    this.setState({ practicePlansModal: false });
  }

  getPracticePlans = () => {
    practicePlansData.getUserPracticePlans()
      .then((userPracticePlansList) => {
        this.setState({ userPracticePlans: userPracticePlansList });
        console.error('pract plans', this.state.userPracticePlans);
      })
      .catch((error) => console.error('Could not get your practice plans.', error));
  }

  changeSelectedPracticePlanId = (e) => {
    e.preventDefault();
    this.setState({ selectedPracticePlanId: e.target.value * 1 });
  }

  savePracticePlanGame = () => {
    const { selectedGameId, selectedGame, selectedPracticePlanId } = this.state;
    const newPracticePlanGame = {
      name: selectedGame.name,
      practicePlanId: selectedPracticePlanId,
      gameId: selectedGameId,
      practiceDate: new Date(),
      userNotes: '',
      isCompleted: false,
    };
    practicePlanGamesData.createNewPracticePlanGame(newPracticePlanGame)
      .then((newPPGameResponse) => {
        console.error('new PPG', newPPGameResponse);
        this.props.history.push(`/practiceplans/${selectedPracticePlanId}`);
      })
      .catch((error) => console.error('We were not able to add this game to your practice plan.', error));
  }

  render() {
    const {
      selectedGame,
      instrumentsForGame,
      agesForGame,
      selectedGameId,
      userPracticePlans,
      selectedPracticePlanId,
    } = this.state;
    const { user } = this.props;

    const displayInstruments = () => instrumentsForGame.map((instrument) => (
      <InstrumentItem key={instrument.id} instrument={instrument} />
    ));

    const displayAges = () => agesForGame.map((age) => (
      <AgeItem key={age.id} age={age} />
    ));

    const buildPracticePlansSelectOptions = () => userPracticePlans.map((plan) => (
      <option key={plan.planId} value={plan.planId}>{plan.name} starting on {plan.startDate}</option>
    ));

    return (
      <div className="SingleGameView">
        <div className="container">
          <div className="row container">
            <div className="col-md-9">
              <h2 className="pageTitle">Game Details: {selectedGame.name}</h2>
            </div>
            <div className="col-md-3 buttonDiv">
              <Link to='/games' className="mainButtons p-2">Back</Link>
            </div>
          </div>
          <div className="row p-3 container">
            {
            (user.id === selectedGame.submittedByUserId)
              ? <div className="col-md-4 container">
              <Link to={`/games/edit/${selectedGameId}`} className="mainButtons p-2">Edit</Link>
            </div>
              : ''
            }
            {
            (user.id === selectedGame.submittedByUserId && selectedGame.hasAssociatedPracticePlanGames === false)
              ? <div className="col-md-4 container">
              <button className="mainButtons p-2" onClick={this.deleteConfirmationMessage}>Delete</button>
            </div>
              : ''
            }
            <div className="col-md-4 container">
              <button className="mainButtons p-2" onClick={this.togglePracticePlansModal}>Add to Practice Plan</button>
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
              <div className="row">
                <div className="col-md-6 verticallyCentered">
                  <h6>Submitted by: {selectedGame.userFirstName} {selectedGame.userLastName}</h6>
                </div>
                <div className="col-md-6">
                  <img src={selectedGame.userPhotoUrl} alt="user photo" className="userPhotoInGame" />
                </div>
              </div>
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

        {/* code for modal about available practice plans below: */}
        <Modal isOpen={this.state.practicePlansModal} toggle={this.togglePracticePlansModal}>
            <ModalHeader toggle={this.togglePracticePlansModal}>Select a Practice Plan:</ModalHeader>
            <ModalBody>
              <div>
              <Form>
                <FormGroup row>
                  <Col sm={10}>
                    <Input
                      type="select"
                      name="selectedPracticePlanId"
                      id="selectedPracticePlanId"
                      value={this.state.selectedPracticePlanId}
                      onChange={this.changeSelectedPracticePlanId}
                    >
                      {buildPracticePlansSelectOptions()}
                    </Input>
                  </Col>
                </FormGroup>
              </Form>
              </div>
            </ModalBody>
            <ModalFooter>
              <Button onClick={this.savePracticePlanGame}>Add</Button>
              <Button onClick={this.closePracticePlansModal}>Cancel</Button>
            </ModalFooter>
          </Modal>

      </div>
    );
  }
}

export default SingleGameView;
