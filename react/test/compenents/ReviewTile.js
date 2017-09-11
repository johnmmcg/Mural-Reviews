
import ReviewTile from '../../src/components/ReviewTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ReviewTile', () => {
  let name,
      location,
      description,
      rating,
      photo_url,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <ReviewTile
        username="exampleUser"
        rating="4"
        review="I love it"
      />
    );
  });

  it('should render the username', () => {
    expect(wrapper.find('h3')).toBePresent()
    expect(wrapper.find('h3').text()).toEqual('exampleUser')
  });

  it('should render the rating', () => {
    expect(wrapper.find('h4')).toBePresent()
    expect(wrapper.find('h4').text()).toEqual('Rating: 4')
  });

  it('should render the review', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toEqual('I love it')
  });

  // it('should render the net vote count', () => {
  // 
  // });
});
