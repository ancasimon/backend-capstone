import React from 'react';
import { Link } from 'react-router-dom';

import './MyPracticePlans.scss';

class MyPracticePlans extends React.Component {
  render() {
    return (
      <div className="MyPracticePlans">
        My Practice Plans = a list of all the practice plans I have set up
        <Link to='/practiceplans/1'>View Practice Plan Details</Link>
        <Link to='/practiceplans/new'>Add a New Practice Plan</Link>
      </div>
    );
  }
}

export default MyPracticePlans;
