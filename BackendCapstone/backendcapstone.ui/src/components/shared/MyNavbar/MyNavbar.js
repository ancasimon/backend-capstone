import React from 'react';
import { NavLink as RRNavLink } from 'react-router-dom';
import {
  Collapse,
  Nav,
  Navbar,
  NavbarBrand,
  NavbarToggler,
  NavItem,
  NavLink,
} from 'reactstrap';

import PropTypes from 'prop-types';

import firebase from 'firebase/app';
import 'firebase/auth';

import logo from '../../../images_backend_capstone/unlimited_logo.png';

import './MyNavbar.scss';
import authData from '../../../helpers/data/authData';

class MyNavbar extends React.Component {
  static propTypes = {
    authed: PropTypes.bool.isRequired,
  }

  state = {
    isOpen: false,
  }

  toggle = () => {
    this.setState({ isOpen: !this.state.isOpen });
  }

  logoutClickEvent = (e) => {
    e.preventDefault();
    firebase.auth().signOut();
  }

  // logoutClickEvent = (e) => {
  //   const { user } = this.state;
  //   e.preventDefault();
  //   authData
  //     .logoutUser(user)
  //     .then(() => {
  //       this.props.history.push('/home');
  //     })
  //     .catch((error) => console.error('There was an error logging out.', error));
  // }

  render() {
    const { isOpen } = this.state;

    const buildNavbar = () => {
      const { authed } = this.props;
      if (authed) {
        return (
          <Nav className="ml-auto" navbar>
            <NavItem>
              <NavLink tag={RRNavLink} to="/home">Home</NavLink>
            </NavItem>
            <NavItem>
              <NavLink tag={RRNavLink} to="/games">Games</NavLink>
            </NavItem>
            <NavItem>
              <NavLink tag={RRNavLink} to="/practiceplans">My Practice Plans</NavLink>
            </NavItem>
            <NavItem>
              <NavLink tag={RRNavLink} to="/suggestions">My Suggestions</NavLink>
            </NavItem>
            <NavItem>
              <NavLink onClick={this.logoutClickEvent}>Log Out</NavLink>
            </NavItem>
          </Nav>
        );
      }
      return <Nav className="ml-auto" navbar>
          <NavItem>
            <NavLink tag={RRNavLink} to="/home">Home</NavLink>
          </NavItem>
          <NavItem>
            <NavLink tag={RRNavLink} to="/games">Games</NavLink>
          </NavItem>
          <NavItem>
            <NavLink tag={RRNavLink} to="/login">Log In</NavLink>
          </NavItem>
        </Nav>;
    };

    return (
        <div className="MyNavbar">
          <Navbar className="nav" expand="md">
              <NavbarBrand href="/">
                  <img src={logo} width="150" alt="company logo" />
              </NavbarBrand>
              <NavbarToggler onClick={this.toggle} />
              <Collapse isOpen={this.isOpen} navbar>
                { buildNavbar() }
              </Collapse>
          </Navbar>
        </div>
    );
  }
}

export default MyNavbar;
