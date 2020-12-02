import React from 'react';

import fbConnection from '../helpers/data/connection';

import Login from '../components/pages/Login/Login';

import './App.scss';
 
fbConnection();

class App extends React.Component {
  render() {
    return (
      <div className="App">
    Main Page
    <Login></Login>
      </div>
    )
  }
}


export default App;
