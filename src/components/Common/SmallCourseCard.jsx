import React from 'react';
import moment from 'moment';
import classnames from 'classnames';
import './SmallCourseCard.scss';

const calcDuration = (start, end) => moment.duration(moment(end).diff(moment(start))).asMinutes();

// startTime / endTime format: hh:mm
// dayOfWeek format: [1,7]
// datePrefix format: yyyy-mm-ddT
const SmallCourseCard = ({
  startTime,
  endTime,
  dayOfWeek,
  type,
  title,
  location,
  datePrefix = '2020-10-20T',
  focused = true,
}) => {
  const calculateCardPosition = (startTime, endTime, dayOfWeek = 1) => {
    // height
    const calcRowSpan = (startTime, endTime) => {
      // Calculate the duration of class in minutes
      const classDuration = calcDuration(startTime, endTime);
      // The earlist class starts from 8am in the morning
      const classStart = calcDuration(`${datePrefix}08:00:00`, startTime);
      // Calculate the offset in multiple of ten minutes
      const rowStart = Math.floor(classStart / 10) + 1;
      // grid-row-start / grid-row-end
      return `${rowStart}/${rowStart + Math.floor(classDuration / 10)}`;
    };

    // width
    // assume dayOfWeek is 1 (Sunday) to 7 (Saturday)
    const calcColSpan = (dayOfWeek) => {
      // console.log(`${dayOfWeek}/${dayOfWeek + 1}`);
      return `${dayOfWeek}/${dayOfWeek + 1}`;
    };

    return {
      gridRow: calcRowSpan(datePrefix + startTime, datePrefix + endTime),
      gridColumn: calcColSpan(dayOfWeek),
    };
  };

  return (
    <div className={classnames('calendar-card', { 'calendar-card-focused': focused })} style={{ ...calculateCardPosition(startTime, endTime, dayOfWeek) }}>
      <div className="calendar-card-type">{type}</div>
      <div className="calendar-card-detail">
        <div className="calendar-card-title">{title}</div>
        <div>{location}</div>
      </div>
    </div>
  );
};

export default SmallCourseCard;
