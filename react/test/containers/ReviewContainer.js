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
            "updated_at": "2017-09-08T13:55:45.633Z",
            "admin": false
          },
          "reviews": [
            {
              "body": "Joe, gag on my fat dauber.",
              "rating": 2,
              "user": {
              "id": 8,
              "username": "Ben Solo",
              "email": "elia_pfannerstill@batz.biz",
              "created_at": "2017-09-08T13:55:45.765Z",
              "updated_at": "2017-09-08T13:55:45.765Z",
              "admin": false
            }
          },
          {
            "body": "Isn’t ‘bribe’ just another word for ‘love’?",
            "rating": 1,
            "user": {
            "id": 2,
            "username": "Poe Dameron",
            "email": "dedric_schmeler@schaefer.co",
            "created_at": "2017-09-08T13:55:44.990Z",
            "updated_at": "2017-09-08T13:55:44.990Z",
            "admin": false
          }
          },
          {
            "body": "I’ve got an idea–an idea so smart that my head would explode if I even began to know what I’m talking about.",
            "rating": 1,
            "user": {
            "id": 6,
            "username": "Bail Organa",
            "email": "alden@nitzsche.net",
            "created_at": "2017-09-08T13:55:45.503Z",
            "updated_at": "2017-09-08T13:55:45.503Z",
            "admin": false
            }
          }
        ]
      }
    });
    expect(wrapper.find(ReviewTile)).toBePresent();
    expect(wrapper.find('h3').first().text()).toBe('Ben Solo')
    expect(wrapper.find('h4').first().text()).toBe('Rating: 2')
  });
});
