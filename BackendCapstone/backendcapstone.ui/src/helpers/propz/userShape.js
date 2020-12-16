import PropTypes from 'prop-types';

const userShape = PropTypes.shape({
  activeDate: PropTypes.string,
  dateCreated: PropTypes.string,
  email: PropTypes.string.isRequired,
  firebaseUid: PropTypes.string,
  firstName: PropTypes.string.isRequired,
  id: PropTypes.number.isRequired,
  isActive: PropTypes.bool,
  lastName: PropTypes.string,
  password: PropTypes.string,
  photoUrl: PropTypes.string,
});

export default { userShape };
