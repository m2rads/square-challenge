import React from "react";
import ReactDOM from "react-dom";
import App from "./components/App";

document.addEventListener("DOMContentLoaded", function () {
  const node = document.getElementById("book_question");
  if (!node) {
    console.error('Element with ID "book_question" not found');
    return;
  }
  const data = JSON.parse(node.getAttribute("data"));

  ReactDOM.render(<App data={data} />, document.getElementById("root"));
});
