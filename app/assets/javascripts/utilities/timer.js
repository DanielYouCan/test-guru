document.addEventListener('turbolinks:load', function() {
  $('.btn-start').on('click', timerTestHandler)

})

function timerTestHandler() {
  var duration = this.dataset.testDuration * 60

  if (duration) {
    setTimer(duration)
  }
}

function setTimer(duration) {
  var timerField = document.getElementById("timer_field")

  setInterval(function() {
    minutes = parseInt(duration / 60, 10)
    seconds = parseInt(duration % 60, 10)

    minutes = minutes < 10 ? "0" + minutes : minutes
    seconds = seconds < 10 ? "0" + seconds : seconds

    timerField.textContent = minutes + ":" + seconds;

  }, 1000)
}
