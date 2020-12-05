import React from 'react';
import { Link } from 'react-router-dom';

import './Games.scss';

class Games extends React.Component {
  render() {
    return (
      <div className="Games">
        Games Page with a list of all the games available
        <Link to='/games/1'>View Single Game</Link>
        {/* ANCA: NOTE - hardcoding game ID for now ; wil change once the link is in the individual game cards!! */}
        <Link to='/games/new'>Add a New Game</Link>
      </div>
    );
  }
}

export default Games;
