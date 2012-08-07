$(function() {

    $('.control-group').on("focusout", function(e){
        var validEmail = /^.+@.+[.].{2,}$/i;
        var enteredEmail = $('.email').val();
        if (!enteredEmail.match(validEmail)){
            $(this).addClass('error');
        } else {
            $(this).addClass('success');
        }
    });

});