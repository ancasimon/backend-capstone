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
        console.error('practice plans', userPracticePlansList);
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
      <div className="MyPracticePlans">
        <h2>My Practice Plans</h2>
        <Link to='/practiceplans/new'>Add a New Practice Plan</Link>

        <Table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Details</th>
            </tr>
          </thead>
            {buildPracticePlansGrid()}
        </Table>
      </div>
    );
  }
}

export default MyPracticePlans;
