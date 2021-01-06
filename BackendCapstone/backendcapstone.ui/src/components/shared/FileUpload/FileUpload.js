import React from 'react';

class FileUpload extends React.Component {
  fileChanged = (e) => {
    this.props.onChange(e.target.files[0]);
  };

  render() {
    return (
      <div className="FileUpload">
        <label htmlFor="file">Upload a Photo:</label>
        <input name="file" type="file" accept=".jpg,.png, .gif" onChange={this.fileChanged} />
      </div>
    );
  }
}

export default FileUpload;
