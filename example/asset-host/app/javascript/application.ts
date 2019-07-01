import railsLogo from "./rails.svg";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  if (el) {
    const img = document.createElement("img");
    img.src = railsLogo;
    img.width = 130;
    img.height = 46;
    el.appendChild(img);
  }
});
