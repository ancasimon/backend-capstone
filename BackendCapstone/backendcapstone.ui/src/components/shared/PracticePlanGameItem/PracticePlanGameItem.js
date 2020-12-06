import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

import practicePlanGamesData from '../../../helpers/data/practicePlanGamesData';

import practicePlanGameShape from '../../../helpers/propz/practicePlanGameShape';

import './PracticePlanGameItem.scss';

class PracticePlanGameItem extends React.Component {
  static propTypes = {
    practicePlanGame: practicePlanGameShape.practicePlanGameShape,
    practicePlanId: PropTypes.number.isRequired,
    buildSingleView: PropTypes.func.isRequired,
  }

  state = {
    gameId: this.props.practicePlanGame.id,
  }

  inactivateRecord = (e) => {
    const { practicePlanGame, practicePlanId } = this.props;
    const { gameId } = this.state;
    console.error('id', gameId);
    const updatedObject = {
      id: gameId,
      isActive: false,
      practicePlanId,
      name: practicePlanGame.practiceName,
      practiceDate: practicePlanGame.practiceDate,
      userNotes: practicePlanGame.userNotes,
      isCompleted: practicePlanGame.isCompleted,
    };
    console.error('updated obj', updatedObject);
    practicePlanGamesData.updatePracticePlanGame(gameId, updatedObject)
      .then(() => {
        this.props.buildSingleView(practicePlanId);
        console.error('inactivated id:', gameId);
      })
      .catch((error) => console.error('Could not delete this game from your plan.', error));
  }

  render() {
    const { practicePlanGame } = this.props;
    return (
      <tbody>
        <tr>
          <th scope="row">{practicePlanGame.practiceName}</th>
          <td>{practicePlanGame.gameName}</td>
          <td>{practicePlanGame.practiceDate}</td>
          <td>{practicePlanGame.userNotes}</td>
          <td>
            {
            (practicePlanGame.isCompleted === true) ? <p>Yes!</p> : <p>Not yet.</p>
            }
          </td>
          <td><button onClick={this.inactivateRecord}>Delete</button></td>
        </tr>
      </tbody>
    );
  }
}

export default PracticePlanGameItem;
