import React from 'react';
import { Link } from 'react-router-dom';

import './MyContributions.scss';

class MyContributions extends React.Component {
  render() {
    return (
      <div className="MyContributions">
          <h2 className="pageTitle">My Contributions</h2>
          <Link to='/games/1'>View Single Game</Link>
          {/* ANCA: hardcoding game ID for now!! */}
          <Link to='/games/edit/1'>Edit This Game</Link> {/* ANCA: NOTE - hardcoding game ID for now ; wil change once the link is in the individual game cards!! */}
      </div>
    );
  }
}
export default MyContributions;
