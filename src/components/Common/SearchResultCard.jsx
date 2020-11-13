import React, { Component } from 'react';
// import './SearchResultCard.scss';
import { IconButton } from '@material-ui/core';
import {
  SearchResultCardContainer,
  CourseTitle,
  CourseDescription,
  CourseUnitIcon,
  BookMarkUnfilled,
  BookMarkFilled,
  BookMarkIconContainer,
} from '../../styled';

const SearchResultCard = ({
  units = 2,
  title = 'CSE 3',
  description = 'Fluency/Information Technology',
  bookmarked = false,
  onClick,
}) => (
  <SearchResultCardContainer>
    <CourseUnitIcon>
      <div>{units}</div>
    </CourseUnitIcon>
    <div>
      <CourseTitle>{title}</CourseTitle>
      <CourseDescription>{description}</CourseDescription>
    </div>
    <BookMarkIconContainer onClick={onClick}>
      <IconButton size="small">
        {bookmarked ? <BookMarkFilled /> : <BookMarkUnfilled /> }
      </IconButton>
    </BookMarkIconContainer>
  </SearchResultCardContainer>
);

export default SearchResultCard;
