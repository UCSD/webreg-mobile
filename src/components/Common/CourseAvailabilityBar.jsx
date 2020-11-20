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
  capacityQuantity: 180,
  enrolledQuantity: 0,
  availableSeats: 0,
  waitlistCount: 10,
  total: 100,
};

const StatusBar = ({ availableSeats, capacityQuantity, waitlistCount }) => {
  // const { enrolledQuantity, waitlistCount, capacityQuantity } = data;
  // const availableSeats = capacityQuantity - enrolledQuantity;

  if (availableSeats > 0 || waitlistCount > 0) {
    const percentage = (availableSeats / capacityQuantity) * 100;
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
  const { enrolledQuantity, waitlistCount, capacityQuantity } = data;
  const availableSeats = capacityQuantity - enrolledQuantity;

  return (
    <StatusBarContainer style={style}>
      <StatusBarLabelsContainer>
        <StatusBarLabel color="#034263">
          {`Available ${availableSeats}`}
        </StatusBarLabel>
        <StatusBarLabel color="#7D7D7D">
          {`Total ${capacityQuantity}`}
        </StatusBarLabel>
        <StatusBarLabel color={waitlistCount > 0 ? '#D27070' : '#C4C4C4'}>
          {waitlistCount > 0 ? `Waitlist ${waitlistCount}` : `Enrolled ${enrolledQuantity}`}
        </StatusBarLabel>
      </StatusBarLabelsContainer>
      <StatusBar
        availableSeats={availableSeats}
        capacityQuantity={capacityQuantity}
        waitlistCount={waitlistCount}
      />
    </StatusBarContainer>
  );
};

export default CourseAvailabilityBar;
