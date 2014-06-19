$container   = $('.work-list')

$container.isotope(
    itemSelector: '.work-item'
    masonry:
      columnWidth: '.work-list li'
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

