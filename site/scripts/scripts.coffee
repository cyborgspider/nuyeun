modalMarkup    = '<div class="modal animate-opacity"><div class="modal-box animate-opacity"><div class="modal-close">&times;</div><div class="modal-content"><h1></h1><div class="project-images"></div></div></div></div>'

####MODAL FUNCTIONALITY####
initModal =  (projectID, projectTitle, projectImageCount) ->
  $('body').prepend(modalMarkup)
  modalWrapper   = $('.modal')
  modalContainer = $('.modal-content')
  modalImages = []
  for i in [1..projectImageCount]
    modalImages.push '<img src="img/'+projectID+'-'+i+'.jpg" alt="" />'

  loadModalContent = -> 
    modalContainer.find('h1').text(projectTitle)
    modalContainer.find('.project-images').html(modalImages)
    $('body').addClass 'modal-on'

  killModal = ->
    $('body').removeClass 'modal-on'
    modalWrapper.remove()

  $('.modal-close, .modal').on('click', ->
    killModal()
  )

  loadModalContent()


$('.project-item').on('click', '.project-link', (e) ->
    e.preventDefault()

    projectID         = $(@).attr 'href'
    projectTitle      = $(@).siblings('.project-title').text()
    projectImageCount = $(@).attr('data-images')

    initModal(projectID, projectTitle, projectImageCount)  
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
