import React from 'react';
// import './SmallCourseCard.scss';
import {
  CalendarCard, CalendarCardBody, CalendarCardHeader, CalendarCardTitle,
} from '../../../styled';
import { calculateCardPosition } from '../../../util';

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
  focused = false,
  onClick = () => {},
}) => (
  <CalendarCard
    focused={focused}
    style={{
      ...calculateCardPosition(startTime, endTime, dayOfWeek, datePrefix),
    }}
    onClick={onClick}
  >
    <CalendarCardHeader>{type}</CalendarCardHeader>
    <CalendarCardBody>
      <CalendarCardTitle>{title}</CalendarCardTitle>
      <div>{location}</div>
    </CalendarCardBody>
  </CalendarCard>
);

export default SmallCourseCard;
