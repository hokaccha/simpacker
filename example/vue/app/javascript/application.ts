import Hello from "./Hello.vue";
import Vue from "vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    template: `<hello name="Rails"></hello>`,
    components: { Hello }
  });
});
