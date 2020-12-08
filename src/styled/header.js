import { COLOR_PRIMARY } from './theme';

const {
  default: styled,
} = require('styled-components');

export const HeaderContainer = styled.div`
  background-color: ${COLOR_PRIMARY};
  display: grid;
  height: 48px;
  grid-template-columns: repeat(3, 1fr);
  color: white;
  width: 100%;
  -webkit-transition: all .3s;
  -moz-transition: all .3s;
  transition: all .3s;
  opacity: ${(props) => (props.expand ? 0 : 1)};
  z-index: ${(props) => (props.expand ? -1 : 0)};
`;

export const Left = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-start;
`;

export const Right = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-end;
`;

export const Center = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 400;
  font-size: 24px;
`;
