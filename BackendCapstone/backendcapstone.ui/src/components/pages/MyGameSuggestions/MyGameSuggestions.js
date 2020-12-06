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
      </div>
    );
  }
}
export default MyGameSuggestions;
