const textarea = document.querySelector('#text-image-urls')
const button = document.querySelector('#button-to-select')
const select = document.querySelector('#select-image-urls')
const border = document.querySelector('#border')
const color = document.querySelector('#color')
const div = document.querySelector('#images')
const bigImage = document.querySelector('#big')

button.addEventListener('click', ()=>{
  const urls = textarea.value.split('\n').filter(e => e.trim() !== '')
  select.innerHTML = ''
  urls.forEach(url => select.add(new Option(url)))    //átdobja a selectbe as Option
})

select.addEventListener('change', ()=>{
  const options = Array.from(select.selectedOptions)    //amiket a selecten belül kiválasztanak
  div.innerHTML = ''
  options.forEach(option => div.innerHTML += `<img src="${option.text}">`)    //jelenítse meg a divben
})

div.addEventListener('mouseover', onHover)
function onHover(e) {
  if (e.target.matches('img')) {
    bigImage.src = e.target.src
  }
}

border.addEventListener('input', ()=>{
  bigImage.style.borderWidth = `${border.valueAsNumber}px`
})
