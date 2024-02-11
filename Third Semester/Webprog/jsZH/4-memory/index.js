const inputCircleNumber = document.querySelector("#circle-number");
const buttonStart = document.querySelector("#start");
const divContainer = document.querySelector("#container");
const divOutput = document.querySelector("#output");

const circiles = document.querySelectorAll(".circle")
// Application state

let canGuess = false;
let solution = [];
let series = [];

// ========= Utility functions =========

function random(a, b) {
  return Math.floor(Math.random() * (b - a + 1)) + a;
}

function toggleHighlight(node) {
  node.classList.toggle("highlight")
  node.addEventListener("animationend", function (e) {
    node.classList.remove("highlight");
  }, {once: true});
}

// =====================================
function alaphelyzet(){
  let n = 1
  for(const elem of circiles){
    elem.innerText = n
    n++
  }
}

alaphelyzet()

inputCircleNumber.addEventListener('input', ()=>{
  if(!started){
    divContainer.innerHTML = ""
    let n = 1
    for(let i = 0; i<inputCircleNumber.valueAsNumber; i++){
      let a = document.createElement('a')
      a.classList.add("circle")
      a.innerText = n
      n++
      divContainer.appendChild(a)
    }
  }
})

let started = false
buttonStart.addEventListener('click',()=>{
  started = true

  series = (new Array(7)).fill(0).map(_ => random(1, inputCircleNumber.valueAsNumber+1))
  console.log(series)
})