import React from 'react';
import './StatusBar.scss';

const DEFAULT_DATA = {
  availableSeats: 0,
  waitlistCount: 10,
  total: 100,
}

const Bar = ({ data }) => {
  const { availableSeats, waitlistCount, total } = data;

  if (availableSeats > 0 || waitlistCount > 0) {
    const percentage = availableSeats / total * 100;
    const leftStyle = {
      width: `${percentage}%`,
      marginRight: 1,
    }

    const rightStyle = {
      width: `${100 - percentage}%`,
      backgroundColor: waitlistCount > 0 ? '#D27070' : '#C4C4C4',
    }

    return (
      <div className="bar-container">
        <div className="left-bar" style={leftStyle} />
        <div className="right-bar" style={rightStyle} />
      </div>
    )
  } 

  return (
    <div className="bar-container">
      <div className="bar" />
    </div>
  )
}

const StatusBar = ({ data = DEFAULT_DATA, style }) => {
  const { availableSeats, waitlistCount, total } = data;

  return (
    <div className="status-bar-container" style={style}>
      <div className="status-bar-labels-container">
        <div className="status-bar-label" style={{ color: '#034263' }}>Available {availableSeats}</div>
        <div className="status-bar-label" style={{ color: '#7D7D7D' }}>Total {total}</div>
        <div className="status-bar-label" style={{ color: waitlistCount > 0 ? '#D27070' : '#C4C4C4' }}>
          {waitlistCount > 0 ? `Waitlist ${waitlistCount}` : `Enrolled ${total - availableSeats}`}
        </div>
      </div>
      <Bar data={data} />
    </div>
  );
}

export default StatusBar;
