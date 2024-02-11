const gameIsOn = document.querySelector('#game')
const newGame = document.querySelector('#new')
const diff = document.querySelector('#difficulty')
const easy = document.querySelector('#easy')
const medium = document.querySelector('#medium')
const hard = document.querySelector('#hard')
const labelDiff = document.querySelector('#label')

diff.style.display = "none"

function showDifficulties(){
    time.start()
    diff.style.display = "block"
    newGame.style.display = "none"
}

newGame.addEventListener("click", showDifficulties)

easy.addEventListener("click", ()=>{
    diff.style.display = "none"
    labelDiff.innerHTML = `<p>Könnyű nehézség</p>`
})

medium.addEventListener("click", ()=>{
    diff.style.display = "none"
    labelDiff.innerHTML = `<p>Haladó nehézség</p>`
})

hard.addEventListener("click", ()=>{
    diff.style.display = "none"
    labelDiff.innerHTML = `<p>Extrém nehézség</p>`
})

class Timer {
    constructor () {
      this.isRunning = false;
      this.startTime = 0;
      this.overallTime = 0;
    }
  
    _getTimeElapsedSinceLastStart () {
      if (!this.startTime) {
        return 0;
      }
    
      return Date.now() - this.startTime;
    }
  
    start () {
      if (this.isRunning) {
        return console.error('Timer is already running');
      }
  
      this.isRunning = true;
  
      this.startTime = Date.now();
    }
  
    stop () {
      if (!this.isRunning) {
        return console.error('Timer is already stopped');
      }
  
      this.isRunning = false;
  
      this.overallTime = this.overallTime + this._getTimeElapsedSinceLastStart();
    }
  
    reset () {
      this.overallTime = 0;
  
      if (this.isRunning) {
        this.startTime = Date.now();
        return;
      }
  
      this.startTime = 0;
    }
  
    getTime () {
      if (!this.startTime) {
        return 0;
      }
  
      if (this.isRunning) {
        return this.overallTime + this._getTimeElapsedSinceLastStart();
      }
  
      return this.overallTime;
    }
}

const time = new Timer
setInterval(() => {
    const timeInSeconds = Math.round(time.getTime() / 1000);
    document.getElementById('secondsPassed').innerText = timeInSeconds;
  }, 100)