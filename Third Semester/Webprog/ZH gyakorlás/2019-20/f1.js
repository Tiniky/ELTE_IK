const button = document.querySelector("button");
const speed = document.querySelector("input");

function handleButtonClick() {
  const speedValue = parseFloat(speed.value);
  const rows = document.querySelectorAll("tbody tr");   //minden sor ami nem header

  for (const row of rows) {
    const totalSize = row.querySelector("td:nth-of-type(2)");   //második oszlop
    const percentage = row.querySelector("td:nth-of-type(3)");  //harmadik oszlop  

    const totalSizeValue = parseFloat(totalSize.innerText);
    const completed = parseFloat(percentage.innerText) / 100 * totalSizeValue;  //%ot számba

    console.log(totalSizeValue);
    console.log(completed);

    const newCompleted = Math.min(completed + speedValue, totalSizeValue);  //minimumot keres
    percentage.innerText = newCompleted / totalSizeValue * 100 + "%";   //számot %ba
  }
}

button.addEventListener("click", handleButtonClick);