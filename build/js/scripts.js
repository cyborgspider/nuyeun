(function() {
  var $container;

  $container = $('.work-list');

  $container.isotope({
    itemSelector: '.work-item',
    masonry: {
      columnWidth: '.work-list li',
      gutter: 24
    }
  });

  $('.filter-nav').on('click', 'li', function() {
    var filterValue;
    filterValue = $(this).attr('data-filter');
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      return $container.isotope({
        filter: '*'
      });
    } else {
      $(this).siblings().removeClass('active');
      $(this).addClass('active');
      return $container.isotope({
        filter: filterValue
      });
    }
  });

}).call(this);
