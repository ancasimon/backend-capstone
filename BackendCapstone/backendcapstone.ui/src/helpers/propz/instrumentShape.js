import PropTypes from 'prop-types';

const instrumentShape = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  iconUrl: PropTypes.string,
});

export default { instrumentShape };
