// Function.prototype.inherits = function(Parent){
//   function Surrogate(){};
//   Surrogate.prototype = Parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this
// }

Function.prototype.inherits = function(Parent){
  
  this.prototype = Object.create(Parent.prototype)
  this.prototype.constructor = this

}

function MovingObject(name){
  this.name = name
}

MovingObject.prototype.fly = function(){
  console.log("I can fly")
}

let first = new MovingObject

first.fly()

function Plane(){
  this.wingLength = 4

}

Plane.inherits(MovingObject);

let second = new Plane

second.fly();

function Helicopter(){

}

Helicopter.inherits(MovingObject);


third = new Helicopter

console.log(third.wingLength)
console.log(second.wingLength)

