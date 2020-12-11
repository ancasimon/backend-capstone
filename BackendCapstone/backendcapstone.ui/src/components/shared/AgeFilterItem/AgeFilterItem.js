import React from 'react';
import ageShape from '../../../helpers/propz/ageShape';

import './AgeFilterItem.scss';

class AgeFilterItem extends React.Component {
  static propTypes = {
    ageFilter: ageShape.ageShape,
  }

  render() {
    const { ageFilter } = this.props;

    return (
      <div className="AgeFilterItem">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value={ageFilter.id} id={ageFilter.name} />
          <label class="form-check-label" for={ageFilter.name}>
            {ageFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default AgeFilterItem;
