const canvas = document.querySelector('canvas.audio')
const ctx = canvas.getContext('2d')
const btnChange = document.querySelector('#btn-change')
const btnAnimation = document.querySelector('#btn-animation')

function random(a, b) {
  return Math.floor(Math.random() * (b-a+1)) + a
}

console.log(random(-10,20))

const h = (new Array(20)).fill(0).map(_ => random(-5, 5))
console.log(h)

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height)

  ctx.strokeStyle = 'gray'
  ctx.lineWidth = 3

  ctx.beginPath()
  ctx.moveTo(0, canvas.height / 2)
  for (let i = 0; i < h.length; i++) {
    ctx.lineTo((i+1) * 10, canvas.height / 2 - h[i])
  }
  ctx.lineTo(canvas.width, canvas.height / 2)
  ctx.stroke()
}

draw()

function change() {
  for (let i = 0; i < h.length; i++) {
    h[i] += random(-1, 1)
  }
}

btnChange.addEventListener('click', onChange)
function onChange(e) {
  change()
  draw()
}

btnAnimation.addEventListener('click',()=>{
  animationLoop()
})

function animationLoop() {
  requestAnimationFrame(animationLoop)
  change()
  draw()
}