$(function () {

    var type = $('#id_link_type');
    var t_value = $(type).val();
    var page_link = $('.control-group.field-page');
    var id_link = $('.control-group.field-link');
    $(document).ready(function () {
        if (t_value == 'page') {
            $(page_link).show();
            $(id_link).show();
        }
        else {
            $(id_link).show();
            $(page_link).show();

        }

    });

    $(type).change(function () {

        var t_value = $('#id_link_type').val();

        if (t_value == 'page') {
          $(id_link).show();
          $(page_link).show();
        }
        else {
          $(id_link).show();
          $(page_link).hide();
        }

    });


    $('#id_page').change(function (){
      var id= $(this).val();
      if(id!=''){
      $.ajax({
        url:'/webpage/getdetails/',
        type:'post',
        data: {csrfmiddlewaretoken: '{{ csrf_token }}', pk:id },
        success:function(data){
          $("#id_link").val('/'+data.is_taken)
        }
      })
    }else{
      $("#id_link").val('')
    }
    });





$(document).on('change','td.field-page select',function(){

  var id= $(this).val();
  var th=this;
  if(id!=''){
  $.ajax({
    url:'/webpage/getdetails/',
    type:'post',
    data: {csrfmiddlewaretoken: '{{ csrf_token }}', pk:id },
    success:function(data){
      $(th).parent().parent().find('td.field-link input').val('/'+data.is_taken)
    }
  })
}else{
    $(th).parent().parent().find('td.field-link input').val('')
}

})

});
