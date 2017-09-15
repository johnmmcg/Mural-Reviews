import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import MuralIndexContainer from './containers/MuralIndexContainer';
import NavBar from './components/NavBar';
import MuralShowContainer from './containers/MuralShowContainer';
import ReviewContainer from './containers/ReviewContainer';



const App = (props) => {
  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar}>
        <IndexRoute component={MuralIndexContainer} />
        <Route path='/murals/:id' component={MuralShowContainer}/>
      </Route>
    </Router>
  )
}

export default App;
 
