import React from 'react';
import PropTypes from 'prop-types';
import { Table } from 'reactstrap';
import { Link } from 'react-router-dom';

import PracticePlanGameItem from '../../shared/PracticePlanGameItem/PracticePlanGameItem';

import practicePlansData from '../../../helpers/data/practicePlansData';

import './SinglePracticePlanView.scss';

class SinglePracticePlanView extends React.Component {
  static propTypes = {
    practiceplanid: PropTypes.number.isRequired,
  }

  state = {
    selectedPracticePlan: {},
    selectedGames: [],
  }

  buildSingleView = () => {
    const { practiceplanid } = this.props.match.params;
    practicePlansData.getSinglePracticePlan(practiceplanid)
      .then((practicePlanResponse) => {
        this.setState({
          selectedPracticePlan: practicePlanResponse.data,
          selectedGames: practicePlanResponse.data.plannedGames,
        });
      })
      .catch((error) => console.error('Could not get the details of this practice plan.', error));
  }

  componentDidMount = () => {
    const { practiceplanid } = this.props.match.params;
    this.buildSingleView(practiceplanid);
  }

  inactivatePracticePlan = (e) => {
    const { practiceplanid } = this.props.match.params;
    const { selectedPracticePlan } = this.state;
    const updatedObject = {
      isActive: false,
      name: selectedPracticePlan.name,
      startDate: selectedPracticePlan.startDate,
      endDate: selectedPracticePlan.endDate,
      userId: selectedPracticePlan.userId,
    };
    practicePlansData.updatePracticePlan(practiceplanid, updatedObject)
      .then(() => {
        this.props.history.push('/practiceplans');
      })
      .catch((error) => console.error('Unable to delete this practice plan.', error));
  }

  render() {
    const { selectedPracticePlan, selectedGames } = this.state;
    const { practiceplanid } = this.props.match.params;

    const buildGamesGrid = () => selectedGames.map((item) => (
      <PracticePlanGameItem key={item.id} practicePlanGame={item} practicePlanId={item.practicePlanId} refreshPage={this.buildSingleView} />
    ));

    return (
      <div className="SinglePracticePlanView container">
        <div className="row">
          <div className="col-md-4">
            <Link to='/practiceplans' className="mainButtons p-2">Back</Link>
          </div>
          <div className="col-md-9 text-center">
            <h2>Practice Plan Details: {selectedPracticePlan.name}</h2>
            <h4>{selectedPracticePlan.startDate} - {selectedPracticePlan.endDate}</h4>
            <div className="row">
              <div className="col-md-6 buttonDiv text-center">
                <Link to={`/practiceplans/edit/${practiceplanid}`} className="mainButtons p-2">Edit</Link>
              </div>
              <div className="col-md-6 buttonDiv text-center">
                <button className="mainButtons p-2" onClick={this.inactivatePracticePlan}>Delete</button>
              </div>
            </div>
          </div>
        </div>
        <Table>
          <thead>
            <tr>
              <th>Practice Game</th>
              <th className="d-none d-md-table-cell">Original Game</th>
              <th>Practice Date</th>
              <th className="d-none d-md-table-cell">Our Notes</th>
              <th className="d-none d-md-table-cell">Completed?</th>
              <th>Delete</th>
            </tr>
          </thead>
          {buildGamesGrid()}
        </Table>
      </div>
    );
  }
}

export default SinglePracticePlanView;
