import React from 'react';
import { Link } from 'react-router-dom';

import './Games.scss';

class Games extends React.Component {
  render() {
    return (
      <div className="Games">
        <h2>Games</h2>
        <div className="row">
          <div className="buttonDiv">
            <Link to='/games/new' className="mainButtons">Add a New Game</Link>
          </div>
        </div>
        <Link to='/games/1'>View Single Game</Link>
        {/* ANCA: NOTE - hardcoding game ID for now ; wil change once the link is in the individual game cards!! */}

      </div>
    );
  }
}

export default Games;
