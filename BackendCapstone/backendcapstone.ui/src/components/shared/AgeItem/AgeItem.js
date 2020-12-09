import React from 'react';

import ageShape from '../../../helpers/propz/ageShape';

import './AgeItem.scss';

class AgeItem extends React.Component {
  static propTypes = {
    age: ageShape.ageShape,
  }

  render() {
    const { age } = this.props;

    return (
      <div className="AgeItem">
        {age.name}
      </div>
    );
  }
}

export default AgeItem;
