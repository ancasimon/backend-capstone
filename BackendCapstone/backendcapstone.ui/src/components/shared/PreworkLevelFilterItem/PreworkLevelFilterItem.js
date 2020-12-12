import React from 'react';
import PropTypes from 'prop-types';

import preworkLevelShape from '../../../helpers/propz/preworkLevelShape';

import './PreworkLevelFilterItem.scss';

class PreworkLevelFilterItem extends React.Component {
  static propTypes = {
    preworkLevelFilter: preworkLevelShape.preworkLevelShape,
    onClick: PropTypes.func.isRequired,
  }

  render() {
    const { preworkLevelFilter, onClick } = this.props;

    return (
      <div className="PreworkLevelFilterItem">
        <div className="form-check">
          <input
            className="form-check-input"
            type="checkbox"
            value={preworkLevelFilter.id}
            id={preworkLevelFilter.name}
            onClick={onClick}
          />
          <label className="form-check-label" htmlFor={preworkLevelFilter.name}>
            {preworkLevelFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default PreworkLevelFilterItem;
