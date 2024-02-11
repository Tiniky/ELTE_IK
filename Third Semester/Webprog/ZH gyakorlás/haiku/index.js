const txtr = document.querySelector('#haiku-editor')
const nrofchars = document.querySelector('#number-of-characters')
const nrofrows = document.querySelector('#number-of-rows')
const vpr = document.querySelector('#vowels-per-row')
const pp = document.querySelector('#thatp')

let vowelZ = 'aáeéiíoóöőuúüű'

txtr.addEventListener('input', ()=>{
    let val = txtr.value.toLowerCase()
    console.log(val)

    let text = val.replace(/\s/g, "")
    nrofchars.innerHTML = text.length
    
    let rows = val.split('\n')
    nrofrows.innerHTML = rows.length

    console.log(rows[0].split('').filter(e=>vowelZ.includes(e)).length)

    vpr.innerHTML = ""
    for(let i in rows){
        let li = document.createElement('li')
        li.innerHTML = rows[i].split('').filter(e => vowelZ.includes(e)).length
        vpr.appendChild(li)
    }
})