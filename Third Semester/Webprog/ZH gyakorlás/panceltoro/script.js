
const data = [
    {
        name: 'Slick',
        durability: 80,
        class: 6
    },
    {
        name: '6B2',
        durability: 80,
        class:2 
    },
    {
        name: '6B23-1',
        durability: 80,
        class:3
    },
    {
        name: '6B13',
        durability: 47,
        class:4
    },
    {
        name: 'Trooper TFO',
        durability: 85,
        class:4
    },
    {
        name: '5.11 Hexgrid',
        durability: 50,
        class:6
    }
]

const header = ['Név', 'Állapot', 'Szívosság']

const table = document.querySelector('table')
const shot = document.querySelector('#pew')
const repair = document.querySelector('#repair')

let htr = document.createElement('tr')

function delegal(parent, child, when, what){
    function esemenyKezelo(event){
        let esemenyCelja = event.target
        let esemenyKezeloje = this
        let legkozelebbiKeresettElem = esemenyCelja.closest(child)

        if(esemenyKezeloje.contains(legkozelebbiKeresettElem)){
            what(event, legkozelebbiKeresettElem)
        }
    }
    parent.addEventListener(when, esemenyKezelo)
}

for(let h of header){
    let th = document.createElement('th')
    th.innerHTML = h
    htr.appendChild(th)
}

htr.classList.add('header')
table.appendChild(htr)

data.forEach(elem =>{
    let tr = document.createElement('tr')
    let td1 = document.createElement('td')
    let td2 = document.createElement('td')
    let td3 = document.createElement('td')
    td2.dataset.og = elem.durability
    td2.dataset.class = elem.class
    td2.classList.add('need')
    td1.innerHTML = elem.name
    td2.innerHTML = elem.durability
    td3.innerHTML = elem.class
    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    table.appendChild(tr)
})

function selectArmor(event, elem){
    if(!elem.classList.contains('header')){
        elem.classList.toggle('selected')
    }
}

delegal(table, 'tr', 'click', selectArmor)

shot.addEventListener('click', ()=>{
    table.querySelectorAll('.selected').forEach(e =>{
        let need = e.querySelector('.need')
        let input = parseInt(document.querySelector('#ammo').value)
        if(input > parseInt(need.dataset.class)){
            let num = input - parseInt(need.dataset.class)
            if(parseInt(need.innerHTML) - num <= 0){
                need.innerHTML = 0
            } else {
                need.innerHTML = parseInt(need.innerHTML) - num
            }
        }
    })
})

repair.addEventListener('click', ()=>{
    table.querySelectorAll('.selected').forEach(e =>{
        let need = e.querySelector('.need')
        need.innerHTML = need.dataset.og
    })
})