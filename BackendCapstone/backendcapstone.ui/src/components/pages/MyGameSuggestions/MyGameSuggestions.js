import React from 'react';
import { Link } from 'react-router-dom';

import './MyGameSuggestions.scss';

class MyGameSuggestions extends React.Component {
  render() {
    return (
      <div className="MyGameSuggestions">
        <h2>My Game Suggestions</h2>
        <Link to='/games/1'>View Single Game</Link>
        {/* ANCA: hardcoding game ID for now!! */}
        <Link to='/games/edit/1'>Edit This Game</Link> {/* ANCA: NOTE - hardcoding game ID for now ; wil change once the link is in the individual game cards!! */}

      </div>
    );
  }
}
export default MyGameSuggestions;
