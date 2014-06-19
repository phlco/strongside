var bank = {};

bank.showDepositForm = function(e){
  $('#deposit-form').show();
  $('#withdraw-form').hide();
}

bank.showWithdrawForm = function(e){
  $('#deposit-form').hide();
  $('#withdraw-form').show();
}

bank.makeDeposit = function(e){
  e.preventDefault();
  var accountId = $('select[name=deposit-account]').val();
  $.ajax({
    url: "/accounts/"+ accountId +"/deposit",
    type: "post",
    data: { amount: $('#deposit-amount').val() }
  }).done(bank.updateBalance);
  $(this).hide();
}

bank.makeWithdraw = function(e) {
  e.preventDefault();
  var accountId = $('select[name=withdraw-account]').val();
  $.ajax({
    url: "/accounts/"+ accountId +"/withdraw",
    type: "post",
    data: {
      amount:           $('#withdraw-amount').val(),
      transactionType:  $('input[name=transaction-type]:checked').val(),
      toAccount:        $('select[name=transfer-to-account]').val(),
      memo:             $('input[name=transaction-memo]').val()
    }
  }).done(bank.updateBalance);
  $(this).hide();
}

bank.toggleTransfer = function(e){
  $('select[name=transfer-to-account]').toggle();
}

bank.updateBalance = function(response) {
  if (response.action === 'withdraw') {
    bank.balance -= parseFloat(response.amount);
  } else {
    bank.balance += parseFloat(response.amount);
  }
  $('#balance span').text(bank.balance);
  bank.updateAccounts();
}

bank.updateAccounts = function(response) {
  $.ajax({
    url: '/accounts',
    type: 'get',
    dataType: 'script'
  });
}

bank.addListeners = function(){
  bank.balance = parseFloat( $('#balance span').text() );
  $('#show-deposit').on('click', bank.showDepositForm);
  $('#show-withdraw').on('click', bank.showWithdrawForm);
  $('#deposit-form').on('submit', bank.makeDeposit);
  $('#withdraw-form').on('submit', bank.makeWithdraw);
  $('input[name=transaction-type]').on('change', bank.toggleTransfer);
}

$(document).ready(bank.addListeners);
