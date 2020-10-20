import React, { Component } from 'react';
import SmallCourseCard from './SmallCourseCard';
import './Calendar.scss';

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

class Calendar extends Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }
 
  render() {
    return (
      <div className="calendar-main">
        <div className="calendar-header">
          <div className="time-column" />
          <div className="header-item">Sun</div>
          <div className="header-item">Mon</div>
          <div className="header-item">Tues</div>
          <div className="header-item">Wed</div>
          <div className="header-item">Thurs</div>
          <div className="header-item">Fri</div>
          <div className="header-item">Sat</div>
        </div>
        <div className="scroll-container">
          <div className="course-time-grid">
            {times.map((time, index) => <div key={`course-time-${index}`}>{time}</div>)}
          </div>
          <div className="course-schedule-grid">
            {times.map((_, index) => <div key={`course-grid-row-${index}`} />)}
            <div className="course-cards-overlay">
              <SmallCourseCard
                datePrefix="2020-06-06T"
                startTime="09:00"
                endTime="09:50"
                dayOfWeek={2}
                type="LE"
                title="CSE 120"
                location="PCYNH 112"
              />
              <SmallCourseCard
                datePrefix="2020-06-06T"
                startTime="09:00"
                endTime="09:50"
                dayOfWeek={4}
                type="LE"
                title="CSE 120"
                location="PCYNH 112"
              />
              <SmallCourseCard
                datePrefix="2020-06-06T"
                startTime="09:00"
                endTime="09:50"
                dayOfWeek={6}
                type="LE"
                title="CSE 120"
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
                title="CSE 120"
                location="PCYNH 112"
              />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Calendar;
