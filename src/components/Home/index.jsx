import React, { useState, useRef, useEffect } from 'react';
import {
  AccessAlarm, Search, ExpandLess, ArrowForwardIos,
} from '@material-ui/icons';
import { withStyles } from '@material-ui/core/styles';
import {
  IconButton, BottomNavigationAction, BottomNavigation, Menu, MenuItem, Collapse, Switch,
} from '@material-ui/core';
import { Sliders } from 'react-bootstrap-icons';
import Draggable from 'react-draggable';
import { Calendar, Header } from '../Common';
import ListView from '../ListView';
import {
  SearchTab,
  SearchInput,
  TermSelect,
  SearchTabExpanded,
  TermText,
  UnfoldIcon,
  AnimatedContainer,
  AnimatedHeaderContainer,
  SearchContainer,
} from '../../styled';
import { ReactComponent as CollapseIcon } from '../../assets/collapse-icon.svg';
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
<<<<<<< HEAD
    marginTop: 3,
    marginBottom: 3,
    marginRight: 10,
    marginLeft: 28,
=======
>>>>>>> 5851fc23a6ae33d5d55ac38b8c2671b6b74988f2
  },
  iconStyle: {
    margin: 0,
    padding: 0,
    color: 'black',
  },
<<<<<<< HEAD
=======
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
>>>>>>> 5851fc23a6ae33d5d55ac38b8c2671b6b74988f2
};

const TERMS = ['Spring 2019', 'Summer I 2019', 'Summer II 2019', 'Special Summer 2019', 'Fall 2019'];

<<<<<<< HEAD
=======
const SwitchButton = withStyles((theme) => ({
  // the background
  root: {
    width: 38,
    height: 23,
    padding: 0,
  },
  switchBase: {
    padding: 1,
    '&$checked': {
      transform: 'translateX(16px)',
      color: theme.palette.common.white,
      '& + $track': {
        backgroundColor: '#52d869',
        opacity: 1,
        border: 'none',
      },
    },
    boxShadow: '0px 1.5px 1.5px rgba(0, 0, 0, 0.5)',
  },
  // the round button
  thumb: {
    width: 21,
    height: 21,
  },
  // deselected state
  track: {
    borderRadius: 26 / 2,
    backgroundColor: '#D7D7D7',
    opacity: 1,
    border: 'none',
  },
  checked: {},
  focusVisible: {},
}))(({ classes, ...props }) => (
  <Switch
    focusVisibleClassName={classes.focusVisible}
    disableRipple
    classes={{
      root: classes.root,
      switchBase: classes.switchBase,
      thumb: classes.thumb,
      track: classes.track,
      checked: classes.checked,
    }}
    {...props}
  />
));

const UseFocus = () => {
  const htmlElRef = useRef(null);
  const setFocus = () => {
    console.log('set focus', htmlElRef.current);
    if (htmlElRef.current) htmlElRef.current.focus();
  };

  return [htmlElRef, setFocus];
};

const AnimationHeader = ({ expand, setExpand }) => {
  const {
    headerIconStyle, headerIconContainerStyle, searchIconStyle,
  } = styles;

  const [expandFilters, setExpandFilters] = useState(false);
  const [inputRef, setInputFocus] = UseFocus();

  useEffect(() => { setInputFocus(); });

  return (
    <div className="animated-container">
      <AnimatedContainer expand={expand}>
        <AnimatedHeaderContainer>
          <div style={headerIconContainerStyle}>
            <ArrowForwardIos
              style={headerIconStyle}
              onClick={() => {
                setExpand(false);
                setExpandFilters(false);
              }}
            />
          </div>
          <SearchTabExpanded style={{ paddingLeft: 0 }}>
            <TermSelect>
              <TermText>FA 19</TermText>
              <UnfoldIcon />
            </TermSelect>
            {/* <input ref={inputRef} /> */}
            <SearchInput autoFocus ref={inputRef} />
            <Search style={searchIconStyle} />
          </SearchTabExpanded>
          <IconButton style={headerIconContainerStyle} aria-expanded={expandFilters}>
            <Sliders
              style={headerIconStyle}
              onClick={() => { setExpandFilters(!expandFilters); }}
            />
          </IconButton>
        </AnimatedHeaderContainer>
      </AnimatedContainer>
      {expand && (
        <SearchContainer>
          Search by course code
          <br />
          eg. ANTH 23
        </SearchContainer>
      )}
      <Collapse
        in={expandFilters}
        // timeout="auto"
        className="filter-dropdown"
        unmountOnExit
        style={{ position: 'absolute', top: 48, left: 0 }}
      >
        <div className="filter-container">
          <div className="filter-item">
            Show lower division
            <SwitchButton />
          </div>
          <div className="filter-item">
            Show upper division
            <SwitchButton />
          </div>
          <div className="filter-item">
            Show graduate division
            <SwitchButton />
          </div>
          <Draggable
            onDrag={() => {
              console.log('dargged');
              setExpandFilters(false);
            }}
          >
            <CollapseIcon style={{ marginTop: 8 }} />
          </Draggable>
        </div>
      </Collapse>
    </div>
  );
};

const NavigationProvider = ({
  classes, updateBottomTab, quarter, content, bottomTab,
}) => (
  <>
    {quarter}
    {content}
    <BottomNavigation
      value={bottomTab}
      onChange={(_, newValue) => {
        updateBottomTab(newValue);
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
  </>
);

>>>>>>> 5851fc23a6ae33d5d55ac38b8c2671b6b74988f2
class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      term: 'Spring 2019',
<<<<<<< HEAD
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
=======
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

  setExpandSearchbar = (expand) => {
    this.setState({ expandSearchbar: expand });
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
      headerTextStyle, searchIconStyle,
    } = styles;
    const { bottomTab, expandSearchbar } = this.state;

    const webRegText = <p style={headerTextStyle}>Webreg</p>;
    const searchTab = (
      <SearchTab
        onClick={() => {
          this.setExpandSearchbar(true);
        }}
      >
        <Search style={searchIconStyle} />
      </SearchTab>
    );

    return (
      <div className="home">
        <div className="header-container">
          <Header
            center={webRegText}
            right={searchTab}
            expand={expandSearchbar}
          />
        </div>
        {expandSearchbar
          ? (
            <SearchContainer>
              Search by course code
              <br />
              eg. ANTH 23
            </SearchContainer>
          )
          : (
            <NavigationProvider
              classes={classes}
              updateBottomTab={(tab) => { this.setState({ bottomTab: tab }); }}
              quarter={this.renderQuarter()}
              content={this.renderContent()}
              bottomTab={bottomTab}
            />
          )}
        <AnimationHeader
          expand={expandSearchbar}
          setExpand={this.setExpandSearchbar}
        />
>>>>>>> 5851fc23a6ae33d5d55ac38b8c2671b6b74988f2
      </div>
    );
  }
}

<<<<<<< HEAD
export default Home;
=======
export default withStyles(styles)(Home);
>>>>>>> 5851fc23a6ae33d5d55ac38b8c2671b6b74988f2
