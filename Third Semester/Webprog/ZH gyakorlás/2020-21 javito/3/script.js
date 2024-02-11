const canvas  = document.querySelector("canvas")
const ctx     = canvas.getContext("2d")
const plus    = document.querySelector("#plus")
const minus   = document.querySelector("#minus")
const next    = document.querySelector("#next")
const sim     = document.querySelector("#sim")

let days  = Array.from({length: 7}, () => 50 + Math.floor(Math.random() * 300))     //random szám 50-350 között
console.log(days.join(' '))

let bg = new Image()
bg.src = "bg.png"
bg.onload = draw

function draw(){
    ctx.drawImage(bg, 0, 0)
    for (let i = 0; i < 7; i++){
        ctx.beginPath()
        ctx.moveTo(100 * i + 100, canvas.height - days[i])
        ctx.lineTo(100 * (i+1) + 100, canvas.height - days[i+1])
        ctx.strokeStyle = i < 6 ? "blue" : "red"
        ctx.lineWidth = 3
        ctx.stroke()
    }
}

days[7] = days[6]

plus.addEventListener("click", ()=>{
    days[7] += 10
    draw()
})

minus.addEventListener("click", ()=>{
    days[7] -= 10
    draw()
})

next.addEventListener("click", ()=>{
    days.shift()    //eltolódik
    days[7] = days[6]
    draw()
})

sim.addEventListener("click", ()=>{
    setInterval(()=>{       //animáció
        days.shift()
        days[7] = 0.5 * days[6]
        draw()
    }, 500)
})
