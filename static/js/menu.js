var mobileNav = 'closed';

function toggleMobileMenu() {

    var nav = $('#mobile-nav-wrapper');

    if (mobileNav == 'closed') {
        $(nav).animate({right: '0'}, 300);
        $('body').css('overflow', 'hidden');
        mobileNav = 'open';
    }

    else {
        $(nav).animate({right: "-1000"}, 200);
        $('body').css('overflow', 'visible');
        mobileNav = 'closed';
    }

}

function toggleSubLevel(counter) {

    var wrapper = $('.sub-level-wrapper-' + counter);
    var ht = $('.sub-level-' + counter).height();

    if (wrapper.hasClass('open')) {
        $(wrapper).animate({height: '0'}, 200);
        wrapper.removeClass('open')
    }

    else {
        $(wrapper).animate({height: ht + 'px'}, 400);
        wrapper.addClass('open')
    }

}