import React from 'react';
import ReactDom from 'react-dom';
import Clock from './clock';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const hello = <h1>Hello World, from React</h1>

    ReactDom.render(<Clock/> , root);
})