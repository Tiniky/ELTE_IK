const table  = document.querySelector("table")
const size   = document.querySelector("input")
const start  = document.querySelector("#start")
const extend = document.querySelector("#extend")
const cont   = document.querySelector("#controls")
let n = 0

function delegal(szulo, gyerek, mikor, mit){
    szulo.addEventListener(mikor, function(esemeny){
        const esemenyCelja = esemeny.target
        const esemenyKezeloje = this;
        const legkozelebbiKeresettElem = esemenyCelja.closest(gyerek)
        if(esemenyKezeloje.contains(legkozelebbiKeresettElem)) mit.call(legkozelebbiKeresettElem, esemeny)
    })
}

function handleStartClick(){
    cont.style.display = "none"
    extend.style.display = "inline"
    n = size.valueAsNumber
    for (let i = 0; i <= n; i++){
        let tr = document.createElement("tr")
        for (let j = 0; j <= n; j++){
            let td = document.createElement("td")
            if (i == 0 && j > 0) td.innerText = String.fromCharCode(65 + j - 1)     //az oszlopok fölötti betűk
            else if (j == 0 && i > 0) td.innerText = i      //a sorok előtti számok
            else if (j != 0 && i != 0){     //ha nem legfelső és nem balszélső
                td.classList.add("border")
                td.style.backgroundColor = "white"
            }
            tr.appendChild(td)
        }
        table.appendChild(tr)
    }
}

start.addEventListener("click", handleStartClick)

function handleTdClick(){
    if (this.classList.contains("border"))
        this.style.backgroundColor = this.style.backgroundColor == "white" ? "black" : "white"
}

delegal(table, "td", "click", handleTdClick)

function handleExtendClick(){
    table.querySelectorAll("tr").forEach(function(tr, i){
        let black = Array.from(tr.querySelectorAll("td")).filter(td => td.style.backgroundColor == "black").length      //megszámolja egy sorban hány fekete van
        let td = document.createElement("td")
        if (i == 0){
            td.innerText = String.fromCharCode(65 + n)
        } else {
            td.style.backgroundColor = black % 2 == 0 ? "white" : "black"
            td.classList.add("border")
        }
        tr.appendChild(td)
    })
    n++     //nő a mátrix mérete ugye
}

extend.addEventListener("click", handleExtendClick)
