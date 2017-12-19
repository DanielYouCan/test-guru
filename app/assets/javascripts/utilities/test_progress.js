document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    var questionId = progressBar.dataset.questionId
    var questionsAmount = progressBar.dataset.questionsAmount

    var progressPercent = Math.trunc(questionId/questionsAmount * 100)

    if (progressPercent == 100) {
      progressBar.classList.remove('bg-info')
      progressBar.classList.remove('progress-bar-animated')
      progressBar.classList.remove('progress-bar-striped')
      progressBar.classList.add('bg-success')
    }
    progressBar.innerHTML = progressPercent + "% complete"
    progressBar.style.width = progressPercent + "%"
   }
})
