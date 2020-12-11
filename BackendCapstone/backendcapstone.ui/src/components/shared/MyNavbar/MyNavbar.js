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
              <NavLink className="navLinks" tag={RRNavLink} to="/home">Home</NavLink>
            </NavItem>
            <NavItem>
              <NavLink className="navLinks" tag={RRNavLink} to="/games">Games</NavLink>
            </NavItem>
            <NavItem>
              <NavLink className="navLinks" tag={RRNavLink} to="/practiceplans">Practice Plans</NavLink>
            </NavItem>
            <NavItem>
              <NavLink className="navLinks" tag={RRNavLink} to="/contributions">Contributions</NavLink>
            </NavItem>
            <NavItem>
              <NavLink className="navLinks" tag={RRNavLink} to="/profile">Profile</NavLink>
            </NavItem>
            <NavItem>
              <NavLink className="navLinks" onClick={this.logoutClickEvent} className="pointerHand">Log Out</NavLink>
            </NavItem>
          </Nav>
        );
      }
      return <Nav className="ml-auto" navbar>
          <NavItem>
            <NavLink className="navLinks" className="navLinks" tag={RRNavLink} to="/home">Home</NavLink>
          </NavItem>
          <NavItem>
            <NavLink className="navLinks" tag={RRNavLink} to="/games">Games</NavLink>
          </NavItem>
          <NavItem>
            <NavLink className="navLinks" tag={RRNavLink} to="/login">Log In</NavLink>
          </NavItem>
        </Nav>;
    };

    return (
        <div className="MyNavbar content">
          <Navbar className="nav sticky navbar-light" id="navbar" expand="md">
              <NavbarBrand href="/">
                  <img src={logo} width="150" alt="company logo" />
              </NavbarBrand>
              <NavbarToggler onClick={this.toggle} />
              <Collapse isOpen={isOpen} navbar>
                { buildNavbar() }
              </Collapse>
          </Navbar>
        </div>
    );
  }
}

export default MyNavbar;
