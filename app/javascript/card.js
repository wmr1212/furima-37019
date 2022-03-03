const pay = () => {
  Payjp.setPublicKey("pk_test_1ae1a924e143f2392798bcd4");
  const submit = document.getElementById("button")
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_history[number]"),
      cvc: formData.get("purchase_history[cvc]"),
      exp_month: formData.get("purchase_history[exp_month]"),
      exp_year: `20${formData.get("purchase_history[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("purchase_history_number").removeAttribute("name");
      document.getElementById("purchase_history_cvc").removeAttribute("name");
      document.getElementById("purchase_history_exp_month").removeAttribute("name");
      document.getElementById("purchase_history_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);