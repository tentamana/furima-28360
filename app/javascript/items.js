window.addEventListener("load", function(){
  const priceGet =  document.getElementById("item-price")

    priceGet.addEventListener("input",function(){
      const price =  document.getElementById("item-price").value
  
      const fee = price * 0.1
      const profit = (price - fee);

      const feeTax =  document.getElementById("add-tax-price")
      const Profit =  document.getElementById("profit")

      feeTax.textContent = fee
      Profit.textContent = profit
      
    })
});





