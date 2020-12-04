import React from 'react';
import { Link } from 'react-router-dom';

import './SingleGameView.scss';

class SingleGameView extends React.Component {
  render() {
    return (
      <div className="SingleGameView">
        Single Game Details
        <Link to='/games/edit/1'>Edit This Game</Link> {/* ANCA: NOTE - hardcoding game ID for now ; wil change once the link is in the individual game cards!! */}
      </div>
    );
  }
}

export default SingleGameView;
