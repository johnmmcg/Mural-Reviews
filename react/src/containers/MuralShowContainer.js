import React, { Component } from 'react'
import MuralShowTile from '../components/MuralShowTile'

class MuralShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mural: null
      // id: this.props.params.id
    }
  }

  componentDidMount() {
    fetch(`/api/v1/murals/${this.props.params.id}`)
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
      .then( body => {
        this.setState({ mural: body })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));


  }

  render() {
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
        {muralShow}
      </div>
    )
  }
}

export default MuralShowContainer;
