import { rgba } from 'polished';
import { ArrowRepeat, TrashFill, PlusCircleFill } from '@styled-icons/bootstrap';
import { SearchResultCardContainer } from './searchResultCard';

const {
  default: styled,
} = require('styled-components');

const IconStyle = `
  width: 20px;
  height: 20px;
  fill: #034263;
`;

const Text = styled.span`
font-size: ${(props) => (props.size === 'small' ? '10px' : '12px')};
`;

export const CardContainer = styled.div`
  margin: 8px 16px;
  display: grid;
  grid-template-columns: 1fr 45px;
  border: ${(props) => {
    switch (props.status) {
      case 'waitlist': return '2px dashed #034263;';
      case 'planned': return `2px solid ${rgba(151, 151, 151, 0.5)};`;
      default: return '2px solid #034263;';
    }
  }}
  border-radius: 10px;
  overflow: hidden;
  font-size: 12px;
`;

export const CourseInfoContainer = styled.div`
  padding: 5px 11px;
`;

export const CourseDetailHeader = styled.div`
  display: flex;
  justify-content: space-between;
  padding-bottom: 6px;
`;

export const PrimaryText = styled(Text)`
  color: #034263;
`;

export const SecondaryText = styled(Text)`
  color: #7D7D7D;
`;

export const CourseHeaderContainer = styled(SearchResultCardContainer)`
  position: relative;
  border: none;
  box-shadow: none;
  margin: 0;
  padding: 0;
`;

export const CourseDetailContainer = styled.div`
  padding-top: 8px;
`;

export const EnrollStatus = styled.div`
  position: absolute;
  top: 0;
  right: 0;
  font-size: 12px;
  line-heigth: 14px;
  color: ${(props) => {
    switch (props.status) {
      case 'planned':
        return '#979797';
      case 'waitlist':
        return '#D27070';
      default:
        return '#034263';
    }
  }};
`;

export const IconsContainer = styled.div`
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  border-left: 1px solid ${rgba(3, 66, 99, 0.1)};
`;

export const RepeatIcon = styled(ArrowRepeat)`
  ${IconStyle}
`;

export const TrashIcon = styled(TrashFill)`
  ${IconStyle}
`;

export const AddIcon = styled(PlusCircleFill)`
  width: 18px;
  height: 18px;
  fill: #034263;
  opacity: ${(props) => (props.disabled ? '20%' : '100%')};
`;
