const levelSelect = document.querySelector('#levels')
const table = document.querySelector('#table-container')
const easy = document.querySelector('#easy')
const medium = document.querySelector('#medium')
const hard = document.querySelector('#hard')

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

easy.addEventListener('click', generateMatrix(7))
medium.addEventListener('click', generateMatrix(7))
hard.addEventListener('click', generateMatrix(10))

function generateMatrix(size) {
    matrix = generateMap(size)
    console.log(matrix)
  }

function generateMap(size){
    const matrixd = []
    for(let i = 0; i<size; i++) {
        const row = []
        for(let j = 0; j<size; j++) {
          row.push("")
        }
        matrixd.push(row)
    }
   return matrixd
}

function action(size){
    table.innerHTML = ''
    let tbl = document.createElement('table')
    for(let i = 0; i<size; i++){
        let tr = document.createElement('tr')
        for(let j=0; j<size; j++){
            let td = document.createElement('td')
            td.innerText = matrix[i][j]
            tr.appendChild(td)
        }
        tbl.appendChild(tr)
    }
  table.appendChild(tbl)
  delegal(tbl, 'td', 'click', enlighten)
}

easy.addEventListener('click', action(7))
medium.addEventListener('click', action(7))
hard.addEventListener('click', action(10))

function enlighten(event){
    event.target.innerText = "x"
}