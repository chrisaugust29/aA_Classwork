import React from "react";
import ReactDOM from "react-dom";

import MainScreen from './components/root';

document.addEventListener("DOMContentLoaded", () => {

  const root = document.getElementById("root");
  ReactDOM.render(<MainScreen />, root);
})