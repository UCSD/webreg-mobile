import { COLOR_PRIMARY } from './theme';

const {
  default: styled,
} = require('styled-components');

export const StatusBarContainer = styled.div`
  width: 100%;
`;

export const StatusBarLabelsContainer = styled.div`
  width: 100%;
  display: flex;
  justify-content: space-between;
`;

export const StatusBarLabel = styled.div`
  font-size: 10px;
  line-height: 11px;
  ${(props) => (`color: ${props.color}`)}
`;

export const BarContainer = styled.div`
  display: flex;
  width: 100%;
`;

export const Bar = styled.div`
  height: 2px;
  border-radius: 1px;
  background-color: ${COLOR_PRIMARY};
`;

export const LeftBar = styled.div`
  height: 2px;
  border-top-left-radius: 1px;
  border-bottom-left-radius: 1px;
  background-color: ${COLOR_PRIMARY};
`;

export const RightBar = styled.div`
  height: 2px;
  border-top-right-radius: 1px;
  border-bottom-right-radius: 1px;
`;
