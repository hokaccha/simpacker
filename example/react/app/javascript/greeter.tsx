import React, { FC } from "react";
import styled from "styled-components";

interface Props {
  name: string;
}

const Message = styled.div`
  color: tomato;
`;

export const Hello: FC<Props> = ({ name }) => {
  return <Message>Hello {name}!</Message>;
};
