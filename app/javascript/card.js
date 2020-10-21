const pay = ()=> {
  Payjp.setPublicKey("pk_test_XXXXXXXX");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", () => {
    console.log("イベント発火");
  })
}

window.addEventListener("load", pay);
