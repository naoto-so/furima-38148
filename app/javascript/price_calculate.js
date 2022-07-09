function price_calculate (){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = (inputValue - addTaxDom.innerHTML);
  })

};

window.addEventListener('load', price_calculate);
