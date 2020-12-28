jQuery(document).ready(function($){

    // open popup
    $('.person-detail-edit').click(function(event){      
        $('.form-person-detail').toggleClass ('is-visible');                     
    })

    $('.contact-edit').click(function(event){      
        $('.form-contact').toggleClass ('is-visible');                     
    })

    $('.setting-edit').click(function(event){      
                            
    })

    //close popup
    $(document).keyup(function(event){
        if(event.which=='27'){
            $('.popup').removeClass('is-visible');
        }
    });

    $('.popup').click(function(event){
        if ($(event.target).is('.popup') == true || $(event.target).is('.popup .popup-container i.close-popup') ==true ){
            $(this).removeClass('is-visible');
        }     
    });

    // date picker
    $('.date-picker').datepicker({
        dateFormat : "dd/mm/yy",
        maxDate : '-1D'
    });

});

