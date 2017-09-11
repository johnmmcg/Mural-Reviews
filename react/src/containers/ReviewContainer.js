import React, { Component } from 'react'
import ReviewTile from '../components/ReviewTile'

class ReviewContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: {}
    }
  }

  componentDidMount() {
    fetch(`/api/v1/murals/${this.props.id}`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ data: body })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));

  }

  render() {
    let reviewsIndex;
    if (this.state.data.reviews) {
      reviewsIndex = this.state.data.reviews.map(review => {
        return(
          <ReviewTile
            key={review.user.id}
            rating={review.rating}
            review={review.body}
            username={review.user.username}
          />
        )
      })
    }

    return(
      <div className="reviewContainer">
        <h2>Reviews: </h2>
        {reviewsIndex}
      </div>
    )
  }
}

export default ReviewContainer;
