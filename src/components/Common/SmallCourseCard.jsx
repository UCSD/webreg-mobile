import React from 'react';
import moment from 'moment';
import './SmallCourseCard.scss';

const calcDuration = (start, end) => moment.duration(moment(end).diff(moment(start))).asMinutes();

// startTime / endTime format: hh:mm
// dayOfWeek format: [1,7]
// datePrefix format: yyyy-mm-ddT
const SmallCourseCard = ({ startTime, endTime, dayOfWeek, type, title, location, datePrefix = "2020-10-20T" }) => {

  const calculateCardPosition = (startTime, endTime, dayOfWeek = 1) => {
    // height
    const calcRowSpan = (startTime, endTime) => {
      const classDuration = calcDuration(startTime, endTime);
      const classStart = calcDuration(`${datePrefix}09:00:00`, startTime);
      const rowStart = Math.floor(classStart / 10) + 1;
      return `${rowStart}/${rowStart + Math.floor(classDuration / 10)}`;
    }

    // width
    // assume dayOfWeek is 1 (Sunday) to 7 (Saturday)
    const calcColSpan = (dayOfWeek) => {
      console.log(`${dayOfWeek}/${dayOfWeek+1}`);
      return `${dayOfWeek}/${dayOfWeek+1}`;
    }
    
    return {
      gridRow: calcRowSpan(datePrefix + startTime, datePrefix + endTime),
      gridColumn: calcColSpan(dayOfWeek),
    };
  };

  return (
    <div className="calendar-card" style={{ ...calculateCardPosition(startTime, endTime, dayOfWeek) }}>
    <div className="calendar-card-type">{type}</div>
    <div className="calendar-card-detail">
      <div className="calendar-card-title">{title}</div>
      <div>{location}</div>
    </div>
  </div>
  );
}

export default SmallCourseCard;
