import PropTypes from 'prop-types';

const userShape = PropTypes.shape({
  activeDate: PropTypes.string,
  dateCreated: PropTypes.string,
  email: PropTypes.string,
  firebaseUid: PropTypes.string,
  firstName: PropTypes.string,
  id: PropTypes.number,
  isActive: PropTypes.bool,
  lastName: PropTypes.string,
  password: PropTypes.string,
  photoUrl: PropTypes.string,
  imageFileId: PropTypes.number,
});

export default { userShape };
