const placesInput = document.querySelector('#places')
const speciesInput = document.querySelector('#species')
const button = document.querySelector('#btn-generate')
const tableContainer = document.querySelector('#table-container')
const task1 = document.querySelector('#task-1')
const task2 = document.querySelector('#task-2')
const task3 = document.querySelector('#task-3')
const task4 = document.querySelector('#task-4')
const task5 = document.querySelector('#task-5')

let matrix = []

function delegal(szulo, gyerek, mikor, mit){
  function esemenyKezelo(esemeny){
      let esemenyCelja = esemeny.target;
      let esemenyKezeloje = this;
      let legkozelebbiKeresettElem = esemenyCelja.closest(gyerek);

      if(esemenyKezeloje.contains(legkozelebbiKeresettElem)){
          mit(esemeny, legkozelebbiKeresettElem);
      }
  }
  szulo.addEventListener(mikor, esemenyKezelo);
}

button.addEventListener('click', onGenerate)
function onGenerate(e) {
  const n = placesInput.valueAsNumber
  const m = speciesInput.valueAsNumber

  matrix = generateMatrix(n, m)
  console.log(matrix);
}

function generateMatrix(n, m) {
  const matrix = []
  for(let i = 0; i<n; i++) {
    const row = []
    for(let j = 0; j<m; j++) {
      row.push(0)
    }
    matrix.push(row)
  }
  return matrix
}

function t1(){
  tableContainer.innerHTML = ''
  const n = placesInput.valueAsNumber
  const m = speciesInput.valueAsNumber
  let table = document.createElement('table')
  for(let i = 0; i<n; i++){
    let tr = document.createElement('tr')
    for(let j=0; j<m; j++){
      let td = document.createElement('td')
      td.innerText = matrix[i][j]
      tr.appendChild(td)
    }
    table.appendChild(tr)
  }
  tableContainer.appendChild(table)

  delegal(table,'td', 'click', t2)

  t3()
  t4()
  t5()
}

button.addEventListener('click', t1)

function t2(event){
  let x = event.target.parentNode.rowIndex
  let y = event.target.cellIndex
  console.log(x,y)
  matrix[x][y]++
  event.target.innerText = matrix[x][y]

  t3()
  t4()
  t5()
}

function t3(){
  task1.innerText = matrix[0].some(e => e > 0) ? "Yes" : "No"
}

function t4(){
  let db = 0
  for(let row in matrix){
    for(let elem in matrix[row]){
      if(matrix[row][elem] >= 10){
        db++
      }
    }
  }

  task2.innerText = db
}

function t5(){
  let index = "No"
  for(let row in matrix){
    if(matrix[row].every(elem => elem == 0)){
      index = row
      break
    }
  }
  task3.innerText = index
}