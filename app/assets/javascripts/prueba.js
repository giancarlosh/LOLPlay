// $('.btn-expand-collapse').click(function(e) {
// 				$('.navbar-primary').toggleClass('collapsed');
// 

y = $('.if-yes-then-show');

$('input[name="yesno"]').click(function () {
    
  //if yes checked
  $('input[name="yesno"]:first').prop('checked')
     //then show
     ? y.show('slideToggle')
      //if not, hide
     : y.hide('slideToggle')

});