let body = document.querySelector('body')

const raktar = [
    {
        weapon: 'Mosin',
        type: 'Sniper rifle',
        durability: 92
    },
    {
        weapon: 'Vepr KM/VPO-136',
        type: 'Assault Rifle',
        durability: 69
    },
    {
        weapon: 'AKM',
        type: 'Assault Rifle',
        durability: 98
    },
    {
        weapon: 'M4A1',
        type: 'Assault Rifle',
        durability: 100
    },
    {
        weapon: 'SKS',
        type: 'Assault carbine',
        durability: 55
    },
    {
        weapon: 'Kel-Tec RFB',
        type: 'Assault carbine',
        durability: 100
    },
    {
        weapon: 'SV-98',
        type: 'Sniper rifle',
        durability: 87
    }
]

let table = document.createElement('table')

let htr = document.createElement('tr')
htr.innerHTML = 'Fegyverek'

table.appendChild(htr)

raktar.forEach(elem => {
    let tr = document.createElement('tr')
    tr.innerHTML = `<ul>${elem.weapon}</ul>`
    tr.style.color = elem.durability >= 70 ? 'green' : 'red'
    if(elem.type == "Assault carbine") tr.style.fontStyle = 'italic'
    if(elem.type == "Sniper rifle") tr.style.fontWeight = 'bold'
    table.appendChild(tr)
})

body.appendChild(table)