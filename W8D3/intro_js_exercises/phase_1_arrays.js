// Array#uniq - returns a new array containing each individual element of the 
// original array only once(creating all unique elements)
// the elements should be in the order in which they first appear in the original array
// should not mutate the original array
//     ([1, 2, 2, 3, 3, 3].uniq() => [1, 2, 3])

Array.prototype.uniq = function() {
    let result = [];
    
    for (i = 0; i < this.length; i++) {
        if (!result.includes(this[i])) {
            result.push(this[i]);
        }
    }
    return result;
};

// console.log(([1, 2, 2, 3, 3, 3].uniq()))

// ------RUBY VERSION---------
// def uniq(arr)
//     result = []
//     arr.each do |num|
//         result << num if !result.include?(num)
//     end
//     result
// end

// ==================================================================

// Array#twoSum - returns an array of position pairs where the elements sum to zero

Array.prototype.twoSum = function() {
    let result = [];
    for (let i1 = 0; i1 < this.length; i1++) {
        for (let i2 = 1; i2 < this.length; i2++) {
            if ((this[i1] + this[i2] === 0) && (i2 > i1)) {
                result.push([i1, i2]);
            }
        }
    }
    return result;
};

// ------RUBY VERSION-----------
// def two_sum(arr)
// result = []
// arr.each_with_index do |num1, i1|
//     arr.each_with_index do |num2, i2|
//         if i2 > i1 && num1 + num2 == 0
//             result << (i1, i2)
//         end
//     end
//     result
// end

// ==================================================

// Array#transpose - where we have a two - dimensional array representing a 
// matrix.returns the transpose
// should not mutate the original array

Array.prototype.transpose = function() {
    let transposed = [];

    for (i1 = 0; i1 < this.length; i1++) { 
        let row = [];
        for (i2 = 0; i2 < this.length; i2++) {
            row.push(this[i2][i1]);
        }
        transposed.push(row);
    }
    return transposed;
};

// --------RUBY VERSION---------
// def my_transpose
//     transposed = []

//     self.each_with_index do | ele1, idx1 |
//         row = []

//         self.each_with_index do | ele2, idx2 |
//             row << self[idx2][idx1]
//         end

//         transposed << row
//     end

//     transposed
// end

// ===============================================================

// Array#myEach(callback) - receives a callback function and executes the 
// callback for each element in the array
// Note that JavaScript's forEach function has no return value (returns undefined)

Array.prototype.myEach = function(callback) {
    for (i = 0; i < self.length; i++) {
        callback(this[i]);
    }
};

// ==============================================

// Array#myMap(callback) - receives a callback function, returns a new array of 
// the results of calling the callback function on each element of the array
// should use myEach and a closure

Array.prototype.myMap = function(callback) {
    let result = [];
    this.myEach(element => result.push(callback(element)))
    return result;
};

// =================================================== 

// Array#myReduce(callback[, initialValue]) - 
// (like Ruby's Array#inject) receives a callback function, and optional initial 
// value, returns an accumulator by applying the callback function to each element 
// and the result of the last invocation of the callback (or initial value if supplied)

// initialValue is optional and should default to the first element of the 
// array if not provided
// should also use myEach

Array.prototype.myReduce = function(callback, accumulator) {
    let result = this; 
    //  this = [1,2,3]
    if (accumulator === undefined) {
        accumulator = result[0];
        result = result.slice(1);
    }
    // [1, 2 ,3 ]
     result.myEach(ele => { 
        accumulator = callback(accumulator,ele);
     } )
     return accumulator;

};

// console.log([1, 2, 3].myReduce(function (acc, el) {return acc + el;});)

// def my_inject(accumulator = nil. &prc)
    //     arr = self 

    //     if accumulator.nil?
    //     accumulator = self.first 
    //     arr = self.drop(1)
    // end

    // arr.each do |el|
    //     accumulator = prc.call(accumulator, el)
    // end 

    // accumulator
    // end




