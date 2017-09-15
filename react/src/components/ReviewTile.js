import React, { Component} from 'react';
import { Link } from 'react-router'

class ReviewTile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      voteStatus: null,
      voteId: null
    }
    this.handleUpVoteClick=this.handleUpVoteClick.bind(this)
    this.handleDownVoteClick=this.handleDownVoteClick.bind(this)
    this.checkUserVotes=this.checkUserVotes.bind(this)
  }


  componentDidMount() {
    this.checkUserVotes()
  }

  checkUserVotes() {
    setTimeout(function(){
      this.props.votes.forEach(vote =>{
        if (vote.user_id === this.props.currentUser ){
          this.setState({ voteStatus: vote.direction })
          this.setState({ voteId: vote.id})
        }
      })
    }.bind(this), 100)
  }

  handleUpVoteClick(event){
    if (this.state.voteStatus == null){
      let VotePayload={
        direction: 1,
        review_id: this.props.id
      }
      this.props.addNewVote(VotePayload)
      this.setState({ voteStatus: 1 })
    } else if (this.state.voteStatus == 1) {
      let voteId= this.state.voteId
      this.props.deleteVote(voteId)
      this.setState({ voteStatus: null })
    } else {
      let voteId= this.state.voteId
      this.props.deleteVote(voteId)
      let VotePayload={
        direction: 1,
        review_id: this.props.id
      }
      this.props.addNewVote(VotePayload)
      this.setState({ voteStatus: 1 })
    }
    this.checkUserVotes()
  }


  handleDownVoteClick(event){
    if (this.state.voteStatus == null){
      let VotePayload={
        direction: -1,
        review_id: this.props.id
      }
      this.props.addNewVote(VotePayload)
      this.setState({ voteStatus: -1 })
    } else if (this.state.voteStatus == -1) {
      let voteId= this.state.voteId
      this.props.deleteVote(voteId)
      this.setState({ voteStatus: null })
    } else {
      let voteId= this.state.voteId
      this.props.deleteVote(voteId)
      let VotePayload={
        direction: -1,
        review_id: this.props.id
      }
      this.props.addNewVote(VotePayload)
      this.setState({ voteStatus: -1 })
    }
    this.checkUserVotes()
  }

  render() {
    console.log(this.state)
    let upVoteColor;
    let downVoteColor;
    if (this.state.voteStatus == 1){
      upVoteColor = 'blue'
    }
    if (this.state.voteStatus == -1){
      downVoteColor = 'blue'
    }

    let upvote = 0
    let downvote =0
    this.props.votes.forEach(vote => {
      if (vote.direction == 1) {
        upvote= upvote + 1
      }
      else {
        downvote= downvote + 1
      }
    })

    return(
        <div className="row medium-unstack">
          <div className="small-12 small-centered medium-10 medium-centered medium-expand columns">
          <div className="reviewTile">
            <div className="row medium-unstack">
              <div className="small-12 medium-5 columns">
                <h3>{this.props.username}: </h3>
              </div>
              <div className="small-12 medium-5 columns">
                <h4>Rating: {this.props.rating}</h4>
              </div>
            </div>
            <p>{this.props.review}</p>
            <h6>Upvotes: {upvote}</h6>
            <h6>Downvotes: {downvote}</h6>
            <h5 onClick={this.handleUpVoteClick}className={`fa fa-thumbs-up ${upVoteColor}`}  aria-hidden="true"></h5>
            <h5 onClick={this.handleDownVoteClick}className={`fa fa-thumbs-down ${downVoteColor}`} aria-hidden="true"></h5>
          </div>
        </div>
      </div>
    )
  }
}

export default ReviewTile;
