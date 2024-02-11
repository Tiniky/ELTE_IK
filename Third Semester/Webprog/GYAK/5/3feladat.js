const ctx = document.querySelector('canvas').getContext('2d')

function getRndInteger(min, max){
    return Math.floor(Math.random() * (max - min) ) + min
}

console.log(getRndInteger(-10,10))

let tomb = []

for(let i=0; i<20; i++) tomb.push(getRndInteger(-5,5))

console.log(tomb)

function change(){
    for(let i in tomb){
        tomb[i] += getRndInteger(-1,1)
    }
}

draw()

function draw(){
    ctx.strokeStyle = 'grey'
    ctx.lineWidth = 3
    ctx.beginPath()
    ctx.moveTo(0, 105)
    let x = 0
    tomb.forEach(elem =>{
        x+=10
        ctx.lineTo(x, 105 + elem)
    })
    x+=10
    ctx.lineTo(x, 105 + elem)
    ctx.stroke()
    ctx.closePath()
}

const changeB = document.querySelector('#btn-change')
changeB.addEventListener('click', ()=>{
    ctx.clearRect(0, 0, 210, 210)
    change()
    draw()
})

const animate = document.querySelector('#btn-animation')
animate.addEventListener('click', ()=>{
    setInterval(()=>{
        ctx.clearRect(0, 0, 210, 210)
        change()
        draw()
    }, 24, 56)
})