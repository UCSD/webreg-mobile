import React, { Component } from 'react';
import StatusBar from './StatusBar';
import classnames from 'classnames';
import { ReactComponent as CollapseIcon } from '../../assets/collapse-filled.svg';
import { ReactComponent as NavigateIcon } from '../../assets/collapse.svg';
import './CourseDetailTableComponent.scss';

const CellHeader = () => {
  return (
    <div className="cell-header">
      <div className="instructor-name">Gillespie, Gary N</div>
      <div className="selections-container">
        <div className="selection">Note</div>
        <div className="selection">Prereq</div>
        <div className="selection">Level</div>
      </div>
    </div>
  );
}

const CellSection = () => {
  return (
    <div className="cell-section">
      <div>
        <span style={{ color: '#7D7D7D' }}>A00</span>
        {' '}
        <span>LE</span>
      </div>
      <div>
        <span style={{ color: '#EAEAEA' }}>M</span>
        <span>T</span>
        <span style={{ color: '#EAEAEA' }}>W</span>
        <span>T</span>
        <span style={{ color: '#EAEAEA' }}>F</span>
      </div>
      <div>
        3:30p - 4:50p
      </div>
      <div>
        PCYNH 106
      </div>
    </div>
  );
}


class CourseDetailTableComponent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      expand: false,
    };
  }

  expandLecture = () => {
    const { expand } = this.state;
    this.setState({ expand: !expand })
  }

  renderLecture = (section) => {
    const { expand } = this.state;

    return (
      <div
        onClick={this.expandLecture}
      >
        <div className="table-cell-container" style={{ marginTop: 15 }}>
          <div className="table-cell-dot" />
          <div className="table-cell-detail">
            <CellHeader />
            <CellSection />
          </div>
          <CollapseIcon
            className={classnames("rotate", { "down": expand })}
          />
        </div>
      </div>
    );
  }

  renderDiscussion = () => {
    return (
      <div>
        <div className="table-cell-container">
          <div className="table-cell-dotted-line" />
          <div className="table-cell-detail">
            <CellSection />
            <StatusBar />
          </div>
          <NavigateIcon className="navigate-icon" />
        </div>
      </div>
    );
  }

  render() {
    return (
      <div className="course-detail-table-main">
        {this.renderLecture()}
        {this.renderDiscussion()}
      </div>
    );
  }
}

export default CourseDetailTableComponent;
