import React from 'react';
import firebase from 'firebase/app';
import 'firebase/auth';

import PropTypes from 'prop-types';

import { Link } from 'react-router-dom';

import authData from '../../../helpers/data/authData';

import './Login.scss';

class Login extends React.Component {
  state = {
    user: {
      email: '',
      password: '',
    },
  };

  loginClickEvent = (e) => {
    const { user } = this.state;
    e.preventDefault();
    authData
      .loginUser(user)
      .then(() => {
        this.props.history.push('/home');
      })
      .catch((error) => {
        console.error('There was an error while logging in.', error);
      });
  };

  emailChange = (e) => {
    const tempUser = { ...this.state.user };
    tempUser.email = e.target.value;
    this.setState({ user: tempUser });
  };

  passwordChange = (e) => {
    const tempUser = { ...this.state.user };
    tempUser.password = e.target.value;
    this.setState({ user: tempUser });
  };

  render() {
    const { user } = this.state;
    return (
      <div className="Login text-center" {...this.props}>
        <div id="login-form">
          <h2>Log In</h2>
          <div className="form-group">
              <div className="col-sm-12">
                <Link to="/register" className="link">Need to Register?</Link>
              </div>
            </div>
          <form className="form-horizontal w-50 mx-auto">
            <div className="form-group">
              <label htmlFor="inputEmail" className="col-sm-4">
                Email:
              </label>
              <div>
                <input
                  type="email"
                  className="form-control"
                  id="inputEmail"
                  placeholder="Email"
                  value={user.email}
                  onChange={this.emailChange}
                />
              </div>
            </div>
            <div className="form-group">
              <label htmlFor="inputPassword" className="col-sm-4">
                Password:
              </label>
              <div>
                <input
                  type="password"
                  className="form-control"
                  id="inputPassword"
                  placeholder="Password"
                  value={user.password}
                  onChange={this.passwordChange}
                />
              </div>
            </div>
            <div className="form-group">
              <div className="col-sm-12 buttonDiv">
                <button
                  type="submit"
                  className="mainButtons p-2"
                  onClick={this.loginClickEvent}
                >
                  Log In
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    );
  }
}

export default Login;
