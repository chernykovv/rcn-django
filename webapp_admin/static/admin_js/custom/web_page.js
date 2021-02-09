$(function () {

    var type = $('#id_template_choice');
    var t_value = $(type).val();
    var sections = $('#pagesection_set-group');

    $(document).ready(function () {

        if (t_value == 'landing') {
            $(sections).show();
        }

        else {
            $(sections).hide();
        }

    });

    $(type).change(function () {

        var t_value = $(type).val();
        var sections = $('#pagesection_set-group');

        if (t_value == 'landing') {
            $(sections).show();
        }

        else {
            $(sections).hide();
        }

    });

});
