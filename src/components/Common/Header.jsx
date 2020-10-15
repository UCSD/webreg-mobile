import React from 'react';
import './Header.scss';

const Header = ({ left, center, right }) => (
  <div className="header">
    <div className="left">{left}</div>
    <div className="center">{center}</div>
    <div className="right">{right}</div>
  </div>
);

export default Header;
