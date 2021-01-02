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
import PropTypes from 'prop-types';

import gamesData from '../../../helpers/data/gamesData';
import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';
import './NewPracticePlanGameModal.scss';

class NewPracticePlanGameModal extends React.Component {
  static propTypes = {
    gameId: PropTypes.number.isRequired,
    practicePlanId: PropTypes.number.isRequired,
    closeGameFormModal: PropTypes.func.isRequired,
    getPracticePlanDetails: PropTypes.func.isRequired,
  }

  state = {
    selectedGame: {},
    practiceGameName: '',
    practiceDate: new Date().toLocaleDateString('en-US'),
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

  componentDidMount() {
    this.getGameForm();
  }

  changePracticeGameName = (e) => {
    e.preventDefault();
    this.setState({ practiceGameName: e.target.value });
  }

  changePracticeDate = (e) => {
    e.preventDefault();
    this.setState({ practiceDate: e.target.value });
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
      selectedGame,
    } = this.state;
    const { gameId, practicePlanId } = this.props;
    if (practiceGameName == '') {
      this.setState({ practiceGameName: selectedGame.name });
    }
    if (practiceDate == '') {
      this.setState({ practiceDate: new Date() });
    }
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
        this.props.closeGameFormModal();
        this.props.getPracticePlanDetails();
      })
      .catch((error) => console.error('Could not add the game selected to your practice plan.', error));
  }

  render() {
    const {
      practiceGameName,
      practiceDate,
      practiceNotes,
      practiceCompleted,
    } = this.state;

    return (
      <div className='NewPracticePlanGameModal'>
        {/* code for modal about the game selected below: */}
        {/* <Modal isOpen={this.state.gameFormModal} toggle={this.toggleGameFormModal}> */}
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
                <Label for="practiceDate">Practice Date (MM/DD/YYYY)</Label>
                <Input
                  type="input"
                  name="practiceDate"
                  value={practiceDate}
                  id="practiceDate"
                  onChange={this.changePracticeDate}
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
            <Button onClick={this.props.closeGameFormModal}>Cancel</Button>
          </ModalFooter>
        {/* </Modal> */}
      </div>
    );
  }
}

export default NewPracticePlanGameModal;
