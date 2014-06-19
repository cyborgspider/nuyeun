$('.project-item').click ->
  $('body').addClass 'modal-on'

$('.modal-close').click ->
  $('body').removeClass 'modal-on'

$container   = $('.project-list')

$container.isotope(
    itemSelector: '.project-item'
    masonry:
      columnWidth: '.project-list li'
      gutter:      24
  )

$('.filter-nav').on('click', 'li', ->
  filterValue = $(@).attr 'data-filter'

  if $(@).hasClass 'active'
    $(@).removeClass 'active'
    $container.isotope(
        filter: '*'
    )
  else
    $(@).siblings().removeClass 'active'
    $(@).addClass 'active'
    $container.isotope(
        filter: filterValue
    )

  )

