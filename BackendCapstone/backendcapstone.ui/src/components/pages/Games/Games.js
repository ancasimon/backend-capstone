import React from 'react';
import { Link } from 'react-router-dom';

import './Games.scss';

class Games extends React.Component {
  render() {
    return (
      <div className="Games container">
        <div className="row">
          <div className="col-md-3 topMargin">
            <p>Filter 1</p>
            <p>Filter 1</p>
            <p>Filter 1</p>
          </div>
          <div className="col-md-9">
            <div className="row">
              <div className="col-md-9">
                <h2 className="text-center">Games</h2>
              </div>
              <div className="col-sm-3">
                <div className="buttonDiv">
                  <Link to='/games/new' className="mainButtons p-2">Add New Game</Link>
                </div>
              </div>
            </div>
          </div>
        </div>
        <Link to='/games/1'>View Single Game</Link>
            {/* ANCA: NOTE - hardcoding game ID for now ; wil change once the link is in the individual game cards!! */}

      </div>
    );
  }
}

export default Games;
