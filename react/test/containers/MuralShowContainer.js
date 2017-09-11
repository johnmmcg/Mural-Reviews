import MuralShowContainer from '../../src/containers/muralShowContainer'
import MuralShowTile from '../../src/components/MuralShowTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('MuralShowContainer', () => {
  let wrapper;

  beforeEach(() =>{
    wrapper= mount(
      <MuralShowContainer
        params={1}
      />
    )
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({ mural: null })
  });

  it('should render the MuralShowTile component with specified props after setting the state', () => {
    wrapper.setState({
      mural: {
        "mural": {
          "id": 1,
          "name": "R2-Q5",
          "location": "Mustafar",
          "photo_url": "https://robohash.org/enimmolestiaenam.png?size=300x300&set=set1",
          "created_at": "2017-09-08T13:55:46.064Z",
          "updated_at": "2017-09-08T13:55:46.064Z",
          "description": "Strike me down, and I will become more powerful than you could possibly imagine.",
          "average_rating": null,
          "rating": 1,
          "user_id": 7
        },
        "user": {
          "id": 7,
          "username": "Count Dooku",
          "email": "jermain_funk@howell.org",
          "created_at": "2017-09-08T13:55:45.633Z",
          "updated_at": "2017-09-08T13:55:45.633Z"
          }
        }
    })
    expect(wrapper.find(MuralShowTile)).toBePresent();
    expect(wrapper.find('h1').text()).toBe("R2-Q5")
  })
});
