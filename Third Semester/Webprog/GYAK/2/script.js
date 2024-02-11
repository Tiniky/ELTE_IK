let body = document.querySelector('body')

body.innerText = 'valami'
body.innerHTML = '<ul><li>Szöveg szerű valami</li></ul>'

let p1 = document.createElement('p')
p1.innerHTML = 'Narancssárga'

body.appendChild(p1)

const header = ['Név', 'Ár', 'Legnagyobb fogyasztó']

const furries = ['Bucsii']

const data = [
    {
        nev : 'Kevert',
        ar : 390,
        lf : 'Norbi'
    },
    {
        nev : 'Száraz Vice',
        ar : 545,
        lf : 'Zusz'
    },
    {
        nev : 'Jager',
        ar : 680,
        lf : 'Kacsa'
    },
    {
        nev : 'Vodkanarancs',
        ar : 780,
        lf : 'Bucsii'
    }
]

let table = document.createElement('table')

let htr = document.createElement('tr')

for(let h of header){
    let th = document.createElement('th')
    th.innerHTML = h
    htr.appendChild(th)
}

table.appendChild(htr)

data.forEach(elem => {
    let tr = document.createElement('tr')
    tr.innerHTML = `<td>${elem.nev}</td><td>${elem.ar}</td><td>${elem.lf}</td>`
    //if(elem.ar > 600) tr.style.backgroundColor = 'red'
    tr.style.backgroundColor = elem.ar > 600 ? 'red' : ''
    tr.style.fontStyle = furries.includes(elem.lf) ? 'italic' : ''
    table.appendChild(tr)
})

let input = document.createElement('input')
let button = document.createElement('button')
let p = document.createElement('p')

p.innerHTML = 0
button.innerHTML = 'Felüt'
button.addEventListener('click', (event)=>{
    console.log(event)
    console.log(button)
    console.log(document.querySelector('tr'))
    if(isNaN(input.value)) p.innerHTML = parseInt(p.innerHTML) += parseInt(input.value)
    input.value = ''
    console.log(p)
})

body.appendChild(table)
body.appendChild(input)
body.appendChild(button)
body.appendChild(p)

