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
        <div className="row align-center align-middle">
          <div className="small-12 small-centered medium-8 medium-centered columns tile">
          <img src={this.props.photo_url} />
          <div className="row medium-unstack">
            <div className="small-12 medium-6 columns">
              <h4>{this.props.name}</h4>
            </div>
            <div className="small-12 medium-6 columns">
              <h3>{this.props.location}</h3>
            </div>
          </div>
          <p>{this.props.description}</p>
          <h2> - {this.props.creator}</h2>
          </div>
        </div>
      </div>
    )
  }
}

export default MuralIndexTile;
