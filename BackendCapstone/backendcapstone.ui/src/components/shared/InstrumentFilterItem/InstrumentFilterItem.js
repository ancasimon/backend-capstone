import React from 'react';
import PropTypes from 'prop-types';

import instrumentShape from '../../../helpers/propz/instrumentShape';

import './InstrumentFilterItem.scss';

class InstrumentFilterItem extends React.Component {
  static propTypes = {
    instrumentFilter: instrumentShape.instrumentShape,
    onClick: PropTypes.func.isRequired,
  }

  render() {
    const { instrumentFilter, onClick } = this.props;

    return (
      <div className="InstrumentFilterItem">
        <div className="form-check">
          <input
            className="form-check-input filterCheckbox"
            type="checkbox"
            value={instrumentFilter.id}
            id={instrumentFilter.name}
            onClick={onClick}
          />
          <label className="form-check-label" htmlFor={instrumentFilter.name}>
            {instrumentFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default InstrumentFilterItem;
