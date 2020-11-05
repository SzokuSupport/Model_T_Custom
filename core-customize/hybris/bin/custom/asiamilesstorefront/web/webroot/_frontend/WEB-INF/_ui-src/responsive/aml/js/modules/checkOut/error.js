/** show input error mes */
export default function error(id) {
  let $form = $(id)
  let result = JSON.parse($(id).find('.validationResult').val() ? $(id).find('.validationResult').val() : '{}')
  let errorList = result.detail ? result.detail : []
  for (let i = 0; i < errorList.length; i++) {
    let inputName = 'input[name=' + `${errorList[i].id}` + ']'
    $form.find(inputName).parent().children('.J-error-box').show()
    $form.find(inputName).parent().find('.J-error-back').text(errorList[i].message)
  }
}