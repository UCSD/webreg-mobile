import React from 'react';
import SearchResultCard from './SearchResultCard';

const DEFAULT_SEARCH_RESULTS = [
  {
    units: 2,
    title: 'CSE 3',
    description: 'Fluency/Information Technology',
  },
  {
    units: 4,
    title: 'CSE 5A',
    description: 'Introduction to Programming',
  },
  {
    units: 4,
    title: 'CSE 8B',
    description: 'Intro/Computer Sci. Java (II)',
  },
  {
    units: 4,
    title: 'CSE 12',
    description: 'Basic Data Struc & OO Design',
  },
  {
    units: 4,
    title: 'CSE 101',
    description: 'Design and Analysis of Algorithms',
  },
]

const SearchResultCourseList = ({ searchResult = DEFAULT_SEARCH_RESULTS }) => {

  return (
    <div>
      {searchResult.map(({
        units,
        title,
        description,
      }) => (
        <SearchResultCard
          units={units}
          title={title}
          description={description}
        />
      ))}
    </div>
  );
}

export default SearchResultCourseList;
