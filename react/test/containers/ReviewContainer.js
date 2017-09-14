import ReviewContainer from '../../src/containers/ReviewContainer'
import ReviewTile from '../../src/components/ReviewTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ReviewContainer', () => {
  let wrapper;

  beforeEach(() =>{
    wrapper= mount(
      <ReviewContainer id={1} />
    )
  })

  it('should render with initial state', () => {
    expect(wrapper.state()).toEqual({data: {}})
  })

  it('should not render a ReviewTile if no data given', () => {
    expect(wrapper.find(ReviewTile)).not.toBePresent()
  })

  it('should render the ReviewTile component with specified props after setting the state', () => {
    wrapper.setState({data:
      {
    "mural": {
      "id": 14,
      "name": "Philly Mural",
      "location": "Philadelphia",
      "photo_url": "https://robohash.org/enimmolestiaenam.png?size=300x300&set=set1",
      "created_at": "2017-09-12T20:59:21.512Z",
      "updated_at": "2017-09-12T20:59:21.512Z",
      "description": "Bridge",
      "average_rating": null,
      "rating": 4,
      "user_id": 12,
      "mural_upload": {
        "url": null
      }
    },
    "user": {
      "id": 12,
      "username": "Brian",
      "email": "brian@gmail.com",
      "created_at": "2017-09-12T20:58:21.725Z",
      "updated_at": "2017-09-14T16:16:58.700Z",
      "admin": false,
      "profile_photo": {
        "url": null
      }
    },
    "reviews": [
      {
        "id": 17,
        "body": "Love this bridge!",
        "rating": 4,
        "user": {
          "id": 12,
          "username": "Brian",
          "email": "brian@gmail.com",
          "created_at": "2017-09-12T20:58:21.725Z",
          "updated_at": "2017-09-14T16:16:58.700Z",
          "admin": false,
          "profile_photo": {
            "url": null
          }
        },
        "votes": [
          {
            "id": 248,
            "user_id": 12,
            "review_id": 17,
            "direction": 1,
            "created_at": "2017-09-14T14:32:17.157Z",
            "updated_at": "2017-09-14T14:32:17.157Z"
          },
          {
            "id": 153,
            "user_id": 13,
            "review_id": 17,
            "direction": 1,
            "created_at": "2017-09-14T01:46:19.215Z",
            "updated_at": "2017-09-14T01:46:19.215Z"
          }
        ]
      }
    ],
    "current_user": {
      "id": 12,
      "username": "Brian",
      "email": "brian@gmail.com",
      "created_at": "2017-09-12T20:58:21.725Z",
      "updated_at": "2017-09-14T16:16:58.700Z",
      "admin": false,
      "profile_photo": {
        "url": null
      }
    }
  }
    });
    expect(wrapper.find(ReviewTile)).toBePresent();
    expect(wrapper.find('h3').first().text()).toBe('Brian')
    expect(wrapper.find('h4').first().text()).toBe('Rating: 4')
  });
});
