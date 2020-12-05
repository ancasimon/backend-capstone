import PropTypes from 'prop-types';

const practicePlanShape = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  userId: PropTypes.number.isRequired,
  startDate: PropTypes.string.isRequired,
  endDate: PropTypes.string.isRequired,
  isActive: PropTypes.bool.isRequired,
  plannedGames: PropTypes.array,
});

export default { practicePlanShape };
