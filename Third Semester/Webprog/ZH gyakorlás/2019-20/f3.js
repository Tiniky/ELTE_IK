const input = document.querySelector("input");

function handleKeyDown(event) {
  if (event.code === "Backspace" || event.code === "Delete") {    //event.code = "Backspace", "Enter", "Space", "ShiftLeft" meg ilyenek
    event.preventDefault();   //megakadályozza a backspace és a delete gombok működésést
    return;
  }

  const allowedChars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."];
  if (!allowedChars.includes(event.key)) {
    event.preventDefault();   //megakadályozza hogy számokon vagy ponton kívül más gombot beüssünk
    return;
  }

  const ipAddress = input.value + event.key;  //event.key = literally a gomb amit lenyomsz
  const parts = ipAddress.split(".");
  if (parts.length < 4) {
    input.classList.remove("helyes");
    input.classList.add("helytelen");
    return;
  }

  //add hozzáadja a classList elemet, remove leveszi róla, toggle meg ha kattintgatni kell
  if (parts.every(part => parseInt(part) >= 0 && parseInt(part) <= 255)){
    input.classList.add("helyes");
    input.classList.remove("helytelen");
  } else {
    input.classList.remove("helyes");
    input.classList.add("helytelen");
  }
}

input.addEventListener("keydown", handleKeyDown);