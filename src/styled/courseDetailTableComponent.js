import { relativeTimeRounding } from 'moment';

const {
  default: styled,
} = require('styled-components');

const rotate = styled.div`
  -moz-transform:rotate(90deg);
  -webkit-transform:rotate(90deg);
  transform:rotate(90deg);
`;

const transition = styled.div`
  -moz-transition: all .2s linear !important;
  -webkit-transition: all .2s linear !important;
  transition: all .2s linear !important;
`;

export const TableCellContainer = styled.div`
  margin: 6px 16px;
  background-color: #FBFBFB;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  display: grid;
  grid-template-columns: 32px 1fr 32px;
  align-items: center;
  justify-items: center;
  min-height: 26px;
`;

export const TableCellDot = styled.div`
  width: 8px;
  height: 8px;
  border-radius: 10px;
  border: 1px solid #034263;
`;

export const TableCellDottedLine = styled.div`
${
  (props) => (props.halfHeight ? `
    height: calc(50% - 8px);
  ` : 'height: 100%;')
}
  width: 0;
  border-right: 2px dashed #034163bb;
`;

export const TableCellDetail = styled.div`
  padding: 11px;
  width: 100%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  row-gap: 14px;
`;

// TODO: how to use styled component on icons
// how to use two classes => class1.class2 in styled components
export const Rotate = styled(transition)`
${
  (props) => props.expand && 'transform:rotate(90deg);'
}
`;

export const Down = styled(rotate)``;

export const CellHeader = styled.div`
  width: 100%;
  color: #034263;
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

export const InstructorName = styled.div`
  font-size: 12px;
  line-height: 14px;
`;

export const SelectionsContainer = styled.div`
  display: flex;
  column-gap: 10px;
`;

export const Selection = styled.div`
  width: 36px;
  height: 14px;
  border: 1px solid rgba(#034263, 0.6);
  border-radius: 3px;
  vertical-align: middle;
  text-align: center;
  font-size: 9px;
`;

export const CellSection = styled.div`
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 10px;
  line-height: 12px;
`;

export const TableCellDotContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-end;
  height: 100%;
  position: relative;
`;
