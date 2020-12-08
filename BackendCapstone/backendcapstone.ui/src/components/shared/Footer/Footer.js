import React from 'react';

import './Footer.scss';

class Footer extends React.Component {
  render() {
    return (
      <div className="Footer">
        <footer class="fixed-bottom">
          <p>
            <span className="italicized">"The potential of every child is
            <span className="red"> unlimited</span>." - Dr. Shinichi Suzuki
            </span>
          <br /><span className="logo">Unlimited © 2021</span></p>
        </footer>
      </div>
    );
  }
}

export default Footer;
