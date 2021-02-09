function displaySuccess() {
    var mask = $('.dialog-mask');
    var dialog = $('.dialog-wrapper');

    $(mask).fadeIn(600);

    setTimeout(
        function () {
            $(dialog).show();
            $(dialog).animate({top: '0'}, 800)
        }, 300
    );
}

function hideSuccess() {
    var mask = $('.dialog-mask');
    var dialog = $('.dialog-wrapper');

    $(dialog).animate({top: '-9999px'}, 500);

    setTimeout(
        function () {
            $(dialog).hide();
            $(mask).fadeOut(400);
        }, 300
    );
}