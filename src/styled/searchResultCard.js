import { rgba } from 'polished';
import { BookmarkFill, Bookmark } from '@styled-icons/bootstrap';
import { IconButton } from '@material-ui/core';

const {
  default: styled,
} = require('styled-components');

export const SearchResultCardContainer = styled.div`
  height: 44px;
  margin: 5px 30px;
  padding: 3px 11px 6px;
  background-color: #fbfbfb;
  box-shadow: 0 1px 2px ${rgba(0, 0, 0, 0.1)};
  border-radius: 10px;
  display: grid;
  grid-template-columns: 1.3fr 7fr 0.7fr;
  align-items: center;
`;

export const CourseTitle = styled.div`
  font-weight: bold;
  font-size: 18px;
  line-height: 21px;
`;

export const CourseDescription = styled.div`
  font-size: 14px;
  line-height: 16px;
`;

export const CourseUnitIcon = styled.div`
  width: 28px;
  height: 28px;
  border-radius: 14px;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  background-color: #eaeaea;
  font-size: 14px;
`;

export const BookMarkIconContainer = styled.div`
  display: flex;
  justify-content: flex-end;
  align-items: center;
`;

export const BookMarkUnfilled = styled(Bookmark)`
  width: ${(props) => (props.size === 'large' ? '17px' : '13px')};
`;

export const BookMarkFilled = styled(BookmarkFill)`
  width: ${(props) => (props.size === 'large' ? '17px' : '13px')};
  fill: #FCC500;
  color: #FCC500;
`;
