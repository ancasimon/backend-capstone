import React from 'react';

import preworkLevelShape from '../../../helpers/propz/preworkLevelShape';

import './PreworkLevelFilterItem.scss';

class PreworkLevelFilterItem extends React.Component {
  static propTypes = {
    preworkLevelFilter: preworkLevelShape.preworkLevelShape,
  }

  render() {
    const { preworkLevelFilter } = this.props;

    return (
      <div className="PreworkLevelFilterItem">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value={preworkLevelFilter.id} id={preworkLevelFilter.name} />
          <label class="form-check-label" for={preworkLevelFilter.name}>
            {preworkLevelFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default PreworkLevelFilterItem;
