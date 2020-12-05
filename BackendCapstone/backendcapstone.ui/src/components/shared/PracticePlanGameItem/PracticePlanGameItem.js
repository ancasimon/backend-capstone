import React from 'react';
import { Link } from 'react-router-dom';

import practicePlanGameShape from '../../../helpers/propz/practicePlanGameShape';

import './PracticePlanGameItem.scss';

class PracticePlanGameItem extends React.Component {
  static propTypes = {
    practicePlanGame: practicePlanGameShape.practicePlanGameShape,
  }

  render() {
    const { practicePlanGame } = this.props;
    return (
      <tbody>
        <tr>
          <th scope="row">{practicePlanGame.practiceName}</th>
          <th>{practicePlanGame.gameName}</th>
          <th>{practicePlanGame.practiceDate}</th>
          <th>{practicePlanGame.userNotes}</th>
          <th>
            {
            (practicePlanGame.isCompleted === true) ? <p>Yes!</p> : <p>Not yet.</p>
            }
          </th>
          <th>Delete</th>
        </tr>
      </tbody>
    );
  }
}

export default PracticePlanGameItem;
