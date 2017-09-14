import React, { Component } from 'react'
import ReviewTile from '../components/ReviewTile'
import { Link } from 'react-router'

class ReviewContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: {}
    }
    this.addNewVote=this.addNewVote.bind(this)
    this.deleteVote=this.deleteVote.bind(this)
  }

  componentDidMount() {
    fetch(`/api/v1/murals/${this.props.id}`, {
      credentials: 'same-origin'})
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

  // addNewReview(ReviewPayLoad){
  //   fetch(`/api/v1/murals/${this.props.id}/reviews`, {
  //     credentials: 'same-origin',
  //     method: 'POST',
  //     body: JSON.stringify(ReviewPayLoad)
  //   })
  //   .then(response => response.json())
  //   .then(body => {
  //     this.setState( {data: body} )
  //   })
  // }

  addNewVote(VotePayload){
    fetch(`/api/v1/murals/${this.props.id}/votes`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(VotePayload)
    })
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

      this.setState( {data: body} )
    })
  }

  deleteVote(voteId) {
    fetch(`/api/v1/murals/${this.props.id}/votes/${voteId}`, {
      credentials: 'same-origin',
      method: 'DELETE',
    })
    .then(response => response.json())
    .then(body => {
      this.setState( {data: body} )
    })
  }


  render() {
    let reviewsIndex
    let currentUser
    if (this.state.data.current_user){
      currentUser = this.state.data.current_user.id
    }else {
      currentUser = null
    }
    if (this.state.data.reviews) {
      reviewsIndex = this.state.data.reviews.map(review => {
        return(
          <ReviewTile
            key={review.id}
            id={review.id}
            rating={review.rating}
            review={review.body}
            username={review.user.username}
            addNewVote={this.addNewVote}
            deleteVote={this.deleteVote}
            votes={review.votes}
            currentUser={currentUser}
          />
        )
      })

    }
    return(
      <div>
        <h2>Reviews: </h2>
        {reviewsIndex}
        <div className="AddNewReview">
          <Link to={`/murals/${this.props.id}/reviews/new`}>
            <h3>Add New Review</h3>
          </Link>
        </div>
      </div>
    )
  }
}

export default ReviewContainer;
