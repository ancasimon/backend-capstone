import React from 'react';
import { Link } from 'react-router-dom';

import './SinglePracticePlanView.scss';

class SinglePracticePlanView extends React.Component {
  render() {
    return (
      <div className="SinglePracticePlanView">
        Single Practice Plan Details
        <Link to='/practiceplans'>Back to My Practice Plans</Link>
        <Link to='/practiceplans/edit/1'>Edit This Practice Plan</Link>
      </div>
    );
  }
}

export default SinglePracticePlanView;
