import { hello } from "./greeter";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  if (el) {
    el.textContent += hello("Calendar!");
  }
});
