import MuralShowTile from '../../src/components/MuralShowTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('MuralShowTile', () => {
  let name,
      location,
      description,
      photo_url,
      creator,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <MuralShowTile
        key="1"
        id= "1"
        name= "Example Mural"
        location= "Walnut St"
        photo_url= "exampleMural.com/image"
        creator="exampleUser"
        description= "example description"
      />
    )
  })

  it('should render an h1 tag for the name with props', () => {
    expect(wrapper.find('h1')).toBePresent();
    expect(wrapper.find('h1').text()).toBe("Example Mural");
  });

  it('should render an h4 tag for the location with props', () => {
    expect(wrapper.find('h4')).toBePresent();
    expect(wrapper.find('h4').text()).toBe("Walnut St");
  });

  it('should render a img tag with the photo_url as props', () => {
    expect(wrapper.find('img')).toBePresent();
    expect(wrapper.find('img').props()).toEqual({
      src: "exampleMural.com/image"});
  });

  it('should render an h3 tag for creator', () => {
    expect(wrapper.find('h3')).toBePresent();
    expect(wrapper.find('h3').text()).toEqual("Posted by exampleUser");
  });

  it('should render a p tag for description', () => {
    expect(wrapper.find('p')).toBePresent();
    expect(wrapper.find('p').text()).toEqual("example description");
  });
});
