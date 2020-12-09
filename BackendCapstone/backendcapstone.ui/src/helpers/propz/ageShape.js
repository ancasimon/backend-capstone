import PropTypes from 'prop-types';

const ageShape = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  iconUrl: PropTypes.string,
});

export default { ageShape };
