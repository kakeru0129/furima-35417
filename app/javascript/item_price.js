window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const value_result = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  })
});