import React, { Component } from 'react'
import MuralIndexTile from '../components/MuralIndexTile'

class MuralIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      murals: []
    }
  }

  componentDidMount() {
    fetch('/api/v1/murals')
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
        this.setState({ murals: body })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let muralsIndex
    muralsIndex = this.state.murals.map(mural => {
      return (
        <MuralIndexTile
          key={mural.id}
          id={mural.id}
          name={mural.name}
          photo_url={mural.photo_url}
        />
      )
    })

    return (
      <div className="small-4 medium-8 columns muralIndex">
        {muralsIndex}
      </div>
    )
  }
}

export default MuralIndexContainer;
