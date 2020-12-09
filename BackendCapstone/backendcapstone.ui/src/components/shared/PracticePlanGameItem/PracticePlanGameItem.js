import React from 'react';
import { FormGroup, Label, Input } from 'reactstrap';
import PropTypes from 'prop-types';

import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';

import practicePlanGameShape from '../../../helpers/propz/practicePlanGameShape';

import './PracticePlanGameItem.scss';

class PracticePlanGameItem extends React.Component {
  static propTypes = {
    practicePlanGame: practicePlanGameShape.practicePlanGameShape,
    practicePlanId: PropTypes.number.isRequired,
    refreshPage: PropTypes.func,
  }

  state = {
    gameId: this.props.practicePlanGame.id,
    practiceCompleted: this.props.practicePlanGame.isCompleted,
  }

  inactivateRecord = (e) => {
    const { practicePlanGame, practicePlanId } = this.props;
    const { gameId, practiceCompleted } = this.state;
    const updatedObject = {
      id: gameId,
      isActive: false,
      practicePlanId,
      name: practicePlanGame.practiceName,
      practiceDate: practicePlanGame.practiceDate,
      userNotes: practicePlanGame.userNotes,
      isCompleted: this.state.practicePlanGame,
    };
    practicePlanGamesData.updatePracticePlanGame(gameId, updatedObject)
      .then(() => {
        this.props.refreshPage(practicePlanId);
      })
      .catch((error) => console.error('Could not delete this game from your plan.', error));
  }

  changePracticeCompleted = (e) => {
    this.setState({ practiceCompleted: e.target.checked });
    const { practicePlanGame, practicePlanId } = this.props;
    const { gameId } = this.state;
    const updatedObject = {
      id: gameId,
      isActive: practicePlanGame.isActive,
      practicePlanId,
      name: practicePlanGame.practiceName,
      practiceDate: practicePlanGame.practiceDate,
      userNotes: practicePlanGame.userNotes,
      isCompleted: e.target.checked,
    };
    practicePlanGamesData.updatePracticePlanGame(gameId, updatedObject)
      .then(() => {
        this.props.refreshPage(practicePlanId);
      })
      .catch((error) => console.error('Could not mark this game complete in your plan.', error));
  }

  render() {
    const { practicePlanGame } = this.props;
    const { practiceCompleted } = this.state;
    return (
      <tbody>
        <tr>
          <th scope="row">{practicePlanGame.practiceName}</th>
          <td className="d-none d-md-table-cell">{practicePlanGame.gameName}</td>
          <td>{practicePlanGame.practiceDate}</td>
          <td className="d-none d-md-table-cell">{practicePlanGame.userNotes}</td>
          <td className="d-none d-md-table-cell">
            <FormGroup check inline>
              <Label check>
                <Input
                  type="checkbox"
                  id="practiceCompleted"
                  checked={practiceCompleted}
                  onChange={this.changePracticeCompleted}
                />
              </Label>
            </FormGroup>
          </td>
          <td><button className="iconButtons" onClick={this.inactivateRecord}><i class="fas fa-trash-alt"></i></button></td>
        </tr>
      </tbody>
    );
  }
}

export default PracticePlanGameItem;
