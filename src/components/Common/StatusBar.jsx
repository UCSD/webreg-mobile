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
  waitlistQuantity: 10,
  total: 100,
};

const StatusBar = ({ availableSeats, capacityQuantity, waitlistQuantity }) => {
  // const { enrolledQuantity, waitlistQuantity, capacityQuantity } = data;
  // const availableSeats = capacityQuantity - enrolledQuantity;

  if (availableSeats > 0 || waitlistQuantity > 0) {
    const percentage = (availableSeats / capacityQuantity) * 100;
    const leftStyle = {
      width: `${percentage}%`,
      marginRight: 1,
    };

    const rightStyle = {
      width: `${100 - percentage}%`,
      backgroundColor: waitlistQuantity > 0 ? '#D27070' : '#C4C4C4',
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

const CourseAvailabilityBar = ({
  enrolledQuantity = 0,
  waitlistQuantity = 0,
  capacityQuantity = 0,
  style,
}) => {
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
        <StatusBarLabel color={waitlistQuantity > 0 ? '#D27070' : '#C4C4C4'}>
          {waitlistQuantity > 0 ? `Waitlist ${waitlistQuantity}` : `Enrolled ${enrolledQuantity}`}
        </StatusBarLabel>
      </StatusBarLabelsContainer>
      <StatusBar
        availableSeats={availableSeats}
        capacityQuantity={capacityQuantity}
        waitlistQuantity={waitlistQuantity}
      />
    </StatusBarContainer>
  );
};

export default CourseAvailabilityBar;
