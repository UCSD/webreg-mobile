import React from 'react';
import SmallCourseCard from './SmallCourseCard';
import {
  CalendarBody,
  CalendarContainer,
  CalendarHeader,
  CalendarHeaderItem,
  CalendarSchedule,
  CalendarScheduleItem,
  CalendarTimeline,
  CalendarTimelineItem,
  CalendarCourseContainer,
} from '../../../styled';

const times = [
  '8am',
  '9am',
  '10am',
  '11am',
  '12pm',
  '1pm',
  '2pm',
  '3pm',
  '4pm',
  '5pm',
  '6pm',
  '7pm',
  '8pm',
  '9pm',
  '10pm',
];

const Calendar = () => (
  <CalendarContainer>
    <CalendarHeader>
      <CalendarHeaderItem time />
      <CalendarHeaderItem>Sun</CalendarHeaderItem>
      <CalendarHeaderItem>Mon</CalendarHeaderItem>
      <CalendarHeaderItem>Tues</CalendarHeaderItem>
      <CalendarHeaderItem>Wed</CalendarHeaderItem>
      <CalendarHeaderItem>Thurs</CalendarHeaderItem>
      <CalendarHeaderItem>Fri</CalendarHeaderItem>
      <CalendarHeaderItem>Sat</CalendarHeaderItem>
    </CalendarHeader>
    <CalendarBody>
      <CalendarTimeline>
        {times.map((time) => (
          <CalendarTimelineItem key={`course-time-${time}`}>
            {time}
          </CalendarTimelineItem>
        ))}
      </CalendarTimeline>
      <CalendarSchedule>
        {times.map((time) => (
          <CalendarScheduleItem key={`course-grid-row-${time}`} />
        ))}
        <CalendarCourseContainer>
          <SmallCourseCard
            datePrefix="2020-06-06T"
            startTime="09:00"
            endTime="09:50"
            dayOfWeek={2}
            type="LE"
            title="CSE 120"
            location="PCYNH 112"
            focused
          />
          <SmallCourseCard
            datePrefix="2020-06-06T"
            startTime="09:00"
            endTime="09:50"
            dayOfWeek={4}
            type="LE"
            title="CSE 121"
            location="PCYNH 112"
          />
          <SmallCourseCard
            datePrefix="2020-06-06T"
            startTime="09:00"
            endTime="09:50"
            dayOfWeek={6}
            type="LE"
            title="CSE 122"
            location="PCYNH 112"
          />
          <SmallCourseCard
            datePrefix="2020-06-06T"
            startTime="14:00"
            endTime="15:20"
            dayOfWeek={1}
            type="LE"
            title="COGS 10"
            location="WLH 110"
          />
          <SmallCourseCard
            datePrefix="2020-06-06T"
            startTime="10:00:00"
            endTime="10:50:00"
            dayOfWeek={1}
            type="DI"
            title="CSE 123"
            location="PCYNH 112"
          />
        </CalendarCourseContainer>
      </CalendarSchedule>
    </CalendarBody>
  </CalendarContainer>
);

export default Calendar;
