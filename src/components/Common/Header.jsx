import React from 'react';
import {
  HeaderContainer,
  Left,
  Right,
  Center,
} from '../../styled';

const Header = ({
  left, center, right, expand = true,
}) => (
  <HeaderContainer expand={expand}>
    <Left>{left}</Left>
    <Center>{center}</Center>
    <Right>{right}</Right>
  </HeaderContainer>
);

export default Header;
