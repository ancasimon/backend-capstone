import React from 'react';

import './AgeFilterItem.scss';

class AgeFilterItem extends React.Component {
  render() {
    return (
      <div className="AgeFilterItem">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />
          <label class="form-check-label" for="defaultCheck1">
            Default checkbox
          </label>
        </div>
      </div>
    );
  }
}

export default AgeFilterItem;
