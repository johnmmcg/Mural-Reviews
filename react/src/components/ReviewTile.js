import React, { Component} from 'react';
import { Link } from 'react-router'

class ReviewTile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: ""
    }
  }

  render() {
    return(
      <div className="reviewTile">
        <h3>{this.props.username}</h3>
        <h4>Rating: {this.props.rating}</h4>
        <p>{this.props.review}</p>
      </div>
    )
  }
}

export default ReviewTile;
