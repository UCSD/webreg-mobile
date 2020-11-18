import React from 'react';
// import './StatusBar.scss';
import {
  StatusBarContainer,
  StatusBarLabelsContainer,
  StatusBarLabel,
  BarContainer,
  Bar,
  LeftBar,
  RightBar,
} from '../../styled';

const DEFAULT_DATA = {
  availableSeats: 0,
  waitlistCount: 10,
  total: 100,
};

const StatusBar = ({ data }) => {
  const { availableSeats, waitlistCount, total } = data;

  if (availableSeats > 0 || waitlistCount > 0) {
    const percentage = availableSeats / total * 100;
    const leftStyle = {
      width: `${percentage}%`,
      marginRight: 1,
    };

    const rightStyle = {
      width: `${100 - percentage}%`,
      backgroundColor: waitlistCount > 0 ? '#D27070' : '#C4C4C4',
    };

    return (
      <BarContainer>
        <LeftBar style={leftStyle} />
        <RightBar style={rightStyle} />
      </BarContainer>
    );
  }

  return (
    <div className="bar-container">
      <Bar />
    </div>
  );
};

const CourseAvailabilityBar = ({ data = DEFAULT_DATA, style }) => {
  const { availableSeats, waitlistCount, total } = data;

  return (
    <StatusBarContainer style={style}>
      <StatusBarLabelsContainer>
        <StatusBarLabel color="#034263">
          {`Available ${availableSeats}`}
        </StatusBarLabel>
        <StatusBarLabel color="#7D7D7D">
          {`Total ${total}`}
        </StatusBarLabel>
        <StatusBarLabel color={waitlistCount > 0 ? '#D27070' : '#C4C4C4'}>
          {waitlistCount > 0 ? `Waitlist ${waitlistCount}` : `Enrolled ${total - availableSeats}`}
        </StatusBarLabel>
      </StatusBarLabelsContainer>
      <StatusBar data={data} />
    </StatusBarContainer>
  );
};

export default CourseAvailabilityBar;
