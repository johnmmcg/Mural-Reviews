import React from 'react';
import { Link } from 'react-router'

const NavBar = props => {
  return(
    <div className="navBar">
      <Link to='/'>All Murals</Link>
      {props.children}
    </div>
  )
}

export default NavBar;
