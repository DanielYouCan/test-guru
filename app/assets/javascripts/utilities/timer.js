document.addEventListener('turbolinks:load', function() {

  var timerField = document.querySelector("#timer_field")

  if (timerField) {
    var duration = timerField.dataset.testDuration * 60
    setTimer(duration)
  }

})

function setTimer(duration) {
  var start = Date.now(),
      diff,
      timerField = document.querySelector("#timer_field"),
      minutes,
      seconds;

  var id = timerField.dataset.testPassageId

  if (localStorage["start" + id]) {
    start = localStorage["start" + id];
  } else {
    localStorage["start" + id] = start;
  }

  function timer() {
    diff = duration - (((Date.now() - start) / 1000) | 0)

    minutes = (diff / 60) | 0
    seconds = (diff % 60) | 0

    minutes = minutes < 10 ? "0" + minutes : minutes
    seconds = seconds < 10 ? "0" + seconds : seconds

    timerField.textContent = minutes + ":" + seconds

    if (diff <= 0) {
      location.href = id + '/result'
      localStorage.removeItem("start" + id)
    }
  }
    timer();
    setInterval(timer, 1000);

}
