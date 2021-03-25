import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store"

import { receiveTodo } from './actions/todo_actions';
import { receiveTodos } from './actions/todo_actions';
import { removeTodo } from './actions/todo_actions';

import { receiveStep } from './actions/step_actions';
import { receiveSteps } from './actions/step_actions';
import { removeStep } from './actions/step_actions';

const Root = () => {
    return(
        <div>
            <h1>Todos App</h1>
        </div>
    )
}

document.addEventListener("DOMContentLoaded", () => { 
    const root = document.getElementById("root");
    ReactDOM.render(<Root/>, root)    

    const store = configureStore();
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.removeTodo = removeTodo;
    window.receiveStep = receiveStep;
    window.receiveSteps = receiveSteps;
    window.removeStep = removeStep;
});

