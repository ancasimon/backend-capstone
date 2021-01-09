import React from 'react';
import PropTypes from 'prop-types';
import { Table } from 'reactstrap';
import { Link } from 'react-router-dom';
import moment from 'moment';
import Swal from 'sweetalert2';

import PracticePlanGameItem from '../../shared/PracticePlanGameItem/PracticePlanGameItem';

import practicePlansData from '../../../helpers/data/practicePlansData';

import './SinglePracticePlanView.scss';

class SinglePracticePlanView extends React.Component {
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
    practicePlansData.inactivatePracticePlan(practiceplanid)
      .then(() => {
        this.props.history.push('/practiceplans');
      })
      .catch((error) => console.error('Unable to delete this practice plan.', error));
  }

  deleteConfirmationMessagePracticePlan = () => {
    Swal.fire({
      title: 'Are you sure you want to delete this practice plan?',
      text: 'You will not be able to undo this action!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#008900',
      cancelButtonColor: '#960018',
      confirmButtonText: 'Yes, delete it!',
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Deleted!',
          'Your practice plan has been deleted.',
          'success',
        );
        this.inactivatePracticePlan();
      }
    });
  }

  render() {
    const { selectedPracticePlan, selectedGames } = this.state;
    const { practiceplanid } = this.props.match.params;

    const buildGamesGrid = () => selectedGames.map((item) => (
      <PracticePlanGameItem key={item.id} practicePlanGame={item} gameId={item.gameId} practicePlanId={item.practicePlanId} refreshPage={this.buildSingleView} />
    ));

    return (
      <div className="SinglePracticePlanView container">
        <div className="row">
          <div className="col-md-9 text-center">
            <h2 className="pageTitle">Practice Plan Details: {selectedPracticePlan.name}</h2>
            <h4>{moment(selectedPracticePlan.startDate).format('L')} - {moment(selectedPracticePlan.endDate).format('L')}</h4>
            <div className="row d-flex flex-wrap mt-3">
              <div className="col-md-6 buttonDiv text-center">
                <Link to={`/practiceplans/edit/${practiceplanid}`} className="mainButtons p-2">Edit</Link>
              </div>
              <div className="col-md-6 buttonDiv text-center">
                <button className="mainButtons p-2" onClick={this.deleteConfirmationMessagePracticePlan}>Delete</button>
              </div>
            </div>
          </div>
          <div className="col-md-2 buttonDiv">
            <Link to='/practiceplans' className="mainButtons p-2">Back</Link>
          </div>
        </div>
        <Table>
          <thead>
            <tr>
              <th>Practice Game</th>
              <th className="d-none d-md-table-cell">Original Game</th>
              <th>Practice Date</th>
              <th className="d-none d-md-table-cell">Our Notes</th>
              <th className="d-none d-md-table-cell">Done?</th>
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
