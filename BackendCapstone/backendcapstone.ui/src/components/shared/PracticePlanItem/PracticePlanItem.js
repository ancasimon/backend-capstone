import React from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';
import { parseISO, format } from 'date-fns';

import practicePlanShape from '../../../helpers/propz/practicePlanShape';
import SinglePracticePlanView from '../../pages/SinglePracticePlanView/SinglePracticePlanView';

import './PracticePlanItem.scss';

class PracticePlanItem extends React.Component {
  static propTypes = {
    practicePlanItem: practicePlanShape.practicePlanShape,
  }

  render() {
    const { practicePlanItem } = this.props;
    const singleLink = `/practiceplans/${practicePlanItem.planId}`;

    return (
      <tbody>
        <tr>
          <th scope="row">{practicePlanItem.name}</th>
          <td className="d-none d-md-table-cell">{moment(practicePlanItem.startDate).format('L')}</td>
          <td className="d-none d-md-table-cell">{moment(practicePlanItem.endDate).format('L')}</td>
          <td><Link to={singleLink} className="iconButtons"><i className="fas fa-eye"></i></Link></td>
        </tr>
      </tbody>
    );
  }
}

export default PracticePlanItem;
