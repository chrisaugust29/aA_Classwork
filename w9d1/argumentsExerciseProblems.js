function sum(){
  let result = 0
  for (let i = 0; i < arguments.length; i++){
    result += arguments[i]

  }
  return result;
}

// console.log(sum(3, 4, 5))


//with args


Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};


//curriedSum

// sum(5)

  // const numbers = [5]
  // function _curriedSum(num){
  //   numbers.push(num)
  //   if (numbers.length === numArgs){
      
  //   }
  // }


function curriedSum(numArgs){
  const numbers = []
  return function _curriedSum(num){
    numbers.push(num)
    if (numbers.length === numArgs){
      return numbers.reduce((a, b) => a + b, 0)
    } else {
      return _curriedSum
    }
  }
}


// const sum = curriedSum(4);

// console.log(sum)
// console.log(sum(5)(30)(20)(1)); // => 56


Function.prototype.curry = function(numArgs){
  let func = this
  const args = []
  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
     return func.apply(null, args)
    } else {
      return _curry
    } 
  }
  return _curry
}



sum.curry(2)(1)(2) 


Function.prototype.curry = function (numArgs) {
  let func = this
  const args = []
  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return func(...args)
    } else {
      return _curry
    }
  }
  return _curry
}
console.log(sum.curry(2)(3)(4))