window.addEventListener("load", function(){
  const priceGet =  document.getElementById("item-price")

    priceGet.addEventListener("input",function(){
      const price =  document.getElementById("item-price").value
      // console.log(price)
      const fee = price * 0.1
      const profit = (price - fee);

      const feeTax =  document.getElementById("add-tax-price")
      const Profit =  document.getElementById("profit")

      feeTax.textContent = fee
      Profit.textContent = profit
      
    })
});




// // ①　JSを動かす記述 OK
// addEventListener　画面を読み込んだら

// // ②　価格入力欄のID属性を手がかりに入力値を変数Aに入れる
// document.getElementById("")　入力する箇所を取得

// // ③　上記で入れた変数Aに対しての発火条件を書く
// addEventListener　入力されたら、以下のイベントを発火させる

// // ④　②の中で入力された値を取り出して変数Bに入れる
// document.getElementById("").value　入力された値を取得

// // ⑤　変数Bに対して計算し変数C,Dに入れる（出品手数料Cと利益D）（小数点以下をどうするか？？）
// var profit = (price - fee)　変数を元に、計算をする

// // ⑥　手数料部分には変数Cの値を入れる
// // ⑦　利益部分に変数Dの値を入れる
// document.getElementById("")　貼り付けする箇所を取得
// innerHTML,texContent　計算した変数を貼り付ける
