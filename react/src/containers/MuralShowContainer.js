import React, { Component } from 'react'
import MuralShowTile from '../components/MuralShowTile'
import ReviewContainer from './ReviewContainer'
import { Route, Redirect, browserHistory } from 'react-router'

class MuralShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mural: ""
    }
    this.adminDeleteMural=this.adminDeleteMural.bind(this)
  }

  componentDidMount() {
    fetch(`/api/v1/murals/${this.props.params.id}`, {
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
        this.setState({ mural: body })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  adminDeleteMural() {
    fetch(`/api/v1/murals/${this.props.params.id}`, {
      credentials: 'same-origin',
      method: 'DELETE',
    })
    .then(response => response.json())
    .then(body => {
      console.log(body)
    })
    browserHistory.push('/')
    window.location.reload()
  }


  render() {
    let deleteMuralButton

    if (this.state.mural.current_user && this.state.mural.current_user.admin){
      deleteMuralButton=
        <button
          className="btn btn-default"
          // onClick={this.adminDeleteMural}>Delete This Mural

          onClick={this.adminDeleteMural}>Delete This Mural


        </button>
    }

    let muralShow = ""
    if ( this.state.mural ) {
      muralShow =
        <MuralShowTile
          key= {this.state.mural.mural.id}
          id= {this.state.mural.mural.id}
          name= {this.state.mural.mural.name}
          location= {this.state.mural.mural.location}
          description= {this.state.mural.mural.description}
          photo_url= {this.state.mural.mural.photo_url}
          creator= {this.state.mural.user.username}
        />
    }
    return (
      <div>
        {deleteMuralButton}
        {muralShow}
        <hr />

        <div className="reviews">
          <ReviewContainer id={this.props.params.id} />
        </div>
      </div>
    )
  }
}

export default MuralShowContainer;
