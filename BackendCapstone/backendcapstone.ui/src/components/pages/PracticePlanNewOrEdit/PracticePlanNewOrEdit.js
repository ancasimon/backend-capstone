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

import NewPracticePlanGameModal from '../../shared/NewPracticePlanGameModal/NewPracticePlanGameModal';
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
  toggleGameFormModal = (e) => {
    e.preventDefault();
    this.setState({ gameFormModal: !this.state.gameFormModal, selectedGameId: e.target.value * 1 });
  }

  closeGameFormModal = () => {
    this.setState({ gameFormModal: false });
    this.getPracticePlanDetails();
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
      selectedGame,
      selectedGames,
      selectedGameId,
    } = this.state;

    const buildModal = () => (
      <NewPracticePlanGameModal
        gameId={selectedGameId}
        practicePlanId={practicePlanId}
        closeModal={this.closeGameFormModal}
        getPracticePlanDetails={this.getPracticePlanDetails}
      />
    );

    const buildGamesDropdownOptions = () => gamesList.map((game) => (
      <DropdownItem key={game.id} value={game.id} game={game} onClick={this.toggleGameFormModal}>{game.name}</DropdownItem>
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
                  ? <Button className="mainButtons p-2" onClick={this.saveNewPracticePlan}>Save and Add Games</Button>
                  : <Button className="mainButtons p-2" onClick={this.saveUpdatedPracticePlan}>Save Changes</Button>
              }
              <Button className="mainButtons p-2 ml-2" onClick={this.cancelAction}>Cancel</Button>
            </Form>
          </div>
          <div className="col-md-6">
            <div className="row">
          {
            newRecordForm === false
              ? <FormGroup>
                  <Dropdown isOpen={gamesDropdownOpen} toggle={this.toggleGamesDropdown}>
                    <DropdownToggle caret className="mainButtons p-2">
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

        <Modal isOpen={this.state.gameFormModal} toggle={this.toggleGameFormModal}>
          {buildModal()}
        </Modal>
      </div>
    );
  }
}

export default PracticePlanNew;
