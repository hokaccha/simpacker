import { hello } from "./greeter";
import "./application.css";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  el.textContent = hello("Rails");
});
