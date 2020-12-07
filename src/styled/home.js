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
  box-sizing: border-box;
  padding: 3px 10px 3px 28px;
  -webkit-transition: all .5s;
  -moz-transition: all .5s;
  width: ${(props) => (props.expand ? '100%' : '63px')};
  transition: width .5s ease-in-out;
`;
