#!/usr/bin/node

const readline = require('readline');

var r1 = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

var input;
r1.on('line', function(line) {
    input = line.split(',').map(Number);
})

function getFishPopulation(startingFishes, steps) {
    var fishAges = [...startingFishes];
    for (var i = 0; i < steps; ++i) {
        var rdyFish = fishAges.shift();
        fishAges[6] += rdyFish;
        fishAges.push(rdyFish);
    }
    return fishAges.reduce((a, b) => a + b);
}

r1.on('close', function() {
    var fishAges = Array(9).fill(0);
    input.forEach(elem => ++fishAges[elem]);

    console.log("Part 1:", getFishPopulation(fishAges, 80));
    console.log("Part 2:", getFishPopulation(fishAges, 256));
});
