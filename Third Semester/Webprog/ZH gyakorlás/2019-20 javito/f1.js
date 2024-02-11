const button = document.querySelector("button");
let div;

function handleButtonClick() {
  if (div !== undefined) return;    //ha már egyszer defineolta akkor nem csinál semmit

  let headings = document.querySelectorAll("h1, h2, h3");
  let level = 1;

  let toc = document.createElement("ul");
  let lastLevel = toc;
  
  for (const heading of headings) {
    let currentLevel = heading.tagName.slice(-1);   //tagname itt a H1, H2 és H3 tehát ha levágja a -1et akkor 1 2 és 3
    
    while (currentLevel != level) {
      if (currentLevel > level) {
        let sublist = document.createElement("ul");
        lastLevel.lastChild.appendChild(sublist);   //az aktuális ul utolsó gyereke aka a li kap egy ult
        lastLevel = sublist;
        level++;
      } else if (currentLevel < level) {
        lastLevel = lastLevel.parentNode;     //visszalép az eggyel felette lévő ulra
        level--;
        if(currentLevel == level && currentLevel == 1){
          lastLevel = lastLevel.parentNode;
        }
      }
    }

    item = document.createElement("li");
    item.innerText = heading.innerText;
    
    lastParent = item;
    lastLevel.appendChild(item);
  }

  div = document.createElement("div");
  div.appendChild(toc);
  button.insertAdjacentElement("beforebegin", div);
}

button.addEventListener("click", handleButtonClick);