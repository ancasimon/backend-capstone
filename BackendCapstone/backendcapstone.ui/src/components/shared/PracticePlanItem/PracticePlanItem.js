import React from 'react';
import { Link } from 'react-router-dom';

import practicePlanShape from '../../../helpers/propz/practicePlanShape';
import SinglePracticePlanView from '../../pages/SinglePracticePlanView/SinglePracticePlanView';

import './PracticePlanItem.scss';

class PracticePlanItem extends React.Component {
  static propTypes = {
    practicePlanItem: practicePlanShape.practicePlanShape,
  }

  render() {
    const { practicePlanItem } = this.props;
    const singleLink = `/practiceplans/${practicePlanItem.id}`;

    return (
      <tbody>
        <tr>
          <th scope="row">{practicePlanItem.name}</th>
          <td className="d-none d-md-table-cell">{practicePlanItem.startDate}</td>
          <td className="d-none d-md-table-cell">{practicePlanItem.endDate}</td>
          <td><Link to={singleLink} className="iconButtons"><i class="fas fa-binoculars"></i></Link></td>
        </tr>
      </tbody>
    );
  }
}

export default PracticePlanItem;