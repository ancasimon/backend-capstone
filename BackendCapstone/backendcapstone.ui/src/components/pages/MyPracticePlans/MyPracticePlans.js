import React from 'react';
import { Table } from 'reactstrap';
import { Link } from 'react-router-dom';

import practicePlansData from '../../../helpers/data/practicePlansData';

import PracticePlanItem from '../../shared/PracticePlanItem/PracticePlanItem';

import './MyPracticePlans.scss';

class MyPracticePlans extends React.Component {
  state = {
    userPracticePlans: [],
  }

  getPracticePlans = () => {
    practicePlansData.getUserPracticePlans()
      .then((userPracticePlansList) => {
        this.setState({ userPracticePlans: userPracticePlansList });
      })
      .catch((error) => console.error('Could not get your practice plans.', error));
  }

  componentDidMount = () => {
    this.getPracticePlans();
  }

  render() {
    const { userPracticePlans } = this.state;

    const buildPracticePlansGrid = () => userPracticePlans.map((item) => (
      <PracticePlanItem key={item.id} practicePlanItem={item} />
    ));

    return (
      <div className="MyPracticePlans container">
        <div className="row">
          <div className="col-md-9">
            <h2 className="text-center">My Practice Plans</h2>
          </div>
          <div className="col-md-3">
            <div className="buttonDiv text-center">
              <Link to='/practiceplans/new' className="mainButtons p-2">Add New Practice Plan</Link>
            </div>
          </div>
        </div>
        <div className="row">
        <Table>
          <thead>
            <tr>
              <th>Name</th>
              <th className="d-none d-md-table-cell">Start Date</th>
              <th className="d-none d-md-table-cell">End Date</th>
              <th>View</th>
            </tr>
          </thead>
            {buildPracticePlansGrid()}
        </Table>
        </div>
      </div>
    );
  }
}

export default MyPracticePlans;
