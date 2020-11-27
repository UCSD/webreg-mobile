/* eslint-disable no-unused-vars */
import React from 'react';
import { BrowserRouter as Router, Route, Redirect } from 'react-router-dom';
import { Provider } from 'react-redux';
import { PersistGate } from 'redux-persist/integration/react';
import { store, persistor } from './reducers';
import Home from './components/Home';
import Boilerplate from './components/Boilerplate';
import Calendar from './components/Common/Calendar';
import { ListViewCard } from './components/Common';
import SearchResultCard from './components/Common/SearchResultCard';
import CourseDetailHeader from './components/Common/CourseDetailHeader';
import CourseDetailTableComponent from './components/Common/CourseDetailTableComponent';

import './App.css';

/** Private Route example */
const PrivateRoute = ({ component, ...rest }) => (
  <Route
    {...rest}
    render={({ location }) => (sessionStorage.getItem('authToken') ? (
      <Home />
    ) : (
      <Redirect to={{ pathname: '/user/login', state: { from: location } }} />
    ))}
  />
);

function App() {
  return (
    <Provider store={store}>
      <PersistGate loading={null} persistor={persistor}>
        <Router>
          <Route path="/" exact component={Home} />
        </Router>
        <Router>
          <Route path="/search-result-card" exact component={SearchResultCard} />
        </Router>
        <Router>
          <Route path="/course-detail-header" exact component={CourseDetailHeader} />
        </Router>
        <Router>
          <Route path="/course-detail-component" exact component={ListViewCard} />
        </Router>
      </PersistGate>
    </Provider>
  );
}

export default App;
