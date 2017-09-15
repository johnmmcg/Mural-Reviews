import React, { Component } from 'react'
import MuralIndexTile from '../components/MuralIndexTile'

class MuralIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      murals: [],
      search: ''
    }
    this.updateSearch=this.updateSearch.bind(this)
    this.handleSubmit=this.handleSubmit.bind(this)
  }

  updateSearch(event) {
    this.setState({search: event.target.value.substr(0, 20)});
  }

  handleSubmit(event) {
    event.preventDefault();
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
    let filteredMurals = this.state.murals.filter(
      (mural) => {
        return mural.name.toLowerCase().indexOf(
          this.state.search.toLowerCase()) !== -1;
      }
    )



    muralsIndex = filteredMurals.map(mural => {
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

      <div>
        <form className="search" onSubmit={this.handleSubmit}>
          <input className="search"
            type="text"
            name="Search"
            id="Search"
            placeholder="Search"
            value={this.state.search}
            onChange={this.updateSearch}
          />
        </form>
        {muralsIndex}
      </div>
    )
  }
}

export default MuralIndexContainer;
