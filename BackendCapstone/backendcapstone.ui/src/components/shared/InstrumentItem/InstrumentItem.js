import React from 'react';

import instrumentShape from '../../../helpers/propz/instrumentShape';

import './InstrumentItem.scss';

class InstrumentItem extends React.Component {
  static propTypes = {
    instrument: instrumentShape.instrumentShape,
  }

  render() {
    const { instrument } = this.props;

    return (
      <div className="InstrumentItem">
        {instrument.name}
      </div>
    );
  }
}

export default InstrumentItem;
