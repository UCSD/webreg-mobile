import React, { useState, useEffect } from 'react';
import {
  AccessAlarm, Search, ExpandLess, ArrowForwardIos,
} from '@material-ui/icons';
import { withStyles } from '@material-ui/core/styles';
import {
  IconButton, BottomNavigationAction, BottomNavigation, Menu, MenuItem,
} from '@material-ui/core';
import { Sliders } from 'react-bootstrap-icons';
import { Calendar, Header } from '../Common';
import ListView from '../ListView';
import { SearchTab } from '../../styled';
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
  },
  iconStyle: {
    margin: 0,
    padding: 0,
    color: 'black',
  },
  headerIconStyle: {
    fontSize: 24,
    color: 'white',
    alignSelf: 'center',
    justifySelf: 'center',
  },
  headerIconContainerStyle: {
    display: 'flex',
    justifyContent: 'center',
    width: '100%',
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
    minHeight: 42,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
};

const TERMS = ['Spring 2019', 'Summer I 2019', 'Summer II 2019', 'Special Summer 2019', 'Fall 2019'];

const AnimationHeader = () => {
  const {
    headerIconStyle, headerIconContainerStyle, searchIconStyle,
  } = styles;

  const [animate, setAnimate] = useState(false);

  useEffect(() => {
    setAnimate(true);
  });

  return (
    <Header
      left={(
        <div style={headerIconContainerStyle}>
          <ArrowForwardIos style={headerIconStyle} />
        </div>
      )}
      center={(
        <SearchTab
          expand={animate}
        >
          <Search style={searchIconStyle} />
        </SearchTab>
      )}
      right={(
        <div style={headerIconContainerStyle}>
          <Sliders style={headerIconStyle} />
        </div>
      )}
      expand
    />
  );
};

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      term: 'Spring 2019',
      expandSelector: false,
      bottomTab: 'calendar',
      expandSearchbar: false,
    };
    this.selectorRef = React.createRef();
  }

  renderContent = () => {
    const { bottomTab } = this.state;
    switch (bottomTab) {
      case 'calendar':
        return <Calendar />;
      case 'list':
        return <ListView />;
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
        <div
          ref={this.selectorRef}
          className="quater-text-container"
          aria-controls="term"
          aria-haspopup="true"
          onClick={this.handleClick}
        >
          <p style={{ margin: 0, fontWeight: 500 }}>{term}</p>
        </div>
        <div className="icon-container">
          <IconButton
            style={iconStyle}
            onClick={this.handleClick}
          >
            <ExpandLess className={`expand-icon ${expandSelector && 'rotate'}`} />
          </IconButton>
          <Menu
            id="term"
            anchorEl={this.selectorRef.current}
            keepMounted
            open={expandSelector}
            onClose={this.handleClose}
            selected={term}
            getContentAnchorEl={null}
            // anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
            // transformOrigin={{ vertical: 'top', horizontal: 'center' }}
          >
            {TERMS.map((t) => (
              <MenuItem
                classes={{ root: classes.menuItem }}
                key={t}
                onClick={() => this.handleSelect(t)}
                selected={t === term}
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
      headerTextStyle, searchIconStyle, headerIconStyle, headerIconContainerStyle,
    } = styles;
    const { bottomTab, expandSearchbar } = this.state;

    const webRegText = <p style={headerTextStyle}>Webreg</p>;
    const searchTab = (
      <SearchTab
        // expand={expandSearchbar}
        onClick={() => {
          this.setState({ expandSearchbar: true });
          console.log('search bar clicked!');
        }}
      >
        <Search style={searchIconStyle} />
      </SearchTab>
    );

    const leftHeader = expandSearchbar && (
      <div style={headerIconContainerStyle}>
        <ArrowForwardIos style={headerIconStyle} />
      </div>
    );

    const centerHeader = expandSearchbar ? searchTab : webRegText;

    const rightHeader = expandSearchbar ? (
      <div style={headerIconContainerStyle}>
        <Sliders style={headerIconStyle} />
      </div>
    ) : searchTab;

    return (
      <div className="home">
        {/* <Header
          left={expandSearchbar && leftHeader}
          center={centerHeader}
          right={rightHeader}
          expand={expandSearchbar}
        /> */}
        {
          expandSearchbar
            ? (
              <AnimationHeader />
            )
            : (
              <Header
                center={webRegText}
                right={searchTab}
                expand={false}
              />
            )
        }
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
