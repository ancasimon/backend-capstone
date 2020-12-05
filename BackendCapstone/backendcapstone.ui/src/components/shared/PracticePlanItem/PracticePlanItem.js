import React from 'react';
import { Link } from 'react-router-dom';

import practicePlanShape from '../../../helpers/propz/practicePlanShape';

import './PracticePlanItem.scss';

class PracticePlanItem extends React.Component {
  static = {
    practicePlanItem: practicePlanShape.practicePlanShape,
  }

  render() {
    const { practicePlanItem } = this.props;
    const singleLink = `/practiceplans/${practicePlanItem.id}`;

    return (
      <tbody>
        <tr>
          <th scope="row">{practicePlanItem.name}</th>
          <td>{practicePlanItem.startDate}</td>
          <td>{practicePlanItem.endDate}</td>
          <td><Link to={singleLink}>View</Link></td>
        </tr>
      </tbody>
    );
  }
}

export default PracticePlanItem;
