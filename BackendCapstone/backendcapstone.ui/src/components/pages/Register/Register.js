import React from 'react';
import {
  Button,
  Form,
  FormGroup,
  Label,
  Input,
} from 'reactstrap';

import authData from '../../../helpers/data/authData';

import './Register.scss';

class Register extends React.Component {
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
    authData.registerUser(user)
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
    const { user } = this.state;
    return (
      <div className="container">
        <h2 className="pageTitle">Register Here!</h2>
        <Form>
        <FormGroup>
            <Label for="firstName">First Name</Label>
            <Input
              type="input"
              name="firstName"
              id="firstName"
              placeholder="Enter your first name."
              value={user.firstName}
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
              value={user.lastName}
              onChange={this.lastNameChange}
            />
          </FormGroup>
          <FormGroup>
            <Label for="photoUrl">Photo</Label>
            <Input
              type="input"
              name="photoUrl"
              id="photoUrl"
              placeholder="Please add a link to your photo."
              value={user.photoUrl}
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
              value={user.email}
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
              value={user.password}
              onChange={this.passwordChange}
            />
          </FormGroup>
      <Button type="submit" onClick={this.registerClickEvent}>Submit</Button>
    </Form>
      </div>
    );
  }
}

export default Register;
