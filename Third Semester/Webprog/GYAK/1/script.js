let a = 420
let b = "fa"
let c = [1,2,3,4,"alma","körte"]

console.log(a,b)
console.log(c)

let fak = ["alma", "körte", "barack", "szilva"]

for(let i = 0; i<fak.length; i = i+1){
    console.log(fak[i] + "fa")
}

for(let i = 0; i<fak.length; i = i+1) console.log(fak[i] + b)

for(let elem of fak) console.log(elem + b)

let obj = {
    "key" : "value",
    "key2" : a,
    "key3" : c
}

console.log(obj.key)
console.log(obj['key2'])

let pelda = [
    {
        "hallgato" : "Gerely Viktor András",
        "atlag" : 1.23,
        "szuletett" : 1996
    },
    {
        "hallgato" : "Bucsánszki Tamás Mihály",
        "atlag" : 0.2,
        "szuletett" : 1994
    },
    {
        "hallgato" : "Deák Dalma",
        "atlag" : 4.0,
        "szuletett" : 2000
    },
    {
        "hallgato" : "Franta Áron",
        "atlag" : 3.0,
        "szuletett" : 1999
    },
    {
        "hallgato" : "Franta Ákos",
        "atlag" : 0,
        "szuletett" : 2003
    }
]

function legjobbAtlag(tomb){
    let max = tomb[0]
    for(let i = 1; i<tomb.length; i++){
        if(max.atlag < tomb[i].atlag){
            max = tomb[i]
        }
    }
    return max
}

console.log(legjobbAtlag(pelda))

function legjobbAtlag2000Utan(tomb){
    let temp = tomb.filter(elem => elem.szuletett >= 2000)
    console.log(temp)
    let max = temp[0]
    for(let i = 1; i<temp.length; i++){
        if(max.atlag < temp[i].atlag){
            max = temp[i]
        }
    }
    return max
}

console.log(legjobbAtlag2000Utan(pelda))

function tmp(prev, next){
    return prev.atlag > next.atlag ? prev : next
}

function legjobbAtlag2000Utan2(tomb){
    return tomb.filter(elem => elem.szuletett >= 2000).reduce(tmp)
}

console.log(legjobbAtlag2000Utan2(pelda))

function legjobbAtlag2000Utan3(tomb){
    return tomb.filter(elem => elem.szuletett >= 2000).reduce((prev, next) => prev.atlag > next.atlag ? prev : next, {
        "hallgato" : "Németh Tamás Zoltán",
        "atlag" : 3.0,
        "szuletett" : 2000
    })
}

console.log(legjobbAtlag2000Utan3(pelda))

let feladat = [{
    id: 1001,
    nev: 'Lanyesz',
    szuletett: 1997,
    kereset: 2000000
},
{
    id: 1002,
    nev: 'Laurka',
    szuletett: 1995,
    kereset: 223003
},
{
    id: 1212,
    nev: 'Suwu',
    szuletett: 2019,
    kereset: 0
},
{
    id: 69420,
    nev: 'Manyesz',
    szuletett: 2001,
    kereset: 43202
},
{
    id: 191114,
    nev: 'Thoca', 
    szuletett: 2069,
    kereset: 2300000
},
{
    id: 1111,
    nev: 'Mészi',
    szuletett: 1999,
    kereset: 65000
}]

function all2000elottiID(tomb){
    let pici = tomb.filter(elem => elem.szuletett < 2000)
    for(let elem of pici) console.log(elem.id)
}

console.log(all2000elottiID(feladat))

function legnagyobbKereset(tomb){
    let max = tomb[0]
    for(let elem of tomb){
        if(max.kereset < elem.kereset) max = elem
    }
    return max.nev + " " +  max.szuletett
}

console.log(legnagyobbKereset(feladat))

function legkisebbKereset(tomb){
    let tmp = tomb.filter(elem => elem.szuletett >= 2000)
    let min = tomb[0]
    for(let elem of tomb){
        if(min.kereset > elem.kereset) min = elem
    }
    return min.nev + " " +  min.id + " " +  min.kereset
}

console.log(legkisebbKereset(feladat))