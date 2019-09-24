document.addEventListener('turbolinks:load', function() {
  var controlTimer = document.getElementById('timer')

  if (controlTimer) { startTimer(controlTimer) } 

  var errors = document.getElementById('.alert')

  if (errors) {
    alert('asadddeded')
    document.getElementById('.alert').textContent = "Java";
    }
  });

function startTimer(controlTimer) {
  var startTime = controlTimer.dataset.startTime;
  var endTime = controlTimer.dataset.endTime;
  var spentTime = Math.trunc(Date.now() / 1000) - startTime;
  var remainingTime = endTime - spentTime;

  setInterval(function() {

    remainingTime --;

    if (remainingTime == 0){

      window.location.replace(window.location.href + '/result');
    }

     controlTimer.innerHTML = remainingTime;
  }, 1000)
}