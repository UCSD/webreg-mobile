import React from 'react';
import {
  AccessAlarm, Search, ExpandMore, ExpandLess,
} from '@material-ui/icons';
import { IconButton } from '@material-ui/core';
import Header from '../Common/Header';
import './index.scss';

const styles = {
  headerTextStyle: {
    marginTop: 10,
    marginBottom: 10,
  },
  rightContainerStyle: {
    backgroundColor: '#F1F1F1',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 7,
    borderRadius: 22,
    borderColor: '#034263',
    boxSizing: 'border-box',
  },
  searchIconStyle: {
    color: 'black',
    fontSize: 26,
    marginTop: 3,
    marginBottom: 3,
    marginRight: 10,
    marginLeft: 28,
  },
  iconStyle: {
    margin: 0,
    padding: 0,
    color: 'black',
  },
};

const TERMS = ['Spring 2019', 'Summer I 2019', 'Summer II 2019', 'Special Summer 2019', 'Fall 2019'];

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      term: 'Spring 2019',
      termSelector: false,
    };
  }

  render() {
    const {
      headerTextStyle, rightContainerStyle, searchIconStyle, iconStyle,
    } = styles;
    const { term, termSelector } = this.state;

    const webRegText = <p style={headerTextStyle}>Webreg</p>;
    const searchTab = (
      <div style={rightContainerStyle}>
        <Search style={searchIconStyle} />
      </div>
    );
    return (
      <div className="home">
        <Header center={webRegText} right={searchTab} />
        <div className="quarter-container">
          <div className="icon-container">
            <IconButton
              disableRipple
              style={iconStyle}
              onClick={() => { console.log('clicked'); }}
            >
              <AccessAlarm style={{ fontSize: 22 }} />
            </IconButton>
          </div>
          <p style={{ margin: 0, fontWeight: 500 }}>{term}</p>
          <div className="icon-container">
            <IconButton
              style={iconStyle}
              disableRipple
              onClick={() => { this.setState({ termSelector: !termSelector }); }}
            >
              {termSelector
                ? <ExpandLess style={{ fontSize: 30 }} />
                : <ExpandMore style={{ fontSize: 30 }} />}
            </IconButton>
          </div>
        </div>
      </div>
    );
  }
}

export default Home;
