const toDo = JSON.parse(localStorage).getItem("item") || [];

const toDoList = document.querySelector(".todos")
const form = document.querySelector(".add-todo-form")

const addToDo = (e) => {
    e.preventDefault(); 
    const input = document.querySelector("input[name = 'add-todo']")
    const value = input.value
    const object = {
        value: value, done: false 
    } 
    toDo.push(object);