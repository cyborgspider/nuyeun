####MODAL FUNCTIONALITY####
initModal =  (content) ->
  modalContainer = $('.modal-content')

  loadModalContent = ->
    modalContent = $('.project-content').find('#'+content).html()
    modalContainer.html(modalContent)
    $('body').addClass 'modal-on'

  killModal = ->
    $('body').removeClass 'modal-on'
    modalContainer.html ''

  $('.modal-close, .modal').click ->
    killModal()

  loadModalContent()


$('.project-item').on('click', (e) ->
    if $(@).attr('data-href')
      content = $(@).attr 'data-href'
      initModal(content)  
    else
      e.preventDefault()
  )

#####ISOTOPE SCRIPTS######
##########################
#set the Isotope container
$container   = $('.project-list')

#activate Isotope
$container.isotope(
    itemSelector: '.project-item'
    masonry:
      columnWidth: '.project-list li'
      gutter:      24
  )

#filter options for Isotope
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

