$(document).ready(function(){
    $('.more-ul').hide();
    $('.more').click(function() {
        $('.more-ul').slideToggle();
    });
    $(".header-btn").click(function() {
        $(".header-nav").slideToggle();
    })
});