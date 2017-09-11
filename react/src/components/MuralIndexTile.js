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
      <div className="MuralIndexTile">
        <Link to={`/murals/${this.props.id}`}>
          <h3>{this.props.name}</h3>
        </Link>

        <img src={this.props.photo_url} />
      </div>
    )
  }
}

export default MuralIndexTile;
