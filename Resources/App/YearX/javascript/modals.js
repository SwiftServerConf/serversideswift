$('#global-modal').on('show.bs.modal', function (event) {
var button = $(event.relatedTarget)
var titleText = button.data('title')
var descriptionText = button.data('description')
var modal = $(this)

modal.find('.modal-title').text(titleText)
modal.find('.modal-body').text(descriptionText)
})
