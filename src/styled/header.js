import { COLOR_PRIMARY } from './theme';

const {
  default: styled,
} = require('styled-components');

export const HeaderContainer = styled.div`
  background-color: ${COLOR_PRIMARY};
  display: grid;
  height: 48px;
  grid-template-columns: ${((props) => (props.expand ? '50px 1fr 50px' : 'repeat(3, 1fr)'))};
  color: white;
  -webkit-transition: all .5s;
  -moz-transition: all .5s;
  transition: all .5s;
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
