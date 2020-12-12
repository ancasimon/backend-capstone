import React from 'react';
import PropTypes from 'prop-types';

import ageShape from '../../../helpers/propz/ageShape';

import './AgeFilterItem.scss';

class AgeFilterItem extends React.Component {
  static propTypes = {
    ageFilter: ageShape.ageShape,
    onClick: PropTypes.func.isRequired,
  }

  render() {
    const { ageFilter, onClick } = this.props;

    return (
      <div className="AgeFilterItem">
        <div className="form-check">
          <input
            className="form-check-input"
            type="checkbox"
            value={ageFilter.id}
            id={ageFilter.name}
            onClick={onClick}
          />
          <label className="form-check-label" htmlFor={ageFilter.name}>
            {ageFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default AgeFilterItem;
