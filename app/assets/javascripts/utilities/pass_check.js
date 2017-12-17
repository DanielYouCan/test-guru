document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById("user_password_confirmation")

  if (control) { control.addEventListener('input', passwordCheck) }
})

function passwordCheck() {
  var input1 = document.getElementById('user_password').value
  var input2 = this.value

  if (input2 === input1) {
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-verified').classList.remove('hide')
  } else {
    document.querySelector('.octicon-verified').classList.add('hide')
    document.querySelector('.octicon-alert').classList.remove('hide')
      if (input2.length == 0) {
        document.querySelector('.octicon-verified').classList.add('hide')
        document.querySelector('.octicon-alert').classList.add('hide')
      }
  }

}
