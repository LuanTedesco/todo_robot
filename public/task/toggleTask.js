var checkbox = document.querySelectorAll('.checkbox-toggle')

checkbox.forEach(function (task) {
  task.addEventListener('click', function (e) {
    var form_task = this.parentNode
    form_task.submit()
  })
})
