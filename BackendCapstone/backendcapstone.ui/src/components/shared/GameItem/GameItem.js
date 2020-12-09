import React from 'react';

import gameItemShape from '../../../helpers/propz/gameItemShape';

import './GameItem.scss';

class GameItem extends React.Component {
  static propTypes = {
    gameItem: gameItemShape.gameItemShape,
  }

  render() {
    const { gameItem } = this.props;
    const singleGameLink = `/games/${gameItem.id}`;

    return (
      <div>
        Game details: {gameItem.name}
      </div>
    );
  }
}

export default GameItem;
