import $ from "jquery";
import { hello } from "../src/greeter";

$(() => {
  $("#app").text(hello("Posts"));
});
