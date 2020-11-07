import React, { Component } from 'react';
import './SearchResultCard.scss';
import { ReactComponent as BookMarkIcon } from '../../assets/bookmark.svg';
import { ReactComponent as FilledBookMarkIcon } from '../../assets/bookmark-filled.svg';

const SearchResultCard = ({ 
  units = 2,
  title = 'CSE 3',
  description = 'Fluency/Information Technology',
  bookmarked = false,
  onClick,
}) => (
  <div className="search-result-card">
    <div className="course-unit-icon">
      <div className="course-unit-text">{units}</div>
    </div>
    <div>
      <div className="course-title">{title}</div>
      <div className="course-description">{description}</div>
    </div>
    <div className="course-favorite-icon" onClick={onClick}>
      {bookmarked ? <FilledBookMarkIcon /> : <BookMarkIcon /> }
    </div>
  </div>
);

export default SearchResultCard;
