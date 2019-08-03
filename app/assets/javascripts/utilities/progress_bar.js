document.addEventListener('turbolinks:load', function() { 
  var progressBar = document.getElementById('progress');

  if (progressBar) {
    var questionCount = progressBar.dataset.questionCount
    var questionNumber = progressBar.dataset.questionNumber

    var progressItog = questionNumber/questionCount * 100;

    progressBar.style.width = progressItog + '%'
  }
});