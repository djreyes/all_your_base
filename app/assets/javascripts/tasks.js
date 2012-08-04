$(function() {

    $('.add').click(function(e) {
        e.preventDefault();
        $(this).hide();
        $('.form').css('display', 'block');
    });

});