####MODAL FUNCTIONALITY####
initModal =  (content) ->
  modalMarkup    = '<div class="modal animate-opacity"><div class="modal-box animate-opacity"><div class="modal-close">&times;</div><div class="modal-content"></div></div></div>'
  $('body').append(modalMarkup)
  modalWrapper   = $('.modal')
  modalContainer = $('.modal-content')

  loadModalContent = -> 
    modalTitle  = contentAssembler.title
    console.log modalTitle    
    modalContainer.find('h1').text(modalTitle)
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
    content           = $(@).attr 'href'
    projectTitle      = $(@).siblings('.project-title').text()
    projectImageCount = $(@).attr('data-images')

    contentAssembler(projectTitle, projectImageCount)
    initModal(content)  
  )

####CONTENT ASSEMBLY########
contentAssembler = (projectTitle, projectImageCount) ->
  projectTitle.title = (projectTitle) ->
    projectTitle
  console.log projectTitle + ' has ' + projectImageCount + ' images.'

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

