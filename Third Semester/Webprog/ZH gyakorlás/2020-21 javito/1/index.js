const txtNumbers = document.querySelector('#numbers')
const task1 = document.querySelector('#task1')
const task2 = document.querySelector('#task2')
const task3 = document.querySelector('#task3')
const task4 = document.querySelector('#task4')
const task5 = document.querySelector('#task5')

let x = []    //inicializálni kell!!

function tasks() {
  task1.innerHTML = x.filter(e => e % 3 === 0).length   //kiszedi 3-al oszhatókat
  task2.innerHTML = x.find(e => e < 0) || 'No negative number'    //megkeresi, hogy van-e negatív
  task3.innerHTML = x.every(e => e % 2 !== 0) ? 'All odds' : 'Evens also'   //megnézi, hogy minden szám páratlan-e
  task4.innerHTML = x.reduce((max, e) => e > max ? e : max, Number.NEGATIVE_INFINITY)   //kiszedi a maximum elemet
  task5.innerHTML = x.filter((e, i, x) => x.slice(0, i).every(prev => prev !== e)).join(',')  //ha van egyforma csak egyszer írja le
}

txtNumbers.addEventListener('input', onInput)
function onInput() {
  x = this.value.split(',')
  console.log(x)

  const good = x.every(e => !isNaN(e))    //isNan true lesz ha nem szám
  
  this.classList.toggle('error', !good)   //ha !hamis aka !!igaz aka szöveg

  if (good) {
    x = x.filter(e => e.trim() !== '').map(e => parseFloat(e))    //ha a letrimlet alak nem üres akkor alakítsa őket számmá
    console.log(x)

    tasks()
  }
}