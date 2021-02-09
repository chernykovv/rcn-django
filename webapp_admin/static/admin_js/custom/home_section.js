$(function () {

    var type = $('#id_template');
    var t_value = $(type).val();
    var slide_position = $('.control-group.field-slide_position');
    var image_group = $('#sectionslideshowimage_set-group');

    $(document).ready(function () {

        if (t_value == 'slide') {
            $(slide_position).show();
            $(image_group).show();
        }

        else {
            $(slide_position).hide();
            $(image_group).hide();
        }

    });

    $(type).change(function () {

        var t_value = $(type).val();
        var slide_position = $('.control-group.field-slide_position');
        var image_group = $('#sectionslideshowimage_set-group');

        if (t_value == 'slide') {
            $(slide_position).show();
            $(image_group).show();
        }

        else {
            $(slide_position).hide();
            $(image_group).hide();
        }

    });

});
