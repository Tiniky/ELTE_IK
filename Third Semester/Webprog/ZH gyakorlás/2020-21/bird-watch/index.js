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

button.addEventListener('click', ()=>{
  const n = placesInput.valueAsNumber
  const m = speciesInput.valueAsNumber

  matrix = generateMatrix(n, m)
  console.log(matrix);

  tableContainer.innerHTML = ''
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
  
  delegal(table, 'td', 'click', onTableClick)

  tasks()
})

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

function onTableClick(e) {
  if (e.target.matches('td')) {
    const {x, y} = xyCoord(e.target)
    matrix[y][x]++
    e.target.innerText = matrix[y][x]
    
    console.log(x, y)

    tasks()
  }
}

function xyCoord(td) {
  const tr = td.parentNode
  return {
    x: td.cellIndex,
    y: tr.sectionRowIndex
  }
}

function tasks() {
  task1.innerHTML = matrix[0].some(e => e>0) ? 'Yes' : 'No'
  task2.innerHTML = matrix.filter(row => row.some(e => e > 10)).length
  let t3 = matrix.findIndex(row => row.every(e => e === 0)) + 1
  task3.innerHTML = t3 === 0 ? "No" : t3
}
