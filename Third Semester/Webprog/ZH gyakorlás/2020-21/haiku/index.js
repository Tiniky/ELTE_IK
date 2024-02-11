const textarea = document.querySelector('#haiku-editor')
const button = document.querySelector('#btn-copy-haiku')
const spanCharacters = document.querySelector('#number-of-characters')
const spanRows = document.querySelector('#number-of-rows')
const rowList = document.querySelector('#vowels-per-row')
const haikus = document.querySelector('#haikus')
//const szoveg = document.querySelector('#szoveg')

textarea.addEventListener('input', ()=>{
  const str = textarea.value.toLowerCase()
  console.log(str)

  spanCharacters.innerHTML = str.length

  const rows = str.split('\n')    //felosztja \n-enként
  spanRows.innerHTML = rows.length

  const firstRowVowels = numberOfVowels(rows[0])
  console.log(firstRowVowels)
  
  const vowelsPerRow = rows.map(numberOfVowels) 
  rowList.innerHTML = vowelsPerRow.map(n => `<li>${n}</li>`).join('')

  textarea.closest('p').classList.toggle('haiku', rows.length === 3 && vowelsPerRow[0] === 5 && vowelsPerRow[1] === 7 && vowelsPerRow[2] === 5 )
  //szoveg.classList.toggle('haiku', rows.length === 3 && vowelsPerRow[0] === 5 && vowelsPerRow[1] === 7 && vowelsPerRow[2] === 5 )
})

function numberOfVowels(row) {
  const vowels = 'aáeéiíoóöőuúüű'
  return row.split('').filter(c => vowels.includes(c)).length   //karakterekre bontva megnézi vowel-e
}

button.addEventListener('click', onClick)
function onClick(e) {
  haikus.innerHTML += `<pre>${textarea.value}</pre>`
}