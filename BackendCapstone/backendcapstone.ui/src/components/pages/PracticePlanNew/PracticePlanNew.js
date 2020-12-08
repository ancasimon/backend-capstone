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
  FormText,
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
} from 'reactstrap';

import gamesData from '../../../helpers/data/gamesData';
import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';
import practicePlansData from '../../../helpers/data/practicePlansData';

import './PracticePlanNew.scss';

class PracticePlanNew extends React.Component {
  state = {
    practicePlanId: 0,
    practicePlanName: '',
    practicePlanStartDate: '',
    practicePlanEndDate: '',
    gamesList: [],
    gamesDropdownOpen: false,
    gameFormModal: false,
    selectedGameId: 0,
    selectedGame: {},
    practiceGameName: '',
    practiceDate: new Date().toLocaleDateString('en-US'),
    practiceNotes: '',
    practiceCompleted: false,
  }

  changePracticePlanName = (e) => {
    e.preventDefault();
    this.setState({ practicePlanName: e.target.value });
  }

  changePracticePlanStartDate = (e) => {
    e.preventDefault();
    this.setState({ practicePlanStartDate: e.target.value });
  }

  changePracticePlanEndDate = (e) => {
    e.preventDefault();
    this.setState({ practicePlanEndDate: e.target.value });
  }

  saveNewPracticePlan = (e) => {
    const {
      practicePlanName,
      practicePlanStartDate,
      practicePlanEndDate,
    } = this.state;
    e.preventDefault();
    const newPracticePlan = {
      name: practicePlanName,
      startDate: practicePlanStartDate,
      endDate: practicePlanEndDate,
    };
    practicePlansData.createPracticePlan(newPracticePlan)
      .then((newPracticePlanResponse) => {
        this.setState({ practicePlanId: newPracticePlanResponse.data });
      })
      .catch((error) => console.error('Unable to create this practice plan.', error));
  }

  toggleGamesDropdown = () => {
    this.setState({ gamesDropdownOpen: !this.state.gamesDropdownOpen });
  }

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
        console.error('singlegameresponse', singleGameResponse);
      });
    console.error('opened modal!! and set game id to', e.target.value);
  };

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
      selectedGameId,
      practicePlanId,
      selectedGame,
    } = this.state;
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
      gameId: selectedGameId,
    };
    practicePlanGamesData.createNewPracticePlanGame(newPracticePlanGame)
      .then((newPpgResponse) => {
        this.closeGameFormModal();
        this.props.history.push(`/practiceplans/${practicePlanId}`);
        console.error('new ppg', newPpgResponse);
      })
      .catch((error) => console.error('Could not add the game selected to your practice plan.', error));
  }

  getGamesList = () => {
    gamesData.getAllActiveGames()
      .then((gamesListResponse) => {
        this.setState({ gamesList: gamesListResponse });
        console.error('gameslist in new plan', gamesListResponse);
      })
      .catch((error) => console.error('Unable to get list of games.', error));
  }

  buildNewPracticePlanPage = () => {
    this.getGamesList();
  }

  componentDidMount() {
    this.buildNewPracticePlanPage();
  }

  render() {
    const {
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
    } = this.state;

    const buildGamesDropdownOptions = () => gamesList.map((game) => (
      <DropdownItem key={game.id} value={game.id} game={game} onClick={this.getGameForm}>{game.name}</DropdownItem>
    ));

    return (
      <div className="PracticePlanNew">
        {
          practicePlanId === 0
            ? <h2>Add New Practice Plan</h2>
            : <h2>Update Practice Plan: {practicePlanName}</h2>
        }
        <div className="row">
          <div className="col-md-9">
            {/* form for new practice plan info below: */}
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
              <FormGroup>
                <Label for="practicePlanStartDate">Start Date (MM/DD/YYYY)</Label>
                <Input
                  type="input"
                  name="practicePlanStartDate"
                  defaultValue={new Date().toLocaleDateString('en-US')}
                  id="practicePlanStartDate"
                  onChange={this.changePracticePlanStartDate}
                />
              </FormGroup>
              <FormGroup>
                <Label for="practicePlanEndDate">End Date (MM/DD/YYYY)</Label>
                <Input
                  type="input"
                  name="practicePlanEndDate"
                  id="practicePlanEndDate"
                  value={practicePlanEndDate}
                  onChange={this.changePracticePlanEndDate}
                />
              </FormGroup>
              {
                this.state.practicePlanId === 0
                  ? <Button onClick={this.saveNewPracticePlan}>Save and Add Games</Button>
                  : <Button onClick={this.saveUpdatedPracticePlan}>Save Practice Plan</Button>
              }
            </Form>
          </div>
          <div className="col-md-3">
          {
            this.state.practicePlanId !== 0
              ? <FormGroup>
                  <Dropdown isOpen={gamesDropdownOpen} toggle={this.toggleGamesDropdown}>
                    <DropdownToggle caret>
                      Add a Game
                    </DropdownToggle>
                    <DropdownMenu>
                      {buildGamesDropdownOptions()}
                    </DropdownMenu>
                  </Dropdown>
                </FormGroup>
              : ''
          }
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
              <Button onClick={this.closeGameFormModal}>Cancel</Button>
            </ModalFooter>
          </Modal>
      </div>
    );
  }
}

export default PracticePlanNew;
