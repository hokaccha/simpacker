import { hello } from "./greeter";
import "./application.scss";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  el.textContent = hello("Rails");
});
