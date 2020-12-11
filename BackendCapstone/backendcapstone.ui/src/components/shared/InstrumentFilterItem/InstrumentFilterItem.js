import React from 'react';

import instrumentShape from '../../../helpers/propz/instrumentShape';

import './InstrumentFilterItem.scss';

class InstrumentFilterItem extends React.Component {
  static propTypes = {
    instrumentFilter: instrumentShape.instrumentShape,
  }

  render() {
    const { instrumentFilter } = this.props;

    return (
      <div className="InstrumentFilterItem">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value={instrumentFilter.id} id={instrumentFilter.name} />
          <label class="form-check-label" for={instrumentFilter.name}>
            {instrumentFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default InstrumentFilterItem;
