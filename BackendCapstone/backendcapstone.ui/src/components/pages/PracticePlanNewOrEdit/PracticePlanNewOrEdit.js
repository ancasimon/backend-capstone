import React from 'react';
import {
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
import Swal from 'sweetalert2';
import DatePicker from 'react-datepicker';
import moment from 'moment';
import { parseISO, format } from 'date-fns';

import PracticePlanGameItem from '../../shared/PracticePlanGameItem/PracticePlanGameItem';

import gamesData from '../../../helpers/data/gamesData';
import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';
import practicePlansData from '../../../helpers/data/practicePlansData';

import 'react-datepicker/dist/react-datepicker.css';
import './PracticePlanNewOrEdit.scss';

class PracticePlanNew extends React.Component {
  state = {
    newRecordForm: true,
    practicePlanId: this.props.match.params.practiceplanid * 1,
    practicePlanName: '',
    practicePlanStartDate: new Date(),
    practicePlanEndDate: new Date(),
    practicePlanActive: false,
    gamesList: [],
    gamesDropdownOpen: false,
    gameFormModal: false,
    selectedGameId: 0,
    selectedGame: {},
    practiceGameName: '',
    practiceDate: new Date(),
    practiceNotes: '',
    practiceCompleted: false,
    selectedGames: [],
  }

  componentDidMount() {
    this.buildNewPracticePlanPage();
  }

  buildNewPracticePlanPage = () => {
    this.getCurrentPracticePlan();
    this.getGamesList();
  }

  getPracticePlanDetails = () => {
    practicePlansData.getSinglePracticePlan(this.state.practicePlanId)
      .then((practicePlanIdResponse) => {
        console.error('currentpprespo', practicePlanIdResponse);
        if (practicePlanIdResponse.status === 200) {
          this.setState({
            selectedGames: practicePlanIdResponse.data.plannedGames,
            practicePlanName: practicePlanIdResponse.data.name,
            practicePlanStartDate: parseISO(practicePlanIdResponse.data.startDate),
            practicePlanEndDate: parseISO(practicePlanIdResponse.data.endDate),
            practicePlanActive: practicePlanIdResponse.data.isActive,
          });
        }
      })
      .catch((error) => console.error('Could not upload practice plan data.', error));
  }

  getPracticePlanGamesList = () => {
    practicePlansData.getSinglePracticePlan(this.state.practicePlanId)
      .then((practicePlanIdResponse) => {
        if (practicePlanIdResponse.status === 200) {
          this.setState({
            selectedGames: practicePlanIdResponse.data.plannedGames,
          });
        }
      })
      .catch((error) => console.error('Could not get the games for this practice plan.', error));
  }

  getCurrentPracticePlan = () => {
    if (this.props.match.params.practiceplanid === undefined) {
      this.setState({ practicePlanId: 0, newRecordForm: true });
    } else {
      this.setState({
        practicePlanId: this.props.match.params.practiceplanid * 1,
        newRecordForm: false,
      });
      this.getPracticePlanDetails();
    }
  }

  getGamesList = () => {
    gamesData.getAllActiveGames()
      .then((gamesListResponse) => {
        this.setState({ gamesList: gamesListResponse });
      })
      .catch((error) => console.error('Unable to get list of games.', error));
  }

  cancelAction = () => {
    this.props.history.push('/practiceplans');
  }

  // change functions for the fields on the new practice plan form:
  changePracticePlanName = (e) => {
    e.preventDefault();
    this.setState({ practicePlanName: e.target.value });
  }

  changePracticePlanStartDate = (date) => {
    this.setState({ practicePlanStartDate: date });
  }

  changePracticePlanEndDate = (date) => {
    this.setState({ practicePlanEndDate: date });
  }

  validationAlertPracticePlanName = () => {
    Swal.fire('You must specify a NAME for this practice plan.');
  }

  validationAlertPracticePlanDates = () => {
    Swal.fire('Start date must be before the end date.');
  }

  validationAlertPracticeGameDate = () => {
    Swal.fire('Game date must be between practice plan start and end dates.');
  }

  saveNewPracticePlan = (e) => {
    const {
      practicePlanName,
      practicePlanStartDate,
      practicePlanEndDate,
    } = this.state;
    e.preventDefault();
    if (practicePlanName === '') {
      this.validationAlertPracticePlanName();
    } else if (practicePlanEndDate.getTime() < practicePlanStartDate.getTime()) {
      this.validationAlertPracticePlanDates();
    } else {
      const newPracticePlan = {
        name: practicePlanName,
        startDate: practicePlanStartDate,
        endDate: practicePlanEndDate,
      };
      console.error('new pp created', newPracticePlan);
      practicePlansData.createPracticePlan(newPracticePlan)
        .then((newPracticePlanResponse) => {
          this.setState({ practicePlanId: newPracticePlanResponse.data, newRecordForm: false });
          console.error('respo', newPracticePlanResponse);
          this.getPracticePlanDetails();
        })
        .catch((error) => console.error('Unable to create this practice plan.', error));
    }
  }

  // functions for the edit-version of this form:
  saveUpdatedPracticePlan = (e) => {
    const {
      practicePlanId,
      practicePlanName,
      practicePlanStartDate,
      practicePlanEndDate,
      practicePlanActive,
      selectedGames,
    } = this.state;
    e.preventDefault();
    if (practicePlanName === '') {
      this.validationAlertPracticePlanName();
    } else if (practicePlanEndDate.getTime() < practicePlanStartDate.getTime()) {
      this.validationAlertPracticePlanDates();
    } else {
      const updatedPracticePlan = {
        planId: practicePlanId,
        name: practicePlanName,
        startDate: practicePlanStartDate,
        endDate: practicePlanEndDate,
        isActive: practicePlanActive,
      };
      practicePlansData.updatePracticePlan(practicePlanId, updatedPracticePlan)
        .then(() => {
          this.props.history.push(`/practiceplans/${practicePlanId}`);
        })
        .catch((error) => console.error('Unable to update practice plan details.', error));
    }
  }

  toggleGamesDropdown = () => {
    this.setState({ gamesDropdownOpen: !this.state.gamesDropdownOpen });
  }

  // functions for the new practice plan game form on the modal:
  toggleGameFormModal = () => {
    this.setState({ gameFormModal: !this.state.gameFormModal });
  }

  closeGameFormModal = () => {
    this.setState({ gameFormModal: false });
  }

  getGameForm = (e) => {
    this.setState({ gameFormModal: true });
    gamesData.getGameById(e.target.value)
      .then((singleGameResponse) => {
        this.setState({
          selectedGame: singleGameResponse.data,
          selectedGameId: singleGameResponse.data.id,
          practiceGameName: singleGameResponse.data.name,
        });
      });
  };

  changePracticeGameName = (e) => {
    e.preventDefault();
    this.setState({ practiceGameName: e.target.value });
  }

  changePracticeDate = (date) => {
    this.setState({ practiceDate: date });
  }

  changePracticeNotes = (e) => {
    e.preventDefault();
    this.setState({ practiceNotes: e.target.value });
  }

  changePracticeCompleted = (e) => {
    e.preventDefault();
    this.setState({ practiceCompleted: e.target.checked });
  }

  savePracticePlanGame = (e) => {
    e.preventDefault();
    const {
      practiceGameName,
      practiceDate,
      practiceNotes,
      practiceCompleted,
      selectedGameId,
      practicePlanId,
      selectedGame,
      practicePlanStartDate,
      practicePlanEndDate,
    } = this.state;
    if (practiceGameName == '') {
      this.setState({ practiceGameName: selectedGame.name });
    }
    if (practiceDate == '') {
      this.setState({ practiceDate: new Date() });
    }
    if (practiceDate.getTime() < practicePlanStartDate.getTime() || practiceDate.getTime() > practicePlanEndDate.getTime()) {
      this.validationAlertPracticeGameDate();
    } else {
      const newPracticePlanGame = {
        name: this.state.practiceGameName,
        practiceDate: this.state.practiceDate,
        userNotes: practiceNotes,
        isCompleted: practiceCompleted,
        practicePlanId,
        gameId: selectedGameId,
      };
      practicePlanGamesData.createNewPracticePlanGame(newPracticePlanGame)
        .then((newPpgResponse) => {
          this.closeGameFormModal();
          this.getPracticePlanGamesList();
        })
        .catch((error) => console.error('Could not add the game selected to your practice plan.', error));
    }
  }

  render() {
    const {
      newRecordForm,
      practicePlanId,
      practicePlanName,
      practicePlanStartDate,
      practicePlanEndDate,
      gamesList,
      gamesDropdownOpen,
      gameFormModal,
      practiceGameName,
      practiceDate,
      practiceNotes,
      practiceCompleted,
      selectedGame,
      selectedGames,
    } = this.state;

    const buildGamesDropdownOptions = () => gamesList.map((game) => (
      <DropdownItem key={game.id} value={game.id} game={game} onClick={this.getGameForm}>{game.name}</DropdownItem>
    ));

    const buildGamesGrid = () => selectedGames.map((item) => (
      <PracticePlanGameItem key={item.id} practicePlanGame={item} practicePlanId={this.state.practicePlanId} refreshPage={this.getPracticePlanDetails} />
    ));

    return (
      <div className="PracticePlanNew">
        {
          (newRecordForm === true)
            ? <h2 className="pageTitle">Add New Practice Plan</h2>
            : <h2 className="pageTitle">Update Practice Plan: {practicePlanName}</h2>
        }
        <div className="row">
          <div className="col-md-6">
            {/* form for new practice plan info OR practice plan info to be edited below: */}
            <Form>
              <FormGroup>
                <Label for="practiceName">Name</Label>
                <Input
                  type="input"
                    name="practiceName"
                    id="practiceName"
                    placeholder="Give it a name!"
                    value={practicePlanName}
                    onChange={this.changePracticePlanName}
                  />
              </FormGroup>

              { (newRecordForm === true)
                ? <FormGroup>
                <Label for="practicePlanStartDate">Start Date</Label>
                <DatePicker
                  selected={this.state.practicePlanStartDate}
                  name="practicePlanStartDate"
                  defaultValue={new Date()}
                  id="practicePlanStartDate"
                  onChange={this.changePracticePlanStartDate}
                  dateFormat={'MM-dd-yyyy'}
                />
              </FormGroup>
                : <FormGroup>
                <Label for="practicePlanStartDate">Start Date</Label>
                <DatePicker
                  selected={this.state.practicePlanStartDate}
                  name="practicePlanStartDate"
                  value={practicePlanStartDate}
                  id="practicePlanStartDate"
                  onChange={this.changePracticePlanStartDate}
                  dateFormat={'MM-dd-yyyy'}
                />
              </FormGroup>
              }

              <FormGroup>
                <Label for="practicePlanEndDate">End Date</Label>
                <DatePicker
                  selected={this.state.practicePlanEndDate}
                  name="practicePlanEndDate"
                  id="practicePlanEndDate"
                  value={practicePlanEndDate}
                  onChange={this.changePracticePlanEndDate}
                  dateFormat={'MM-dd-yyyy'}
                />
              </FormGroup>
              {
                newRecordForm === true
                  ? <Button onClick={this.saveNewPracticePlan}>Save and Add Games</Button>
                  : <Button onClick={this.saveUpdatedPracticePlan}>Save Changes</Button>
              }
              <Button onClick={this.cancelAction}>Cancel</Button>
            </Form>
          </div>
          <div className="col-md-6">
            <div className="row">
          {
            newRecordForm === false
              ? <FormGroup>
                  <Dropdown isOpen={gamesDropdownOpen} toggle={this.toggleGamesDropdown}>
                    <DropdownToggle caret>
                      Add Game
                    </DropdownToggle>
                    <DropdownMenu>
                      {buildGamesDropdownOptions()}
                    </DropdownMenu>
                  </Dropdown>
                </FormGroup>
              : ''
          }
              <div/>
              <div className="row">
                {
                  this.state.selectedGames.length === 0
                    ? ''
                    : <Table>
          <thead>
            <tr>
              <th>Practice Game</th>
              <th className="d-none d-md-table-cell">Original Game</th>
              <th>Practice Date</th>
              <th className="d-none d-md-table-cell">Our Notes</th>
              <th className="d-none d-md-table-cell">Done?</th>
              <th>Delete</th>
            </tr>
          </thead>
          {buildGamesGrid()}
        </Table>
                }
              </div>
            </div>
          </div>
        </div>

          {/* code for modal about the game selected below: */}
          <Modal isOpen={this.state.gameFormModal} toggle={this.toggleGameFormModal}>
            <ModalHeader toggle={this.toggleGameFormModal}>Details for Selected Game: {this.state.selectedGame.name}</ModalHeader>
            <ModalBody>
              <div>
              <Form>
                <FormGroup>
                  <Label for="practiceName">Practice Game Name (customize as needed)</Label>
                  <Input
                    type="input"
                    name="practiceName"
                    value={practiceGameName}
                    id="practiceName"
                    onChange={this.changePracticeGameName}
                  />
                </FormGroup>
                <FormGroup>
                  <Label for="practiceDate">Practice Date</Label>
                  <DatePicker
                    selected={this.state.practiceDate}
                    name="practiceDate"
                    value={practiceDate}
                    id="practiceDate"
                    onChange={this.changePracticeDate}
                  dateFormat={'MM-dd-yyyy'}
                  />
                </FormGroup>
                <FormGroup>
                  <Label for="userNotes">Notes</Label>
                  <Input
                    type="textarea"
                    name="userNotes"
                    id="userNotes"
                    placeholder="Anything specific to remember for this practice?"
                    value={practiceNotes}
                    onChange={this.changePracticeNotes}
                  />
                </FormGroup>
                <FormGroup check>
                  <Label check>
                    <Input
                      type="checkbox"
                      id="isCompleted"
                      value={practiceCompleted}
                      onChange={this.changePracticeCompleted}
                    />{' '}
                    Already completed this practice?
                  </Label>
                </FormGroup>
              </Form>
              </div>
            </ModalBody>
            <ModalFooter>
              <Button onClick={this.savePracticePlanGame}>Save Game</Button>
              <Button onClick={this.closeGameFormModal}>Cancel</Button>
            </ModalFooter>
          </Modal>
      </div>
    );
  }
}

export default PracticePlanNew;
