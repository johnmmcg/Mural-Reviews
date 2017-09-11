import MuralIndexContainer from '../../src/containers/MuralIndexContainer'
import MuralIndexTile from '../../src/components/MuralIndexTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('MuralIndexContainer', () => {
  let wrapper;

  beforeEach(() =>{
    wrapper= mount(
      <MuralIndexContainer/>
    )
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({murals: []})
  });

  it('should not render a MuralIndexTile component if not data given', () =>{
    expect(wrapper.find(MuralIndexTile)).not.toBePresent();
  })

  it('should render the MuralIndexTile component with specified props after setting the state', () => {
    wrapper.setState({
      murals: [{
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
      }]
    })
    expect(wrapper.find(MuralIndexTile)).toBePresent();
    expect(wrapper.find('h3').first().text()).toBe("R2-Q5")
    expect(wrapper.find)
  })
});
