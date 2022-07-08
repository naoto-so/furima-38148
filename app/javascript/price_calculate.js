function price_calculate (){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom.innerHTML);

    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = (inputValue - addTaxDom.innerHTML);
    console.log(profitPrice);
  })

};

window.addEventListener('load', price_calculate);
