import { hello } from "./greeter";
import "./application.scss";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  if (el) {
    el.textContent = hello("Rails");
  }
});
