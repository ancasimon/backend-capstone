import React from 'react';
import {
  Button,
  Form,
  FormGroup,
  Label,
  Input,
} from 'reactstrap';

import PropTypes from 'prop-types';

import authData from '../../../helpers/data/authData';

import './Register.scss';

class Register extends React.Component {
  // static propTypes = {
  //   authed: PropTypes.bool.isRequired,
  // }

  state = {
    user: {
      email: '',
      password: '',
      firstName: '',
      lastName: '',
      photoUrl: '',
    },
  };

  registerClickEvent = (e) => {
    const { user } = this.state;
    e.preventDefault();
    authData
      .registerUser(user)
      .then(() => {
        this.props.history.push('/home');
      })
      .catch((error) => console.error('There was an error in registering.', error));
  }

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

  firstNameChange = (e) => {
    const tempUser = { ...this.state.user };
    tempUser.firstName = e.target.value;
    this.setState({ user: tempUser });
  };

  lastNameChange = (e) => {
    const tempUser = { ...this.state.user };
    tempUser.lastName = e.target.value;
    this.setState({ user: tempUser });
  };

  photoUrlChange = (e) => {
    const tempUser = { ...this.state.user };
    tempUser.photoUrl = e.target.value;
    this.setState({ user: tempUser });
  };

  render() {
    return (
      <div>
        <h2>Register Here!</h2>
        <Form>
        <FormGroup>
            <Label for="firstName">First Name</Label>
            <Input
              type="input"
              name="firstName"
              id="firstName"
              placeholder="Enter your first name."
              value={this.state.user.firstName}
              onChange={this.firstNameChange}
            />
          </FormGroup>
          <FormGroup>
            <Label for="lastName">Last Name</Label>
            <Input
              type="input"
              name="lastName"
              id="lastName"
              placeholder="Enter your last name."
              value={this.state.user.lastName}
              onChange={this.lastNameChange}
            />
          </FormGroup>
          <FormGroup>
            <Label for="photoUrl">Photo</Label>
            <Input
              type="input"
              name="photoUrl"
              id="photoUrl"
              placeholder="Please add a link to a photo."
              value={this.state.user.photoUrl}
              onChange={this.photoUrlChange}
            />
          </FormGroup>
          <FormGroup>
            <Label for="email">Email</Label>
            <Input
              type="email"
              name="email"
              id="email"
              placeholder="Enter you email address."
              value={this.state.user.email}
              onChange={this.emailChange}
            />
          </FormGroup>
          <FormGroup>
            <Label for="password">Password</Label>
            <Input
              type="password"
              name="password"
              id="password"
              placeholder="Choose a password."
              value={this.state.user.password}
              onChange={this.passwordChange}
            />
          </FormGroup>
      <Button type="submit" onClick={this.registerUser}>Submit</Button>
    </Form>
      </div>
    );
  }
}

export default Register;
