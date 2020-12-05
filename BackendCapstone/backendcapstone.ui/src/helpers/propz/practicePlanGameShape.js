import PropTypes from 'prop-types';

const practicePlanGameShape = PropTypes.shape({
  id: PropTypes.number.isRequired,
  practiceName: PropTypes.string.isRequired,
  gameName: PropTypes.string.isRequired,
  practiceDate: PropTypes.string.isRequired,
  userNotes: PropTypes.string.isRequired,
  isCompleted: PropTypes.bool.isRequired,
  isActive: PropTypes.bool.isRequired,
});

export default { practicePlanGameShape };
