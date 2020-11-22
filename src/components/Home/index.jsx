import React from 'react';
import {
  AccessAlarm, Search, ExpandMore, ExpandLess,
} from '@material-ui/icons';
import { withStyles } from '@material-ui/core/styles';
import {
  IconButton, BottomNavigationAction, BottomNavigation, Menu, MenuItem,
} from '@material-ui/core';
import { Calendar, Header } from '../Common';
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
  root: {
    backgroundColor: '#FAFAFA',
  },
  actionItemStyle: {
    backgroundColor: '#FAFAFA',
    color: '#7D7D7D',
    '&$selected': {
      color: '#034263',
    },
  },
  selected: {},
  label: {
    paddingTop: 5,
    paddingBottom: 5,
    fontSize: 14,
    '&$selected': {
      borderBottom: '1px solid #034263',
    },
  },
  menuItem: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
};

const TERMS = ['Spring 2019', 'Summer I 2019', 'Summer II 2019', 'Special Summer 2019', 'Fall 2019'];

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      term: 'Spring 2019',
      expandSelector: false,
      bottomTab: 'calendar',
    };
    this.selectorRef = React.createRef();
  }

  renderContent = () => {
    const { bottomTab } = this.state;
    switch (bottomTab) {
      case 'calendar':
        return <Calendar />;
      case 'list':
        return (
          <div style={{
            height: '100%', display: 'flex', justifyContent: 'center', alignItems: 'center',
          }}
          >
            <p>List</p>
          </div>
        );
      case 'final':
        return (
          <div style={{
            height: '100%', display: 'flex', justifyContent: 'center', alignItems: 'center',
          }}
          >
            <p>Final</p>
          </div>
        );
      default:
        return <Calendar />;
    }
  }

  handleClick = () => {
    const { expandSelector } = this.state;
    this.setState({ expandSelector: !expandSelector });
  };

  handleClose = () => {
    this.setState({ expandSelector: false });
  };

  handleSelect = (term) => {
    this.setState({ term, expandSelector: false });
  }

  renderQuarter = () => {
    const { iconStyle } = styles;
    const { term, expandSelector } = this.state;
    const { classes } = this.props;

    return (
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
        <div ref={this.selectorRef} className="quater-text-container">
          <p style={{ margin: 0, fontWeight: 500 }}>{term}</p>
        </div>
        <div className="icon-container">
          <IconButton
            aria-controls="term"
            aria-haspopup="true"
            style={iconStyle}
            disableRipple
            onClick={this.handleClick}
          >
            {expandSelector
              ? <ExpandLess style={{ fontSize: 30 }} />
              : <ExpandMore style={{ fontSize: 30 }} />}
          </IconButton>
          <Menu
              id="term"
              anchorEl={this.selectorRef.current}
              keepMounted
              open={expandSelector}
              onClose={this.handleClose}
              getContentAnchorEl={null}
              anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
              transformOrigin={{ vertical: 'top', horizontal: 'center' }}
          >
            {TERMS.map((t) => (
              <MenuItem
                classes={{ root: classes.menuItem }}
                key={t}
                onClick={() => this.handleSelect(t)}
              >
                {t}
              </MenuItem>
            ))}
          </Menu>
        </div>
      </div>
    );
  }

  render() {
    const { classes } = this.props;
    const {
      headerTextStyle, rightContainerStyle, searchIconStyle,
    } = styles;
    const { bottomTab } = this.state;

    const webRegText = <p style={headerTextStyle}>Webreg</p>;
    const searchTab = (
      <div style={rightContainerStyle}>
        <Search style={searchIconStyle} />
      </div>
    );

    return (
      <div className="home">
        <Header center={webRegText} right={searchTab} />
        {this.renderQuarter()}
        {this.renderContent()}
        <BottomNavigation
          value={bottomTab}
          onChange={(event, newValue) => {
            this.setState({ bottomTab: newValue });
          }}
          showLabels
          className={classes.root}
        >
          <BottomNavigationAction
            classes={{
              root: classes.actionItemStyle,
              selected: classes.selected,
              label: classes.label,
            }}
            label="Calendar"
            value="calendar"
          />
          <BottomNavigationAction
            classes={{
              root: classes.actionItemStyle,
              selected: classes.selected,
              label: classes.label,
            }}
            label="List"
            value="list"
          />
          <BottomNavigationAction
            classes={{
              root: classes.actionItemStyle,
              selected: classes.selected,
              label: classes.label,
            }}
            label="Final"
            value="final"
          />
        </BottomNavigation>
      </div>
    );
  }
}

export default withStyles(styles)(Home);
