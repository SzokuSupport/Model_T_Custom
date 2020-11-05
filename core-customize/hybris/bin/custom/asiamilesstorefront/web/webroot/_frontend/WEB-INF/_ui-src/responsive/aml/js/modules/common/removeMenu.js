export default function removeMenu() {
  let $menu = $('.J-header-menu')

  if ($menu.length > 0) {
    $menu.remove()
  }
}