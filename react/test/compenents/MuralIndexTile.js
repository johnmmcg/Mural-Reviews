
import MuralIndexTile from '../../src/components/MuralIndexTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('MuralIndexTile', () => {
  let name,
      location,
      description,
      rating,
      photo_url,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <MuralIndexTile
        id="1"
        name="Example Mural"
        photo_url="exampleMural.com/image"
      />
    )
  })

  it('should render an h3 tag for the name with props', () => {
    expect(wrapper.find('h3')).toBePresent();
    expect(wrapper.find('h3').text()).toBe("Example Mural");
  });

  it('should render h3 tag as link to mural show page', () => {
    expect(wrapper.find('a')).toBePresent();
  })

  it('should render a img tag with the photo_url as props', () => {
    expect(wrapper.find('img')).toBePresent();
    expect(wrapper.find('img').props()).toEqual({
      src: "exampleMural.com/image"});
  });
})
