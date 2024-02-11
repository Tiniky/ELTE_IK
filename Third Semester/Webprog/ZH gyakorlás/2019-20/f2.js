function delegate(parent, type, selector, handler) {
  parent.addEventListener(type, function (event) {
    const targetElement = event.target.closest(selector);

    if (this.contains(targetElement)) {
      handler.call(targetElement, event);
    }
  });
}

const data = document.querySelector("#adatok");   //a parent amiben a táblázat van

function handleProductClick() {
  const product = this;
  product.classList.toggle("termek");   //.termek a style class neve
}
delegate(data, "click", ".szallitmany ul li", handleProductClick);  //.szallitmany classon belüli ulnak a li elementjeire

function handleArrivalClick() {
  const arrival = this;
  const shipment = arrival.parentNode;    //az egészet változtassa meg ne csak azt a sort
  shipment.classList.toggle("erkezes");   //.erkezes a style class neve
}
delegate(data, "click", ".szallitmany div:first-of-type", handleArrivalClick);  //.szallitmany classon belüli divek közül az elsőre

function handleShelfClick() {
  const shelf = this;
  const shipment = shelf.parentNode;    //az egészet változtassa meg ne csak azt a sort
  shipment.classList.toggle("polc");    //.polc a style class neve
}
delegate(data, "click", ".szallitmany div:last-of-type", handleShelfClick);   //.szallitmany classon belüli divek közül az utolsóra