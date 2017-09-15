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
      <div className="muralIndexTile">
        <div className="small-12 medium-8 large-4 columns">
          <Link to={`/murals/${this.props.id}`}>
            <h3>{this.props.name}</h3>
            <img src={this.props.photo_url} />
          </Link>
        </div>
      </div>
    )
  }
}

export default MuralIndexTile;
