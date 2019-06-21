import React, { FC } from "react";

interface Props {
  name: string;
}

export const Hello: FC<Props> = ({ name }) => {
  return <div>Hello {name}!</div>;
};
