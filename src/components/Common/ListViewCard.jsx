import React, { Component } from 'react';
import { IconButton } from '@material-ui/core';

import {
  SecondaryText,
  PrimaryText,
  CourseDetailHeader,
  CardContainer,
  CourseUnitIcon,
  CourseTitle,
  CourseDescription,
  CourseHeaderContainer,
  EnrollStatus,
  IconsContainer,
  RepeatIcon,
  TrashIcon,
  AddIcon,
  CourseInfoContainer,
  RowContainer,
  CourseDetailContainer,
} from '../../styled';
import { Section, Final, DAYS_OF_WEEK } from './CourseDetailTableComponent';
import { parseSections } from '../../util';

const MOCK_DATA = {
  lecture: {
    subjectCode: 'COGS',
    courseCode: '187B',
    instructionType: 'LE',
    sectionNumber: '960510',
    sectionCode: 'A00',
    specialMeetingCode: '',
    longDescription: '',
    sectionStatus: null,
    enrollmentStatus: 'EN',
    gradeOption: 'L',
    creditHours: 4,
    gradeOptionPlus: true,
    creditHoursPlus: false,
    courseTitle: 'Practicum in Pro Web Design',
    enrollmentCapacity: 60,
    enrollmentQuantity: 64,
    countOnWaitlist: 2,
    stopEnrollmentFlag: true,
    classTimes: [
      {
        dayCode: '2',
        startDate: '2019-01-07',
        beginHHTime: '14',
        beginMMTime: '0',
        endHHTime: '15',
        endMMTime: '20',
        buildingCode: 'HSS',
        roomCode: '1346',
        endDate: '2019-03-15',
      },
      {
        dayCode: '4',
        startDate: '2019-01-07',
        beginHHTime: '14',
        beginMMTime: '0',
        endHHTime: '15',
        endMMTime: '20',
        buildingCode: 'HSS',
        roomCode: '1346',
        endDate: '2019-03-15',
      },
    ],
    instructors: [
      'Kirsh, David Joel',
    ],
  },
  final: {
    subjectCode: 'COGS',
    courseCode: '187B',
    instructionType: 'LE',
    sectionNumber: '960510',
    sectionCode: 'A00',
    specialMeetingCode: 'FI',
    longDescription: '',
    sectionStatus: null,
    enrollmentStatus: null,
    gradeOption: null,
    creditHours: null,
    gradeOptionPlus: false,
    creditHoursPlus: false,
    courseTitle: null,
    enrollmentCapacity: null,
    enrollmentQuantity: null,
    countOnWaitlist: null,
    stopEnrollmentFlag: false,
    classTimes: [
      {
        dayCode: '4',
        startDate: '2019-03-21',
        beginHHTime: '15',
        beginMMTime: '0',
        endHHTime: '17',
        endMMTime: '59',
        buildingCode: 'HSS',
        roomCode: '1346',
        endDate: null,
      },
    ],
    instructors: [
      'Kirsh, David Joel',
    ],
  },
  discussion: {
    subjectCode: 'COGS',
    courseCode: '187B',
    instructionType: 'DI',
    sectionNumber: '960510',
    sectionCode: 'A00',
    specialMeetingCode: '',
    longDescription: '',
    sectionStatus: null,
    enrollmentStatus: null,
    gradeOption: null,
    creditHours: null,
    gradeOptionPlus: false,
    creditHoursPlus: false,
    courseTitle: null,
    enrollmentCapacity: null,
    enrollmentQuantity: null,
    countOnWaitlist: null,
    stopEnrollmentFlag: false,
    classTimes: [
      {
        dayCode: '2',
        startDate: '2019-03-21',
        beginHHTime: '11',
        beginMMTime: '0',
        endHHTime: '11',
        endMMTime: '50',
        buildingCode: 'HSS',
        roomCode: '1346',
        endDate: null,
      },
    ],
    instructors: [
      'Kirsh, David Joel',
    ],
  },
};

const ENROLLED_COURSES = [{
  subjectCode: 'COGS',
  courseCode: '187B',
  instructionType: 'DI',
  sectionNumber: '960510',
  sectionCode: 'A00',
  specialMeetingCode: '',
  longDescription: '',
  sectionStatus: null,
  enrollmentStatus: 'EN',
  gradeOption: 'L',
  creditHours: 4,
  gradeOptionPlus: true,
  creditHoursPlus: false,
  courseTitle: 'Practicum in Pro Web Design',
  enrollmentCapacity: 60,
  enrollmentQuantity: 64,
  countOnWaitlist: 2,
  stopEnrollmentFlag: true,
  classTimes: [
    {
      dayCode: '2',
      startDate: '2019-01-07',
      beginHHTime: '14',
      beginMMTime: '0',
      endHHTime: '15',
      endMMTime: '20',
      buildingCode: 'HSS',
      roomCode: '1346',
      endDate: '2019-03-15',
    },
    {
      dayCode: '4',
      startDate: '2019-01-07',
      beginHHTime: '14',
      beginMMTime: '0',
      endHHTime: '15',
      endMMTime: '20',
      buildingCode: 'HSS',
      roomCode: '1346',
      endDate: '2019-03-15',
    },
  ],
  instructors: [
    'Kirsh, David Joel',
  ],
},
{
  subjectCode: 'COGS',
  courseCode: '187B',
  instructionType: 'LE',
  sectionNumber: '960510',
  sectionCode: 'A00',
  specialMeetingCode: 'FI',
  longDescription: '',
  sectionStatus: null,
  enrollmentStatus: null,
  gradeOption: null,
  creditHours: null,
  gradeOptionPlus: false,
  creditHoursPlus: false,
  courseTitle: null,
  enrollmentCapacity: null,
  enrollmentQuantity: null,
  countOnWaitlist: null,
  stopEnrollmentFlag: false,
  classTimes: [
    {
      dayCode: '4',
      startDate: '2019-03-21',
      beginHHTime: '15',
      beginMMTime: '0',
      endHHTime: '17',
      endMMTime: '59',
      buildingCode: 'HSS',
      roomCode: '1346',
      endDate: null,
    },
  ],
  instructors: [
    'Kirsh, David Joel',
  ],
},
{
  subjectCode: 'MUS',
  courseCode: '127',
  instructionType: 'LE',
  sectionNumber: '954672',
  sectionCode: 'A00',
  specialMeetingCode: '',
  longDescription: '',
  sectionStatus: null,
  enrollmentStatus: 'EN',
  gradeOption: 'L',
  creditHours: 4,
  gradeOptionPlus: true,
  creditHoursPlus: false,
  courseTitle: 'Discover Jazz',
  enrollmentCapacity: 114,
  enrollmentQuantity: 91,
  countOnWaitlist: 0,
  stopEnrollmentFlag: false,
  classTimes: [
    {
      dayCode: '2',
      startDate: '2019-01-07',
      beginHHTime: '11',
      beginMMTime: '0',
      endHHTime: '12',
      endMMTime: '20',
      buildingCode: 'CPMC',
      roomCode: '136',
      endDate: '2019-03-15',
    },
    {
      dayCode: '4',
      startDate: '2019-01-07',
      beginHHTime: '11',
      beginMMTime: '0',
      endHHTime: '12',
      endMMTime: '20',
      buildingCode: 'CPMC',
      roomCode: '136',
      endDate: '2019-03-15',
    },
  ],
  instructors: [
    'Davis, Anthony Curtis',
  ],
},
{
  subjectCode: 'MUS',
  courseCode: '127',
  instructionType: 'LE',
  sectionNumber: '954672',
  sectionCode: 'A00',
  specialMeetingCode: 'FI',
  longDescription: '',
  sectionStatus: null,
  enrollmentStatus: null,
  gradeOption: null,
  creditHours: null,
  gradeOptionPlus: false,
  creditHoursPlus: false,
  courseTitle: null,
  enrollmentCapacity: null,
  enrollmentQuantity: null,
  countOnWaitlist: null,
  stopEnrollmentFlag: false,
  classTimes: [
    {
      dayCode: '4',
      startDate: '2019-03-21',
      beginHHTime: '11',
      beginMMTime: '30',
      endHHTime: '14',
      endMMTime: '29',
      buildingCode: 'CPMC',
      roomCode: '136',
      endDate: null,
    },
  ],
  instructors: [
    'Davis, Anthony Curtis',
  ],
},
{
  subjectCode: 'PSYC',
  courseCode: '106',
  instructionType: 'LE',
  sectionNumber: '956892',
  sectionCode: 'A00',
  specialMeetingCode: '',
  longDescription: '',
  sectionStatus: null,
  enrollmentStatus: 'EN',
  gradeOption: 'L',
  creditHours: 4,
  gradeOptionPlus: true,
  creditHoursPlus: false,
  courseTitle: 'Behavioral Neuroscience',
  enrollmentCapacity: 328,
  enrollmentQuantity: 295,
  countOnWaitlist: 5,
  stopEnrollmentFlag: true,
  classTimes: [
    {
      dayCode: '2',
      startDate: '2019-01-07',
      beginHHTime: '9',
      beginMMTime: '30',
      endHHTime: '10',
      endMMTime: '50',
      buildingCode: 'PETER',
      roomCode: '110',
      endDate: '2019-03-15',
    },
    {
      dayCode: '4',
      startDate: '2019-01-07',
      beginHHTime: '9',
      beginMMTime: '30',
      endHHTime: '10',
      endMMTime: '50',
      buildingCode: 'PETER',
      roomCode: '110',
      endDate: '2019-03-15',
    },
  ],
  instructors: [
    'Dobkins, Karen R.',
  ],
},
{
  subjectCode: 'PSYC',
  courseCode: '106',
  instructionType: 'LE',
  sectionNumber: '956892',
  sectionCode: 'A00',
  specialMeetingCode: 'FI',
  longDescription: '',
  sectionStatus: null,
  enrollmentStatus: null,
  gradeOption: null,
  creditHours: null,
  gradeOptionPlus: false,
  creditHoursPlus: false,
  courseTitle: null,
  enrollmentCapacity: null,
  enrollmentQuantity: null,
  countOnWaitlist: null,
  stopEnrollmentFlag: false,
  classTimes: [
    {
      dayCode: '2',
      startDate: '2019-03-19',
      beginHHTime: '8',
      beginMMTime: '0',
      endHHTime: '10',
      endMMTime: '59',
      buildingCode: 'PETER',
      roomCode: '110',
      endDate: null,
    },
  ],
  instructors: [
    'Dobkins, Karen R.',
  ],
}];

const formatDayCodeText = (dayCode) => Object.keys(DAYS_OF_WEEK)[parseInt(dayCode, 10)];

const formatTime = (start, end) => `${start}${end}`.padEnd(4, '0');

const ENROLMENT_STATUS = {
  EN: 'ENROLLED',
  WL: 'WAITLIST',
  PL: 'PLANNED',
};

const GRADE_OPTIONS = {
  L: 'Letter',
  'P/NP': 'P/NP',
};

class ListViewCard extends Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }

  renderFinal = (final) => {
    const {
      startDate,
      dayCode,
      beginHHTime,
      beginMMTime,
      endHHTime,
      endMMTime,
      buildingCode,
      roomCode,
    } = final.classTimes[0];

    const dayCodeText = formatDayCodeText(dayCode);

    return (
      <Final
        meetingDate={startDate}
        dayCode={dayCodeText}
        startTime={formatTime(beginHHTime, beginMMTime)}
        endTime={formatTime(endHHTime, endMMTime)}
        buildingCode={buildingCode}
        roomCode={roomCode}
        style={{ paddingTop: '3px' }}
      />
    );
  }

  renderCourseSection = (di) => {
    const {
      sectionCode,
      instructionType,
      classTimes = [],
    } = di;

    const {
      beginHHTime,
      beginMMTime,
      endHHTime,
      endMMTime,
      buildingCode,
      roomCode,
    } = classTimes[0];

    return (
      <Section
        sectionCode={sectionCode}
        instructionType={instructionType}
        startTime={formatTime(beginHHTime, beginMMTime)}
        endTime={formatTime(endHHTime, endMMTime)}
        buildingCode={buildingCode}
        roomCode={roomCode}
        dayCodes={classTimes.map((m) => formatDayCodeText(m.dayCode))}
        style={{ padding: '1px 0' }}
      />
    );
  }

  renderEnrollmentStatus = (lecture) => {
    const {
      enrollmentStatus,
      gradeOption,
      countOnWaitlist,
    } = lecture;

    switch (enrollmentStatus) {
      case 'EN':
        return (
          <EnrollStatus status="enrolled">
            {`Enrolled - ${GRADE_OPTIONS[gradeOption]}`}
          </EnrollStatus>
        );
      case 'WL':
        return (
          <EnrollStatus status="waitlist">
            {`Waitlist - ${countOnWaitlist}`}
          </EnrollStatus>
        );
      default:
        return (
          <EnrollStatus status="planned">
            Planned
          </EnrollStatus>
        );
    }
  }

  render() {
    const {
      lecture = MOCK_DATA.lecture,
      discussion = MOCK_DATA.discussion,
      final = MOCK_DATA.final,
    } = this.props;

    const {
      subjectCode,
      courseCode,
      courseTitle,
      creditHours,
      instructors,
      sectionNumber,
      enrollmentStatus,
      gradeOption,
    } = lecture;

    // const {
    //   lecture,
    //   discussion,
    //   final,
    // } = parseSections(sections);

    return (
      <CardContainer>
        <CourseInfoContainer>
          <CourseHeaderContainer>
            <CourseUnitIcon>
              <div>{creditHours}</div>
            </CourseUnitIcon>
            <div>
              <CourseTitle>{`${subjectCode} ${courseCode}`}</CourseTitle>
              <CourseDescription>{courseTitle}</CourseDescription>
            </div>
            {this.renderEnrollmentStatus(lecture)}
          </CourseHeaderContainer>
          <CourseDetailContainer>
            <CourseDetailHeader>
              <PrimaryText>{instructors[0]}</PrimaryText>
              <div>
                <SecondaryText>Section ID</SecondaryText>
                {' '}
                {sectionNumber}
              </div>
            </CourseDetailHeader>
            {this.renderCourseSection(lecture)}
            {this.renderCourseSection(discussion)}
            {this.renderFinal(final)}
          </CourseDetailContainer>
        </CourseInfoContainer>
        <IconsContainer>
          <IconButton size="small">
            <RepeatIcon />
          </IconButton>
          <IconButton size="small">
            <TrashIcon />
          </IconButton>
          <IconButton size="small">
            <AddIcon />
          </IconButton>
        </IconsContainer>
      </CardContainer>
    );
  }
}

export default ListViewCard;
