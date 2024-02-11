const task1 = document.querySelector('#task1');
const task2 = document.querySelector('#task2');
const task3 = document.querySelector('#task3');
const task4 = document.querySelector('#task4');

const game = [
  "XXOO",
  "O OX",
  "OOO ",
];

function tasks(){
  let firstRowsLength = game[0].length

  task1.innerHTML = game.every(e => e.length === firstRowsLength) ? 'true' : 'false'
  task2.innerHTML = game[0].split('').every(e => e === "X" || e === "O") ? 'true' : 'false'
  
  let letXdb = game.map(e => e.split('').filter(elem => elem === "X").length).reduce((a, b) => a + b, 0)
  let letOdb = game.map(e => e.split('').filter(elem => elem === "O").length).reduce((a, b) => a + b, 0)
  task3.innerHTML = 'X / O = ' + letXdb + ' / ' + letOdb

  let haromO = "OOO"
  let haromX = "XXX"

  for(let i in game){
    if(game[i].includes(haromX)){
      task4.innerHTML = i
    }
  }

  for(let i in game){
    if(game[i].includes(haromO)){
      task4.innerHTML = i
    }
  }
}

tasks()