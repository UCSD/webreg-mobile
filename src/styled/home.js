import { UnfoldMore } from '@styled-icons/material';
import { COLOR_PRIMARY } from './theme';

const {
  default: styled,
} = require('styled-components');

export const SearchTab = styled.div`
  background-color: #F1F1F1;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  margin-right: 7px;
  border-radius: 22px;
  border: 1px solid #034263;
  padding: 0 10px 0 24px;
  height: fit-content;
  align-self: center;
  overflow: hidden;
  height: 32px;
`;

export const SearchTabExpanded = styled(SearchTab)`
  display: grid;
  grid-template-columns: auto 1fr auto;
  column-gap: 5px;
`;

export const SearchInput = styled.input`
  width: 100%;
  border: none;
  box-shadow: none;
  outline: none;
  font-size: 16px;
  letter-spacing: 2%;
  background-color: #F1F1F1;
`;

export const TermSelect = styled.div`
  height: 100%;
  padding-left: 8px;
  border-right: 1px solid #7D7D7D;
  display: flex;
  align-items: center;
  justify-content: center;
`;

export const TermText = styled.div`
  font-weight: bold;
  font-size: 14px;
  line-height: 16px;
  color: #7D7D7D;
`;

export const UnfoldIcon = styled(UnfoldMore)`
  width: 16px;
  color: #7D7D7D;
`;

export const AnimatedContainer = styled.div`
  position: absolute;
  top: 0;
  right: 0;
  color: white;
  -webkit-transition: width .5s;
  -moz-transition: width .5s;
  transition: width .5s;
  height: 48px;
  width: ${(props) => (props.expand ? '100%' : '0')};
  // opacity: ${(props) => (props.expand ? 1 : 0)};
  overflow: hidden;
`;

export const AnimatedHeaderContainer = styled.div`
  background-color: ${COLOR_PRIMARY};
  display: grid;
  grid-template-columns: 50px 1fr 50px;
  height: 48px;
`;

export const SearchContainer = styled.div`
  background-color: white;
  width: 100vw;
  height: calc(100vh - 48px);
  // height: 100vh;
  z-index: 10;
  position: absolute;
  top: 48px;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;

  font-size: 18px;
  line-height: 21px;
  text-align: center;
`;
