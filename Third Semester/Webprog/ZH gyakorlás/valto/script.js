const data = [
    {
        username: "Yumeko",
        dollars: 10000,
        euros: 4000
    },
    {
        username: "meemboi",
        dollars: 4000,
        euros: 2172
    },
    {
        username: "boionbike",
        dollars: 3401,
        euros: 1200
    },
    {
        username: "Zeusz77",
        dollars: 3456,
        euros: 2034
    },
    {
        username: "PotatoMaster",
        dollars: 0,
        euros: 0
    },
    {
        username: "Gremory",
        dollars: 500,
        euros: 467
    }
]

const table = document.querySelector('table')
const dte = document.querySelector('#dte')
const etd = document.querySelector('#etd')

let header = ['Name', 'Dollars', 'Euros']

function delegal(parent, child, when, what){
    function esemenyKezelo(esemeny){
        let esemenyCelja = esemeny.target;
        let esemenyKezeloje = this;
        let legkozelebbiKeresettElem = esemenyCelja.closest(child)

        if(esemenyKezeloje.contains(legkozelebbiKeresettElem)){
            what(esemeny, legkozelebbiKeresettElem)
        }
    }
    parent.addEventListener(when, esemenyKezelo)
}

let htr = document.createElement('tr')

for(let h of header){
    let th = document.createElement('td')
    th.innerHTML = h
    htr.appendChild(th)
}

htr.classList.add('header')
table.appendChild(htr)

data.forEach(e =>{
    let tr = document.createElement('tr')
    let td1 = document.createElement('td')
    let td2 = document.createElement('td')
    let td3 = document.createElement('td')
    td1.innerHTML = e.username
    td2.innerHTML = e.dollars + " $"
    td2.classList.add('usd')
    td3.innerHTML = e.euros + " €"
    td3.classList.add('eur')
    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    table.appendChild(tr)
})

function selectUser(event, elem){
    if(!elem.classList.contains('header')){
        elem.classList.toggle('selected')
    }
}

delegal(table, 'tr', 'click', selectUser)

function changeToDollar(euro){
    return euro * 1.16
}

function changeToEuro(dollar){
    return dollar * 0.86
}

dte.addEventListener('click', ()=>{
    table.querySelectorAll('.selected').forEach(e=>{
        let input = parseFloat(document.querySelector('#in').value)
        let usd = e.querySelector('.usd')
        let eur = e.querySelector('.eur')
        if(parseFloat(usd.innerHTML) >= input){
            usd.innerHTML = parseFloat(usd.innerHTML) - input
            eur.innerHTML = parseFloat(eur.innerHTML) + changeToEuro(input) * 0.95
        }
    })
})

etd.addEventListener('click', ()=>{
    table.querySelectorAll('.selected').forEach(e=>{
        let input = parseFloat(document.querySelector('#in').value)
        let usd = e.querySelector('.usd')
        let eur = e.querySelector('.eur')
        if(parseFloat(eur.innerHTML) >= input){
            eur.innerHTML = parseFloat(eur.innerHTML) - input
            usd.innerHTML = parseFloat(usd.innerHTML) + changeToDollar(input) * 0.95
        }
    })
})