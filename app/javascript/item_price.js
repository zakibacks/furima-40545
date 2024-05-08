const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue =parseInt(priceInput.value);

  const addTaxDom = document.getElementById("add-tax-price");
  const commission = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML =  commission ;

  const profitDom = document.getElementById("profit");
  const profit = Math.floor(inputValue - commission);
  profitDom.innerHTML =  profit ;
  })
};
  
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);