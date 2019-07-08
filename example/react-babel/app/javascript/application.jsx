import React from "react";
import ReactDOM from "react-dom";
import { Hello } from "./greeter";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Hello name="Rails" />, document.getElementById("app"));
});
