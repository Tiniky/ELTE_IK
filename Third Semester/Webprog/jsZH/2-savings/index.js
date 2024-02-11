const form = document.querySelector("form");
const divContainer = document.querySelector(".container");

const datas = document.querySelectorAll("[data-consumption]")
const labels = document.querySelectorAll("label")

let M = 0
let fogyasztas = []
function osszfogyasztas(){
    for(const item of datas){
        M += parseInt(item.dataset.consumption)
        fogyasztas.push(item.dataset.consumption)
    }
    
    console.log("M = " + M)
    console.log(fogyasztas)

    for(const item2 of datas){
        for(const label of labels){
            if(label.htmlFor === item2.id){
                label.style.width = `${parseInt(item2.dataset.consumption) / M * 100}%`
            }
        }
    }
}

osszfogyasztas()

form.addEventListener('input', ()=>{
    fogyasztas = []
    for(const item of datas){
        let ci = item.valueAsNumber / parseFloat(item.max) * parseFloat(item.dataset.consumption)
        fogyasztas.push(ci)

        for(const label of labels){
            if(label.htmlFor === item.id){
                label.style.width = `${ci / M * 100}%`
            }
        }
    }
    console.log(fogyasztas)
})