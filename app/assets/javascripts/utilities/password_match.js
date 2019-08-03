document.addEventListener('turbolinks:load', function() {
  password = document.getElementById('user_password'); 
  password_confirmation = document.getElementById('user_password_confirmation');

  if (password_confirmation) { password_confirmation.addEventListener('input', matchConfirmationPass)}
});

function matchConfirmationPass() {
  if(password.value && password_confirmation.value) {
    if(password.value === password_confirmation.value) {
      document.querySelector('.octicon-verified').classList.remove('hide')
  	  document.querySelector('.octicon-x').classList.add('hide')
    } else {
      document.querySelector('.octicon-verified').classList.add('hide')
      document.querySelector('.octicon-x').classList.remove('hide')
    }
  } else {
  document.querySelector('.octicon-verified').classList.add('hide') 
  document.querySelector('.octicon-x').classList.add('hide')
  }
}
