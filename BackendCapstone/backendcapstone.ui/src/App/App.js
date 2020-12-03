import React from 'react';
import firebase from 'firebase/app';
import 'firebase/auth';

import { BrowserRouter, Route, Redirect, Switch } from 'react-router-dom';

import fbConnection from '../helpers/data/connection';

import GameEdit from '../components/pages/GameEdit/GameEdit';
import GameNew from '../components/pages/GameNew/GameNew';
import Games from '../components/pages/Games/Games';
import Home from '../components/pages/Home/Home';
import Login from '../components/pages/Login/Login';
import MyGameSuggestions from '../components/pages/MyGameSuggestions/MyGameSuggestions';
import MyPracticePlans from '../components/pages/MyPracticePlans/MyPracticePlans';
import SingleGameView from '../components/pages/SingleGameView/SingleGameView';
import SinglePracticePlanView from '../components/pages/SinglePracticePlanView/SinglePracticePlanView';

import MyNavbar from '../components/shared/MyNavbar/MyNavbar';

import './App.scss';
 
fbConnection();

const PrivateRoute = ({ component: Component, authed, ...rest }) => {
  const routeChecker = (props) => (authed === true
    ? (<Component {...props} />)
    : (<Redirect to={{ pathname: '/auth', state: { from: props.location } }} />));
  return <Route {...rest} render={(props) => routeChecker(props)} />;
};

class App extends React.Component {

  state = {
    authed: false,
  }
 
  componentDidMount() {
    this.removeListener = firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.setState({ authed: true });
      } else {
        this.setState({ authed: false });
      }
    });
  }
 
  componentWillUnmount() {
    this.removeListener();
  }


  render() {
    const { authed } = this.state;

    return (
      <div className="App">
        <BrowserRouter>
          <React.Fragment>
            <MyNavbar>
              <div className="container">
                <div className="row">
                  <Switch>
                    <PrivateRoute path='/games/edit/:gameId' component={GameEdit} authed={authed} />
                    <PrivateRoute path='/games/new' component={GameNew} authed={authed} />
                    <PrivateRoute path='/practiceplans' component={MyPracticePlans} authed={authed} />
                    <PrivateRoute path='/suggestions' component={MyGameSuggestions} authed={authed} />

                    <Route path='/home' component={Home} authed={authed} />
                    <Route path='/login' component={Login} authed={authed} />
                    <Route path='/games/:gameId' component={SingleGameView} authed={authed} />
                    <Route path='/games' component={Games} authed={authed} />

                    <Redirect from="*" to='/home'></Redirect>
                  </Switch>
                </div>
              </div>
            </MyNavbar>
          </React.Fragment>
        </BrowserRouter>
      </div>
    )
  }
}


export default App;
