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
import moment from 'moment';
import PropTypes from 'prop-types';
import Swal from 'sweetalert2';
import { baseUrl } from '../../../helpers/constants.json';

import AgeItem from '../../shared/AgeItem/AgeItem';
import InstrumentItem from '../../shared/InstrumentItem/InstrumentItem';
import NewPracticePlanGameModal from '../../shared/NewPracticePlanGameModal/NewPracticePlanGameModal';

import gamesData from '../../../helpers/data/gamesData';
import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';
import practicePlansData from '../../../helpers/data/practicePlansData';

import userShape from '../../../helpers/propz/userShape';

import './SingleGameView.scss';

class SingleGameView extends React.Component {
  static propTypes = {
    user: userShape.userShape,
    authed: PropTypes.bool.isRequired,
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
    credit: '',
    websiteUrl: '',
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
        if (singleGameResponse.data.credit == null) {
          this.setState({ credit: '' });
        } else { this.setState({ credit: singleGameResponse.data.credit }); }
        if (singleGameResponse.data.websiteUrl == null) {
          this.setState({ websiteUrl: '' });
        } else { this.setState({ websiteUrl: singleGameResponse.data.websiteUrl }); }
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
  togglePracticePlansDropdown = () => {
    this.setState({ practicePlansDropdownOpen: !this.state.practicePlansDropdownOpen });
  }

  togglePracticePlansModal = (e) => {
    e.preventDefault();
    this.setState({ practicePlansModal: !this.state.practicePlansModal, selectedPracticePlanId: e.target.value * 1 });
  }

  closePracticePlansModal = () => {
    this.setState({ practicePlansModal: false });
    this.props.history.push('/practiceplans/');
  }

  getPracticePlans = () => {
    practicePlansData.getUserPracticePlans()
      .then((userPracticePlansList) => {
        this.setState({ userPracticePlans: userPracticePlansList });
      })
      .catch((error) => console.error('Could not get your practice plans.', error));
  }

  changeSelectedPracticePlanId = (e) => {
    e.preventDefault();
    this.setState({ selectedPracticePlanId: e.target.value * 1 });
  }

  render() {
    const {
      selectedGame,
      instrumentsForGame,
      agesForGame,
      selectedGameId,
      userPracticePlans,
      selectedPracticePlanId,
      practicePlansDropdownOpen,
      credit,
      websiteUrl,
    } = this.state;
    const { user, authed } = this.props;

    const displayInstruments = () => instrumentsForGame.map((instrument) => (
      <InstrumentItem key={instrument.id} instrument={instrument} />
    ));

    const displayAges = () => agesForGame.map((age) => (
      <AgeItem key={age.id} age={age} />
    ));

    const buildPracticePlansDropdownOptions = () => userPracticePlans.map((plan) => (
      <DropdownItem key={plan.planId} value={plan.planId} plan={plan} onClick={this.togglePracticePlansModal}>{plan.name} starting on {moment(plan.startDate).format('L')}</DropdownItem>
    ));

    const buildModal = () => (
      <NewPracticePlanGameModal
        gameId={selectedGameId}
        practicePlanId={selectedPracticePlanId}
        closeModal={this.closePracticePlansModal}
      />
    );

    return (
      <div className="SingleGameView">
        <div className="container">
          <div className="row container">
            <div className="col-md-9">
              <h2 className="pageTitle">Game Details: {selectedGame.name}</h2>
            </div>
            <div className="col-md-3 buttonDiv">
              <Link to='/games' className="mainButtons p-2 m-2">Back</Link>
            </div>
          </div>
          <div className="row p-3 container">
            {
            (authed && user.id === selectedGame.submittedByUserId)
              ? <div className="col-md-3 container m-2 mb-3">
              <Link to={`/games/edit/${selectedGameId}`} className="mainButtons p-2">Edit</Link>
            </div>
              : ''
            }
            {
            (authed && user.id === selectedGame.submittedByUserId && selectedGame.hasAssociatedPracticePlanGames === false)
              ? <div className="col-md-3 container mb-2">
              <button className="mainButtons p-2" onClick={this.deleteConfirmationMessage}>Delete</button>
            </div>
              : ''
            }
            {
              (authed)
                ? <div className="col-md-3 container">
                <FormGroup>
                    <Dropdown isOpen={practicePlansDropdownOpen} toggle={this.togglePracticePlansDropdown}>
                      <DropdownToggle caret className="mainButtons p-2">
                        Add to Practice Plan
                      </DropdownToggle>
                      <DropdownMenu>
                        {buildPracticePlansDropdownOptions()}
                      </DropdownMenu>
                    </Dropdown>
                  </FormGroup>
              </div>
                : ''
            }
          </div>
        </div>

        {/* game data below: */}
        <div className="container">
          <div className="row justify-content-around">
            <div className="col col-md-6">
            {
              (selectedGame.gamePhotoId)
                ? <img src={`${baseUrl}/images/${selectedGame.gamePhotoId}`} alt="game photo" className="gameImage"/>
                : ''
            }
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
                  <img src={`${baseUrl}/images/${selectedGame.imageFileId}`} alt="user photo" className="userPhotoInGame"/>
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
            credit != '' || websiteUrl != ''
              ? <div className="credit">
                {
                credit != ''
                  ? <h6>Credit: {selectedGame.credit}</h6>
                  : ''
                }
                {
              websiteUrl != ''
                ? <a href={selectedGame.websiteUrl} target="_blank"><h6>Click here to visit the website!</h6></a>
                : ''
                }
            </div>
              : ''
          }
      </div>

        {/* code for modal about available practice plans below: */}
        <Modal isOpen={this.state.practicePlansModal} toggle={this.togglePracticePlansModal}>
            {buildModal()}
          </Modal>

      </div>
    );
  }
}

export default SingleGameView;
