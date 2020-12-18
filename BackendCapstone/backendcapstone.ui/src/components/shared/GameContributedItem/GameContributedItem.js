import React from 'react';
import { Link } from 'react-router-dom';

import gameItemShape from '../../../helpers/propz/gameItemShape';

import './GameContributedItem.scss';

class GameContributedItem extends React.Component {
  static propTypes = {
    game: gameItemShape.gameItemShape,
  }

  render() {
    const { game } = this.props;
    const singleGameLink = `/games/${game.id}`;

    return (
      <tbody>
        <tr>
          <th scope="row">{game.name}</th>
          <td>{
          game.isActive
            ? <p>Yes!</p>
            : <p>No, you deleted it!</p>
          }</td>
          <td className="d-none d-md-table-cell">{game.keywords}</td>
          <td><Link className="iconButtons" to={singleGameLink}><i className="fas fa-eye"></i></Link></td>
        </tr>
      </tbody>
    );
  }
}

export default GameContributedItem;
