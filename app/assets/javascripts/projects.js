$(function() {
    $('.modal-project').click(function(e) {
        e.preventDefault();
        $('.modal').modal('show');
    });

    $('.add-project').click(function(e) {
        $('.modal').modal('hide');
    });

});