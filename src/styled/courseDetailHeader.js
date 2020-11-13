import { ChevronLeft } from '@styled-icons/material';

const {
  default: styled,
} = require('styled-components');

export const DetailHeaderContainer = styled.div`
  height: 45px;
  padding: 0 16px;
  display: grid;
  grid-template-columns: 1fr 7fr 1fr;
  align-items: center;
  justify-items: center;
`;

export const DetailHeaderContentContainer = styled.div`
  display: flex;
  column-gap: 6px;
`;

export const BackButton = styled(ChevronLeft)`
  width: 27px;
  height: 27px;
`;

export const CourseTerm = styled.div`
  display: inline;
  align-self: start;
  color: #7D7D7D;
  font-size: 12px;
  line-height: 14px;
`;

