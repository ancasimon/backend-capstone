import PropTypes from 'prop-types';

const gameItemShape = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  isActive: PropTypes.bool.isRequired,
  songs: PropTypes.array,
  keywords: PropTypes.array,
  description: PropTypes.string.isRequired,
  prework: PropTypes.string,
  preworkLevelName: PropTypes.string.isRequired,
  instructions: PropTypes.string,
  credit: PropTypes.string,
  websiteUrl: PropTypes.string,
  overallRating: PropTypes.number,
  submittedByFirstName: PropTypes.string,
  submittedByLastName: PropTypes.string,
  dateCreated: PropTypes.string.isRequired,
  iconUrl: PropTypes.string.isRequired,
});

export default { gameItemShape };
