import React from 'react';
import PropTypes from 'prop-types';

import ageShape from '../../../helpers/propz/ageShape';

import './AgeFilterItem.scss';

class AgeFilterItem extends React.Component {
  static propTypes = {
    ageFilter: ageShape.ageShape,
    selectedAges: PropTypes.array,
  }

  state = {
    selectedAges: this.props,
    selectedFilterId: '',
  }

 changeSelectFilter = (e) => {
   const { ageFilter } = this.props;
    this.setState({ selectedFilterId: e.target.value });
    const { selectedAges } = this.state;
    if (e.target.checked) {
      this.setState(state => ({
        const selectedAges = state.selectedAges.push(ageFilter.id);
        return {
          selectedAges,
          selectedFilterId,
        };
    }));
    }

    console.error('current selected filters', this.state.selectedAges);
    // } else {
    //   const index = selectedAges.indexOf(ageFilter.id);
    //   if (index > -1) {
    //     this.setState({ selectedAges: [...this.state.selectedAges.splice(index, 1)] });
    //     console.error('current selected filters afetr removal', this.state.selectedAges);
    //   }
    // }
  }

  // changeSelectFilter = (e) => {
  //   const { ageFilter } = this.props;
  //   const { selectedAges } = this.state;
  //   if (e.target.checked) {
  //     this.setState({ selectedAges: [...this.state.selectedAges, ageFilter.id] });
  //     console.error('current selected filters', this.state.selectedAges);
  //   } else {
  //     const index = selectedAges.indexOf(ageFilter.id);
  //     if (index > -1) {
  //       this.setState({ selectedAges: [...this.state.selectedAges.splice(index, 1)] });
  //       console.error('current selected filters afetr removal', this.state.selectedAges);
  //     }
  //   }
  // }

  // changeSelectFilter = (e) => {
  //   const { ageFilter } = this.props;
  //   const { selectedAges } = this.state;
  //   if (e.target.checked) {
  //     const newSelectedAgeId = ageFilter.id;
  //     const newAgeArray = this.state.selectedAges;
  //     newAgeArray.push(newSelectedAgeId);
  //     this.setState({ selectedAges: newAgeArray });
  //     console.error('current selected filters', this.state.selectedAges);
  //   // } else {
  //   //   const index = selectedAges.indexOf(ageFilter.id);
  //   //   if (index > -1) {
  //   //     this.setState({ selectedAges: [...this.state.selectedAges.splice(index, 1)] });
  //   //     console.error('current selected filters afetr removal', this.state.selectedAges);
  //   //   }
  //   }
  // }

  render() {
    const { ageFilter, selectedAges } = this.props;

    return (
      <div className="AgeFilterItem">
        <div class="form-check">
          <input
            class="form-check-input"
            type="checkbox"
            value={ageFilter.id}
            id={ageFilter.name}
            onChange={this.changeSelectFilter}
          />
          <label class="form-check-label" for={ageFilter.name}>
            {ageFilter.name}
          </label>
        </div>
      </div>
    );
  }
}

export default AgeFilterItem;
