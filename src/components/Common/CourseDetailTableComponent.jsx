import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { Collapse, IconButton } from '@material-ui/core';
import _ from 'lodash';
import { parseSections } from '../../util';
import StatusBar from './StatusBar';

import {
  TableCellContainer,
  TableCellDot,
  TableCellDottedLine,
  TableCellDetail,
  CellHeader,
  InstructorName,
  Selection,
  CellSection,
  TableCellDotContainer,
  ExpandIcon,
  NavigationIcon,
  DayOfWeek,
  PrereqLabel,
} from '../../styled';

const MOCK_COURSE2 = {
  subjectCode: 'CSE ',
  courseCode: '105  ',
  departmentCode: 'CSE',
  courseTitle: 'Theory of Computation',
  unitsMin: 4,
  unitsMax: 4,
  unitsInc: 0,
  academicLevel: 'UD',
  sections: [
    {
      sectionId: '947977',
      termCode: 'FA18',
      sectionCode: 'A00',
      instructionType: 'LE',
      sectionStatus: 'NC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 0,
      capacityQuantity: 158,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1200',
          endTime: '1250',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
        {
          dayCode: 'WE',
          dayCodeIsis: 'W',
          startTime: '800',
          endTime: '850',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
        {
          dayCode: 'FR',
          dayCodeIsis: 'F',
          startTime: '800',
          endTime: '850',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
      ],
      additionalMeetings: [
        {
          meetingType: 'RE',
          meetingDate: '2018-10-22',
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1900',
          endTime: '2050',
          buildingCode: 'PCYNH',
          roomCode: '106',
        },
        {
          meetingType: 'FI',
          meetingDate: '2018-12-10',
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '800',
          endTime: '1059',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
        {
          meetingType: 'RE',
          meetingDate: '2018-11-18',
          dayCode: 'SU',
          dayCodeIsis: 'U',
          startTime: '1300',
          endTime: '1450',
          buildingCode: 'PCYNH',
          roomCode: '106',
        },
        {
          meetingType: 'RE',
          meetingDate: '2018-12-09',
          dayCode: 'SU',
          dayCodeIsis: 'U',
          startTime: '1200',
          endTime: '1350',
          buildingCode: 'LEDDN',
          roomCode: 'AUD',
        },
      ],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
    {
      sectionId: '947978',
      termCode: 'FA18',
      sectionCode: 'A01',
      instructionType: 'DI',
      sectionStatus: 'AC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 47,
      capacityQuantity: 80,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1400',
          endTime: '1450',
          buildingCode: 'CENTR',
          roomCode: '212',
        },
      ],
      additionalMeetings: [],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
    {
      sectionId: '947979',
      termCode: 'FA18',
      sectionCode: 'A02',
      instructionType: 'DI',
      sectionStatus: 'AC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 38,
      capacityQuantity: 80,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1500',
          endTime: '1550',
          buildingCode: 'CENTR',
          roomCode: '212',
        },
      ],
      additionalMeetings: [],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
    {
      sectionId: '947980',
      termCode: 'FA18',
      sectionCode: 'B00',
      instructionType: 'LE',
      sectionStatus: 'NC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 0,
      capacityQuantity: 158,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '900',
          endTime: '950',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
        {
          dayCode: 'WE',
          dayCodeIsis: 'W',
          startTime: '900',
          endTime: '950',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
        {
          dayCode: 'FR',
          dayCodeIsis: 'F',
          startTime: '900',
          endTime: '950',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
      ],
      additionalMeetings: [
        {
          meetingType: 'RE',
          meetingDate: '2018-10-22',
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1900',
          endTime: '2050',
          buildingCode: '',
          roomCode: '',
        },
        {
          meetingType: 'FI',
          meetingDate: '2018-12-12',
          dayCode: 'WE',
          dayCodeIsis: 'W',
          startTime: '800',
          endTime: '1059',
          buildingCode: 'MANDE',
          roomCode: 'B-210',
        },
        {
          meetingType: 'RE',
          meetingDate: '2018-11-18',
          dayCode: 'SU',
          dayCodeIsis: 'U',
          startTime: '1300',
          endTime: '1450',
          buildingCode: '',
          roomCode: '',
        },
        {
          meetingType: 'RE',
          meetingDate: '2018-12-09',
          dayCode: 'SU',
          dayCodeIsis: 'U',
          startTime: '1200',
          endTime: '1350',
          buildingCode: '',
          roomCode: '',
        },
      ],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
    {
      sectionId: '947981',
      termCode: 'FA18',
      sectionCode: 'B01',
      instructionType: 'DI',
      sectionStatus: 'AC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 74,
      capacityQuantity: 80,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'FR',
          dayCodeIsis: 'F',
          startTime: '1500',
          endTime: '1550',
          buildingCode: 'CENTR',
          roomCode: '212',
        },
      ],
      additionalMeetings: [],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
    {
      sectionId: '947982',
      termCode: 'FA18',
      sectionCode: 'B02',
      instructionType: 'DI',
      sectionStatus: 'AC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 66,
      capacityQuantity: 80,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'FR',
          dayCodeIsis: 'F',
          startTime: '1600',
          endTime: '1650',
          buildingCode: 'CENTR',
          roomCode: '212',
        },
      ],
      additionalMeetings: [],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
  ],
};

const MOCK_COURSE = {
  subjectCode: 'CSE ',
  courseCode: ' 20',
  departmentCode: 'CSE',
  courseTitle: 'Intro/Discrete Mathematics',
  unitsMin: 4,
  unitsMax: 4,
  unitsInc: 0,
  academicLevel: 'LD',
  sections: [
    {
      sectionId: '947805',
      termCode: 'FA18',
      sectionCode: 'A00',
      instructionType: 'LE',
      sectionStatus: 'NC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 0,
      capacityQuantity: 180,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1100',
          endTime: '1150',
          buildingCode: 'WLH',
          roomCode: '2005',
        },
        {
          dayCode: 'WE',
          dayCodeIsis: 'W',
          startTime: '1100',
          endTime: '1150',
          buildingCode: 'WLH',
          roomCode: '2005',
        },
        {
          dayCode: 'FR',
          dayCodeIsis: 'F',
          startTime: '1100',
          endTime: '1150',
          buildingCode: 'WLH',
          roomCode: '2005',
        },
      ],
      additionalMeetings: [
        {
          meetingType: 'FI',
          meetingDate: '2018-12-11',
          dayCode: 'TU',
          dayCodeIsis: 'T',
          startTime: '1130',
          endTime: '1429',
          buildingCode: 'WLH',
          roomCode: '2005',
        },
        {
          meetingType: 'RE',
          meetingDate: '2018-12-09',
          dayCode: 'SU',
          dayCodeIsis: 'U',
          startTime: '1200',
          endTime: '1350',
          buildingCode: 'WLH',
          roomCode: '2005',
        },
      ],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
    {
      sectionId: '947806',
      termCode: 'FA18',
      sectionCode: 'A01',
      instructionType: 'DI',
      sectionStatus: 'AC',
      subtitle: '',
      startDate: '2018-09-27',
      endDate: '2018-12-07',
      enrolledQuantity: 164,
      capacityQuantity: 181,
      stopEnrollmentFlag: false,
      printFlag: '',
      subterm: '01',
      planCode: 'ST',
      recurringMeetings: [
        {
          dayCode: 'MO',
          dayCodeIsis: 'M',
          startTime: '1800',
          endTime: '1850',
          buildingCode: 'PCYNH',
          roomCode: '106',
        },
      ],
      additionalMeetings: [],
      instructors: [
        {
          pid: 'A08066291',
          instructorName: 'Jones, Miles E',
          primaryInstructor: true,
          instructorEmailAddress: 'mej016@ucsd.edu',
          workLoadUnitQty: 1,
          percentOfLoad: 100,
        },
      ],
    },
  ],
};

// TODO: where is waitlist count in data??

export const DAYS_OF_WEEK = {
  MO: {
    elip: 'M',
    full: 'Mon',
  },
  TU: {
    elip: 'T',
    full: 'Tue',
  },
  WE: {
    elip: 'W',
    full: 'Wed',
  },
  TH: {
    elip: 'T',
    full: 'Thu',
  },
  FR: {
    elip: 'F',
    full: 'Fri',
  },
};

const formatTime = (time) => {
  const padded = time.padStart(4, '0');
  let hr = parseInt(padded.slice(0, 2), 10);
  const min = padded.slice(2);
  let ampm = 'a';
  if (hr >= 12) {
    if (hr > 12) {
      hr -= 12;
    }
    ampm = 'p';
  }
  return `${hr}:${min}${ampm}`;
};

const formatDate = (unformatedDate, day) => {
  const date = unformatedDate.split('-');
  return `${DAYS_OF_WEEK[day].full} ${date[1]}/${date[2]}`;
};

const Header = ({
  instructorName,
  note,
}) => (
  <CellHeader>
    <InstructorName>{instructorName}</InstructorName>
    <Selection>Note</Selection>
  </CellHeader>
);

export const Section = ({
  sectionCode,
  instructionType,
  startTime,
  endTime,
  buildingCode,
  roomCode,
  dayCodes,
  style,
}) =>
// const {
//   sectionCode,
//   instructionType,
//   recurringMeetings = [],
// } = data;
// const {
//   startTime,
//   endTime,
//   buildingCode,
//   roomCode,
// } = recurringMeetings[0];

// const dayCodes = recurringMeetings.map((m) => m.dayCode);

  (
    <CellSection style={style}>
      <div>
        <span style={{ color: '#7D7D7D' }}>{sectionCode}</span>
        {' '}
        <span>{instructionType}</span>
      </div>
      <div>
        {Object.keys(DAYS_OF_WEEK).map((day) => {
          const active = dayCodes.includes(day);
          return (
            <DayOfWeek active={active}>{DAYS_OF_WEEK[day].elip}</DayOfWeek>
          );
        })}
      </div>
      <div>
        {`${formatTime(startTime)} - ${formatTime(endTime)}`}
      </div>
      <div>
        {`${buildingCode} ${roomCode}`}
      </div>
    </CellSection>
  );

export const Final = ({
  meetingDate,
  dayCode,
  startTime,
  endTime,
  buildingCode,
  roomCode,
  style,
}) => (
  <CellSection style={style}>
    <div style={{ color: '#7D7D7D' }}>
      FINAL
    </div>
    <div style={{ color: '#034263' }}>
      {formatDate(meetingDate, dayCode)}
    </div>
    <div>
      {`${formatTime(startTime)} - ${formatTime(endTime)}`}
    </div>
    <div>
      {`${buildingCode} ${roomCode}`}
    </div>
  </CellSection>
);

const CourseDetailTableComponent = ({ sections = MOCK_COURSE2.sections }) => {
  const [expand, setExpand] = useState(false);

  const expandLecture = () => {
    setExpand(!expand);
  };

  const renderLecture = (lecture) => {
    const {
      sectionCode,
      instructionType,
      recurringMeetings = [],
    } = lecture;

    const {
      startTime,
      endTime,
      buildingCode,
      roomCode,
    } = recurringMeetings[0];

    return (
      <div
        onClick={expandLecture}
      >
        <TableCellContainer style={{ marginTop: 15 }}>
          <TableCellDotContainer expand={expand}>
            <TableCellDot />
            <TableCellDottedLine halfHeight />
          </TableCellDotContainer>
          <TableCellDetail lecture>
            <Header
              instructorName={lecture.instructors[0].instructorName}
            />
            <Section
              sectionCode={sectionCode}
              instructionType={instructionType}
              startTime={startTime}
              endTime={endTime}
              buildingCode={buildingCode}
              roomCode={roomCode}
              dayCodes={recurringMeetings.map((m) => m.dayCode)}
            />
          </TableCellDetail>
          <IconButton size="small">
            <ExpandIcon rotate={expand} />
          </IconButton>
        </TableCellContainer>
      </div>
    );
  };

  const renderDiscussion = (di) => {
    const {
      sectionCode,
      instructionType,
      recurringMeetings = [],
      enrolledQuantity,
      capacityQuantity,
    } = di;

    const {
      startTime,
      endTime,
      buildingCode,
      roomCode,
    } = recurringMeetings[0];

    return (
      <div>
        <TableCellContainer>
          <TableCellDottedLine />
          <TableCellDetail>
            <Section
              sectionCode={sectionCode}
              instructionType={instructionType}
              startTime={startTime}
              endTime={endTime}
              buildingCode={buildingCode}
              roomCode={roomCode}
              dayCodes={recurringMeetings.map((m) => m.dayCode)}
            />
            <StatusBar
              enrolledQuantity={enrolledQuantity}
              capacityQuantity={capacityQuantity}
            />
          </TableCellDetail>
          <NavigationIcon />
        </TableCellContainer>
      </div>
    );
  };

  const renderFinal = (final) => {
    const {
      meetingDate,
      dayCode,
      startTime,
      endTime,
      buildingCode,
      roomCode,
    } = final;

    return (
      <TableCellContainer>
        <TableCellDotContainer reverse expand={expand}>
          <TableCellDottedLine halfHeight />
          <TableCellDot />
        </TableCellDotContainer>
        <TableCellDetail smallPadding>
          <Final
            meetingDate={meetingDate}
            dayCode={dayCode}
            startTime={startTime}
            endTime={endTime}
            buildingCode={buildingCode}
            roomCode={roomCode}
          />
        </TableCellDetail>
      </TableCellContainer>
    );
  };

  // KEEP: TODO use this when creating the course detail view
  // renderPrereq = () => (
  //   <TableCellContainer style={{ marginTop: 8 }}>
  //     {/* <CellSection> */}
  //     <div />
  //     <TableCellDetail>
  //       <PrereqLabel>
  //         Course Prerequisites & Level Restrictions
  //       </PrereqLabel>
  //     </TableCellDetail>
  //     <IconButton size="small">
  //       <ExpandIcon />
  //     </IconButton>
  //     {/* </CellSection> */}
  //   </TableCellContainer>
  // )

  // organize sections by instruction type: LE, DI
  const {
    lecture,
    discussion,
    final,
  } = parseSections(sections);
  // const groupedSections = _.groupBy(sections, 'instructionType');
  // const lecture = groupedSections.LE[0];
  // const groupedAdditionalMeetings = _.groupBy(lecture.additionalMeetings, 'meetingType');

  return (
    <div>
      {renderLecture(lecture)}
      <Collapse in={expand}>
        {discussion.map((di) => renderDiscussion(di))}
      </Collapse>
      {renderFinal(final)}
    </div>
  );
};

export default CourseDetailTableComponent;
