import { rgba } from 'polished';
import { CaretLeftFill, ChevronRight } from '@styled-icons/bootstrap';

const {
  default: styled,
} = require('styled-components');

export const TableCellContainer = styled.div`
  margin: 6px 16px;
  margin-top: 1px;
  background-color: #FBFBFB;
  border-radius: 10px;
  display: grid;
  border: 1px solid ${rgba(0, 0, 0, 0.1)};
  grid-template-columns: 32px 1fr 32px;
  align-items: center;
  justify-items: center;
  min-height: 26px;
`;

export const TableCellDot = styled.div`
  width: 5px;
  height: 5px;
  border-radius: 10px;
  border: 1px solid #034263;
`;

export const TableCellDottedLine = styled.div`
height: ${
  (props) => (props.halfHeight ? '50%;' : 'calc(100% + 5px);')
}
  margin-top: 0px;
  -moz-transition: all .2s linear;
  -webkit-transition: all .2s linear;
  transition: all .2s linear;
  width: 0;
  border-right: 1px dashed #034163;
`;

export const TableCellDetail = styled.div`
  width: 100%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  row-gap: ${
  (props) => (props.lecture ? '14px;' : '7px;')
}
  padding: ${
  (props) => (props.smallPadding ? '7px 0;' : '11px 0;')
}
`;

export const PrereqLabel = styled.div`
  font-weight: bold;
  font-size: 13px;
  color: #034263;
`;

// TODO: how to use styled component on icons
// how to use two classes => class1.class2 in styled components

export const NavigationIcon = styled(ChevronRight)`
  color: #BEBEBE;
  width: 20px;
  height: 20px;
`;

export const ExpandIcon = styled(CaretLeftFill)`
  color: #BEBEBE;
  width: 18px;
  height: 18px;
  -moz-transition: all .2s linear !important;
  -webkit-transition: all .2s linear !important;
  transition: all .2s linear !important;
  fill: #034263;
  align-self: end !important;
  transform: ${
  (props) => (props.rotate ? 'rotate(-90deg);' : 'none;')
}
`;

export const CellHeader = styled.div`
  width: 100%;
  color: #034263;
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

export const InstructorName = styled.div`
  font-size: 14px;
`;

export const Selection = styled.div`
  width: 50px;
  height: 14px;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 1px solid ${rgba('#034263', 0.6)};
  border-radius: 3px;
  overflow: hidden;
  font-size: 10px;
`;

export const CellSection = styled.div`
  width: 100%;
  display: grid;
  grid-template-columns: 0.4fr 0.54fr 0.88fr 0.75fr;
  letter-spacing: -0.02em;
  column-gap: 8px;
  align-items: start;
  justify-items: center;
  font-size: 11px;

  &>div {
    &:first-child {
      justify-self: start;
    }
    &:last-child {
      justify-self: start;
    }
  }
`;

export const DayOfWeek = styled.span`
  color: ${(props) => (props.active ? '#034263;' : '#BABABA;')}
  margin-right: 2px;
`;

export const TableCellDotContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
${
  (props) => (props.reverse ? `
    justify-content: flex-start;
    margin-bottom: 8px;
  ` : `
    justify-content: flex-end;
    margin-top: 8px;
  `)
}
  height: 100%;
  position: relative;
`;
