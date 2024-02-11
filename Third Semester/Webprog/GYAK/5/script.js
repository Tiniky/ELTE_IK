const canvas = document.querySelector('canvas')
const ctx = canvas.getContext('2d')
const color = querySelector('#color')

/*
ctx.fillStyle = 'black'
ctx.fillRect(0, 0, 25, 25)
ctx.fillStyle = 'red'
ctx.strokeRect(0, 800, 25, -25)

ctx.translate(400, 400)
ctx.fillRect(0, 0, 50, 50)

const myImage = new Image()
myImage.src = kep.png

ctx.drawImage(myImage, -400, -400)

ctx.beginPath()
ctx.fillStyle = rgba(0,0,0,0.5)
ctx.moveTo(25, -25)
ctx.lineTo(25, -75)
ctx.lineTo(25, -50)
ctx.lineTo(50, -50)
ctx.lineTo(50, -25)
ctx.lineTo(50, -75)

ctx.moveTo(75, -25)
ctx.lineTo(50, -75)
ctx.closePath()
*/

function mousePos(canvas, event){
    let rect = canvas.getBoundingClientRect()
    return {
        x: event.clientX - rect.left,
        y: event.clientY - rect.right
    }
}

function draw(eve){
    let p = mousePos(canvas, eve)

    ctx.fillRect(p.x, p.y, 4, 4)
}

//canvas.addEventListener('mousemove', draw)

canvas.addEventListener('mousedown', ()=>{
    canvas.addEventListener('mousemove', draw)
})

canvas.addEventListener('mouseup', ()=>{
    canvas.removeEventListener('mousemove', draw)
})

color.addEventListener('input', (evt)=>{
    ctx.fillStyle = color.value
})

ctx.beginPath()
ctx.strokeStyle = 'black'
ctx.moveTo(0, 400)
ctx.lineTo(800, 400)
ctx.moveTo(400, 0)
ctx.lineTo(400, 800)
ctx.stroke()
ctx.closePath()

ctx.font = '28px sans'
ctx.fillText('X', 375, 35)

ctx.font = '28px sans'
ctx.fillText('Y', 35, 375)

for(let x = 0; x < 800; x++){
    let y = Math.sin(x/12)*12 + 400

    ctx.fillRect(x, y, 2, 2)
}