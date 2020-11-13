import React, { Component } from 'react';
import { IconButton } from '@material-ui/core';

import {
  CourseTitle,
  CourseDescription,
  DetailHeaderContainer,
  BackButton,
  CourseTerm,
  DetailHeaderContentContainer,
  BookMarkFilled,
  BookMarkUnfilled,
} from '../../styled';

const CourseDetailHeader = ({
  title = 'CSE 3',
  description = 'Fluency/Information Technology',
  term = 'FA19',
  bookmarked = false,
}) => (
  <DetailHeaderContainer>
    <IconButton size="small">
      <BackButton />
    </IconButton>
    <DetailHeaderContentContainer>
      <div>
        <CourseTitle>{title}</CourseTitle>
        <CourseDescription>{description}</CourseDescription>
      </div>
      <CourseTerm>{term}</CourseTerm>
    </DetailHeaderContentContainer>
    <IconButton size="small">
      {bookmarked ? <BookMarkFilled size="large" /> : <BookMarkUnfilled size="large" />}
    </IconButton>
  </DetailHeaderContainer>
);

export default CourseDetailHeader;
