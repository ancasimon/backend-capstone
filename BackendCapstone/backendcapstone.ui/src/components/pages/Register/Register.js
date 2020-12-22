import React from 'react';
import Swal from 'sweetalert2';
import {
  Button,
  Form,
  FormGroup,
  Label,
  Input,
} from 'reactstrap';

import PropTypes from 'prop-types';

import authData from '../../../helpers/data/authData';
import usersData from '../../../helpers/data/usersData';

import './Register.scss';

class Register extends React.Component {
  static propTypes = {
    authed: PropTypes.bool.isRequired,
  }

  state = {
    user: {
      email: '',
      password: '',
      firstName: '',
      lastName: '',
      photoUrl: '',
    },
    authed: this.props.authed,
  };

  validationAlertDataEntered = () => {
    Swal.fire('You must enter your first and last name, email, and password.');
  }

  validationAlertExistingUser = () => {
    Swal.fire('A user has already registered with this email. Please log in, or choose a new email address.');
  }

  validationAlertValidEmail = () => {
    Swal.fire('Please enter a valid email address.');
  }

  validateEmail = () => {
    const userEmail = this.state.user.email;
  }

  validateUser = (e) => {
    e.preventDefault();
    if (this.state.user.firstName == ''
    || this.state.user.lastName == ''
    || this.state.user.email == ''
    || this.state.user.password == '') {
      this.validationAlertDataEntered();
      return;
    }
    this.checkIfUserEmailExists(e);
  }

  checkIfUserEmailExists = (e) => {
    e.preventDefault();
    const userEmail = this.state.user.email;
    usersData.checkUserEmail(userEmail)
      .then((emailResponse) => {
        if (emailResponse.data === true) {
          this.validationAlertExistingUser();
        } else {
          this.registerClickEvent(e);
        }
      });
  }

  registerClickEvent = (e) => {
    const { user } = this.state;
    e.preventDefault();
    authData.registerUser(user)
      .then(() => {
        this.setState({ authed: true });
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
      <Button type="submit" onClick={this.validateUser}>Submit</Button>
    </Form>
      </div>
    );
  }
}

export default Register;
