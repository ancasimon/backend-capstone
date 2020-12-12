import PropTypes from 'prop-types';

const gameItemShape = PropTypes.shape({
  agesForGame: PropTypes.array.isRequired,
  credit: PropTypes.string,
  dateCreated: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  gameIconId: PropTypes.number,
  gameIconHtml: PropTypes.string,
  gameIconUrl: PropTypes.string.isRequired,
  id: PropTypes.number.isRequired,
  instructions: PropTypes.string,
  instrumentsForGame: PropTypes.array.isRequired,
  isActive: PropTypes.bool.isRequired,
  keywords: PropTypes.string,
  name: PropTypes.string.isRequired,
  overallRating: PropTypes.number,
  prework: PropTypes.string,
  preworkLevelId: PropTypes.number.isRequired,
  preworkLevelName: PropTypes.string.isRequired,
  songs: PropTypes.string,
  submittedByUserId: PropTypes.number,
  userFirstName: PropTypes.string,
  userLastName: PropTypes.string,
  websiteUrl: PropTypes.string,
});

export default { gameItemShape };
