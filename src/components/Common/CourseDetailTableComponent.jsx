import React, { Component, useState } from 'react';
import { ChevronRight } from '@styled-icons/material';
import { Collapse, IconButton } from '@material-ui/core';
import StatusBar from './CourseAvailabilityBar';
// import { ReactComponent as CollapseIcon } from '../../assets/collapse-filled.svg';
// import { ReactComponent as NavigationIcon } from '../../assets/collapse.svg';
// import './CourseDetailTableComponent.scss';
import {
  TableCellContainer,
  TableCellDot,
  TableCellDottedLine,
  TableCellDetail,
  CellHeader,
  InstructorName,
  SelectionsContainer,
  Selection,
  CellSection,
  TableCellDotContainer,
  ExpandIcon,
  NavigationIcon,
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

const Final = () => (
  <CellSection>
    <div style={{ color: '#7D7D7D' }}>
      FINAL
    </div>
    <div style={{ color: '#034263' }}>
      Mon 12/12
    </div>
    <div>
      3:00p - 5:59p
    </div>
    <div>
      TBA
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

    console.log('expand', expand);

    return (
      <div
        onClick={this.expandLecture}
      >
        <TableCellContainer style={{ marginTop: 15 }}>
          <TableCellDotContainer>
            <TableCellDot />
            <TableCellDottedLine halfHeight hide={!expand} />
          </TableCellDotContainer>
          <TableCellDetail>
            <Header />
            <Section />
          </TableCellDetail>
          <IconButton size="small">
            <ExpandIcon rotate={expand} />
          </IconButton>
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
        <NavigationIcon />
      </TableCellContainer>
    </div>
  )

  renderFinal = () => (
    <TableCellContainer>
      <TableCellDotContainer reverse>
        <TableCellDottedLine halfHeight />
        <TableCellDot />
      </TableCellDotContainer>
      <TableCellDetail smallPadding>
        <Final />
      </TableCellDetail>
    </TableCellContainer>
  )

  render() {
    const { expand } = this.state;
    return (
      <div className="course-detail-table-main">
        {this.renderLecture()}
        <Collapse in={expand}>
          {/* <div id="test">testtet</div> */}
          {this.renderDiscussion()}
          {this.renderFinal()}
        </Collapse>
      </div>
    );
  }
}

export default CourseDetailTableComponent;
