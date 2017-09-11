import React, { Component} from 'react';
import { Link } from 'react-router'

class MuralIndexTile extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render() {
    return(
      <div className="MuralShowTile">
          <h1>{this.props.name}</h1>
          <h4>{this.props.location}</h4>
          <img src={this.props.photo_url} />
          <h3>Posted by {this.props.creator}</h3>
          <p>{this.props.description}</p>
      </div>
    )
  }
}

export default MuralIndexTile;
