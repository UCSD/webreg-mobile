import React, { Component } from 'react';

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
import { Section, Final } from './CourseDetailTableComponent';
import { parseSections } from '../../util';

const MOCK_COURSE2 = {
  subjectCode: 'CSE',
  courseCode: '105',
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

class ListViewCard extends Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }

  render() {
    const {
      subjectCode,
      courseCode,
      courseTitle,
      unitsMax,
      sections,
    } = MOCK_COURSE2;
    const {
      lecture,
      discussion,
      final,
    } = parseSections(sections);

    console.log('lecture', lecture);
    console.log('discussion', discussion);
    console.log('final', final);

    return (
      <CardContainer>
        <CourseInfoContainer>
          <CourseHeaderContainer>
            <CourseUnitIcon>
              <div>{unitsMax}</div>
            </CourseUnitIcon>
            <div>
              <CourseTitle>{`${subjectCode} ${courseCode}`}</CourseTitle>
              <CourseDescription>{courseTitle}</CourseDescription>
            </div>
            <EnrollStatus>Enrolled - Letter</EnrollStatus>
          </CourseHeaderContainer>
          <CourseDetailContainer>
            <CourseDetailHeader>
              <PrimaryText>{lecture.instructors[0].instructorName}</PrimaryText>
              <div>
                <SecondaryText>Section ID</SecondaryText>
                {' '}
                {lecture.sectionId}
              </div>
            </CourseDetailHeader>
            {discussion.map((di) => <Section data={di} style={{ padding: '1px 0' }} />)}
            <Final data={final} style={{ paddingTop: '3px' }} />
          </CourseDetailContainer>
        </CourseInfoContainer>
        <IconsContainer>
          <RepeatIcon />
          <TrashIcon />
          <AddIcon />
        </IconsContainer>
      </CardContainer>
    );
  }
}

export default ListViewCard;
