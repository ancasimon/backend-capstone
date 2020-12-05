import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';

import practicePlansData from '../../../helpers/data/practicePlansData';

import './SinglePracticePlanView.scss';

class SinglePracticePlanView extends React.Component {
  static propTypes = {
    practiceplanid: PropTypes.number.isRequired,
  }

  state = {
    selectedPracticePlan: {},
  }

  buildSingleView = () => {
    const { practiceplanid } = this.props.match.params;
    practicePlansData.getSinglePracticePlan(practiceplanid)
      .then((practicePlanResponse) => {
        this.setState({ selectedPracticePlan: practicePlanResponse.data });
      })
      .catch((error) => console.error('Could not get the details of this practice plan.', error));
  }

  componentDidMount = () => {
    const { practiceplanid } = this.props.match.params;
    this.buildSingleView(practiceplanid);
  }

  render() {
    const { selectedPracticePlan } = this.state;
    const { practiceplanid } = this.props.match.params;

    return (
      <div className="SinglePracticePlanView">
        <h2>My {selectedPracticePlan.Name} Practice Plan Details</h2>
        <Link to='/practiceplans'>Back to My Practice Plans</Link>
        <Link to={`/practiceplans/edit/${practiceplanid}`}>Edit This Practice Plan</Link>
      </div>
    );
  }
}

export default SinglePracticePlanView;
