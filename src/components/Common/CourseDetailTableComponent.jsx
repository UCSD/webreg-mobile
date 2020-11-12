import React, { Component } from 'react';
import classnames from 'classnames';
import StatusBar from './CourseAvailabilityBar';
import { ReactComponent as CollapseIcon } from '../../assets/collapse-filled.svg';
import { ReactComponent as NavigationIcon } from '../../assets/collapse.svg';
// import './CourseDetailTableComponent.scss';
import {
  TableCellContainer,
  TableCellDot,
  TableCellDottedLine,
  TableCellDetail,
  Rotate,
  Down,
  CellHeader,
  InstructorName,
  SelectionsContainer,
  Selection,
  CellSection,
  TableCellDotContainer,
} from '../../styled';

const Header = () => (
  <CellHeader>
    <InstructorName>Gillespie, Gary N</InstructorName>
    <SelectionsContainer>
      <Selection>Note</Selection>
      <Selection>Prereq</Selection>
      <Selection>Level</Selection>
    </SelectionsContainer>
  </CellHeader>
);

const Section = () => (
  <CellSection>
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
  </CellSection>
);

class CourseDetailTableComponent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      expand: false,
    };
  }

  expandLecture = () => {
    const { expand } = this.state;
    this.setState({ expand: !expand });
  }

  renderLecture = (section) => {
    const { expand } = this.state;

    return (
      <div
        onClick={this.expandLecture}
      >
        <TableCellContainer style={{ marginTop: 15 }}>
          <TableCellDotContainer>
            <TableCellDot />
            <TableCellDottedLine halfHeight />
          </TableCellDotContainer>
          <TableCellDetail>
            <Header />
            <Section />
          </TableCellDetail>
          <CollapseIcon
            className={classnames('rotate', { down: expand })}
          />
        </TableCellContainer>
      </div>
    );
  }

  renderDiscussion = () => (
    <div>
      <TableCellContainer>
        <TableCellDottedLine />
        <TableCellDetail>
          <Section />
          <StatusBar />
        </TableCellDetail>
        <NavigationIcon style={{ transform: 'rotate(90deg)' }} />
      </TableCellContainer>
    </div>
  )

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
