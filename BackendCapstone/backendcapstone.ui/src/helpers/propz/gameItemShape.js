import PropTypes from 'prop-types';

const gameItemShape = PropTypes.shape({
  agesForGame: PropTypes.array,
  credit: PropTypes.string,
  dateCreated: PropTypes.string,
  description: PropTypes,
  gameIconId: PropTypes.number,
  gameIconHtml: PropTypes.string,
  gameIconUrl: PropTypes.string,
  id: PropTypes.number.isRequired,
  instructions: PropTypes.string,
  instrumentsForGame: PropTypes.array,
  isActive: PropTypes.bool.isRequired,
  keywords: PropTypes.string,
  name: PropTypes.string.isRequired,
  overallRating: PropTypes.number,
  prework: PropTypes.string,
  preworkLevelId: PropTypes.number,
  preworkLevelName: PropTypes.string,
  songs: PropTypes.string,
  submittedByUserId: PropTypes.number,
  userFirstName: PropTypes.string,
  userLastName: PropTypes.string,
  websiteUrl: PropTypes.string,
  ageIdsForGame: PropTypes.array,
  instrumentIdsForGame: PropTypes.array,
  gamePhotoId: PropTypes.number,
  value: PropTypes.number,
});

export default { gameItemShape };
