import React from 'react';
import { Link } from 'react-router-dom';

import './MyGameSuggestions.scss';

class MyGameSuggestions extends React.Component {
  render() {
    return (
      <div className="MyGameSuggestions">
        My Game Suggestions = a list of all the games I have added to the app
        <Link to='/games/1'>View Single Game</Link>
        {/* ANCA: hardcoding game ID for now!! */}
      </div>
    );
  }
}
export default MyGameSuggestions;
