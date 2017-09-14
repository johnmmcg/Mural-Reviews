
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
      // onClickSpy
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <ReviewTile
        username="exampleUser"
        rating="4"
        review="I love it"
        currentUser= "1"
        votes={[
          {id: 1, direction: 1, user_id: 1},
          {id: 2, direction: -1, user_id: 2}
        ]}
        // addNewVote={onClickSpy}
        // deleteVote={onClickSpy}
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
    expect(wrapper.find('p').text()).toEqual("I love it")
  });

  // it('should render the upvote count', () => {
  //   expect(wrapper.find('h6')).toBePresent()
  //   expect(wrapper.find('h6').text()).toEqual('Upvotes')
  // });
  //
  // it('should render the downvote count', () => {
  //   expect(wrapper.find('h6')).toBePresent()
  //   expect(wrapper.find('h6').text()).toEqual('Downvotes')
  // });

});
