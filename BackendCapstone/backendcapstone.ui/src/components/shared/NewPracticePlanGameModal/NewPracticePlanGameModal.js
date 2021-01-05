import React from 'react';
import { Redirect } from 'react-router-dom';
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
import PropTypes from 'prop-types';

import gamesData from '../../../helpers/data/gamesData';
import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';
import practicePlansData from '../../../helpers/data/practicePlansData';

import 'react-datepicker/dist/react-datepicker.css';
import './NewPracticePlanGameModal.scss';

class NewPracticePlanGameModal extends React.Component {
  static propTypes = {
    gameId: PropTypes.number.isRequired,
    practicePlanId: PropTypes.number.isRequired,
    closeModal: PropTypes.func.isRequired,
    getPracticePlanDetails: PropTypes.func,
  }

  state = {
    selectedGame: {},
    selectedPlan: {},
    practiceGameName: '',
    practiceDate: new Date(new Date().setHours(12, 0, 0, 0)),
    practiceNotes: '',
    practiceCompleted: false,
  }

  getGameForm = (e) => {
    const { gameId } = this.props;
    gamesData.getGameById(gameId)
      .then((singleGameResponse) => {
        this.setState({
          selectedGame: singleGameResponse.data,
          practiceGameName: singleGameResponse.data.name,
        });
      });
  };

  getPracticePlanInfo = () => {
    const { practicePlanId } = this.props;
    practicePlansData.getSinglePracticePlan(practicePlanId)
      .then((ppResponse) => {
        this.setState({ selectedPlan: ppResponse.data });
      });
  }

  componentDidMount() {
    this.getGameForm();
    this.getPracticePlanInfo();
  }

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

  validationAlertPracticeGameDate = () => {
    Swal.fire('Game date must be between practice plan start and end dates.');
  }

  savePracticePlanGame = (e) => {
    e.preventDefault();
    const {
      practiceGameName,
      practiceDate,
      practiceNotes,
      practiceCompleted,
      selectedGame,
      selectedPlan,
    } = this.state;
    const { gameId, practicePlanId, getPracticePlanDetails } = this.props;
    const planStartDate = selectedPlan.startDate;
    const planEndDate = selectedPlan.endDate;
    if (practiceGameName == '') {
      this.setState({ practiceGameName: selectedGame.name });
    }
    if (practiceDate == '') {
      this.setState({ practiceDate: new Date() });
    }
    if (practiceDate.getTime() < parseISO(planStartDate).getTime() || practiceDate.getTime() > parseISO(planEndDate).getTime()) {
      this.validationAlertPracticeGameDate();
    } else {
      const newPracticePlanGame = {
        name: this.state.practiceGameName,
        practiceDate: this.state.practiceDate,
        userNotes: practiceNotes,
        isCompleted: practiceCompleted,
        practicePlanId,
        gameId,
      };
      practicePlanGamesData.createNewPracticePlanGame(newPracticePlanGame)
        .then((newPpgResponse) => {
          this.props.closeModal();
        })
        .catch((error) => console.error('Could not add the game selected to your practice plan.', error));
    }
  }

  render() {
    const {
      practiceGameName,
      practiceDate,
      practiceNotes,
      practiceCompleted,
      selectedPlan,
    } = this.state;

    return (
      <div className='NewPracticePlanGameModal'>
        {/* code for modal about the game selected below: */}
          <ModalHeader toggle={this.toggleGameFormModal}>Add <span className='italics'>{this.state.selectedGame.name}</span> to Plan <span className='italics'>{selectedPlan.name} ({moment(selectedPlan.startDate).format('L')} - {moment(selectedPlan.endDate).format('L')})</span></ModalHeader>
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
            <Button className="mainButtons p-2" onClick={this.savePracticePlanGame}>Save Game</Button>
            <Button className="mainButtons p-2" onClick={this.props.closeModal}>Cancel</Button>
          </ModalFooter>
      </div>
    );
  }
}

export default NewPracticePlanGameModal;
