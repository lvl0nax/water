// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require ckeditor/init

$(function() {
  /*$('.trainings input:checkbox').click(function() {
      $('.temp_month').toggle();
    });
  */
  //$("#datepicker").datepicker();
  $(".ad-image img").live('click' ,function() {
    var t = $(".ad-image img").attr("src");
    if (t == "/assets/bigban1.jpg"){
      var url = "http://prima-aqua.ru/skidki/1";
      $(location).attr('href',url);
    }else {
      var url = "http://prima-aqua.ru/skidki/2";
      $(location).attr('href',url);
    }
  });

  $('.order-button').live("click", function(){
    $(".wrapper").addClass("disable");
    $('#popup').html("").removeClass().addClass("order").load("/quick_orders/new", function(){
      $("#quick_order_date").datepicker({
      beforeShowDay: noVoskresenie,
      onSelect: function(dateText, inst) {
        var tmp = dateText.split('/');
        var startDate = new Date(tmp[1] + '/' + tmp[0] + '/' + tmp[2]);
        var selDay = startDate.getDay();
        var selDate = startDate.getDate();

        if (selDay == 2 || selDay == 5 || selDate == 9){
          $(".time input:radio").eq(1).attr("disabled", "disabled");
          $(".time input:radio").eq(0).attr("checked", "checked");
          $(".time input:radio").eq(1).removeAttr("checked")}
        else{
          $(".time input:radio").eq(1).removeAttr("disabled")
        }
      },

      });
      $("form").validate();
    });
  });

  $('#call-phone').live("click", function(){
    $(".wrapper").addClass("disable");
    $('#popup').html("").removeClass().addClass("request-call").load("/request_calls/new", function(){

    });

  });

  $("#close").live('click' ,function() {
    $(".wrapper").removeClass("disable");
    $('#popup').html("").removeClass();
  });

  $("#new_quick_order").live('submit', function (){
    var water = $("#new_quick_order select");
    var count = $('.water_count');
    var i = 0;
    var hdn = $("#quick_order_volume");
    var tmp_str = '';
    var tmpw = '';
    var tmpc = '';
    var er = $(".errr");
    water.each(function(){
      tmpw = water.get(i).value;
      tmpc = count.get(i).value;
      if (tmpw.length > 3 && tmpc > 0){
        tmp_str = tmp_str + tmpw+" литров ("+ tmpc+" штук); ";
        i++;
      }
      else{
        er.html("Заполните, пожалуйста, поля 'Вода' и 'Количество'!");
        $("form").validate();
        event.preventDefault();
        return false;
      }
    });
    hdn.val(tmp_str);
    return true;
  });
});

function noVoskresenie(date){
  /*var startDate = new Date(dateText);
  var selDay = startDate.getDay();
  return [(selDay>0),""];*/
  var dayd = date.getDate();
  var day = date.getDay();
    return [((day > 0) && (dayd != 8)), ''];
};

$(window).load(function(){
  /*$("#popup1").load("/quick_orders/new");
  $("#popup2").load("/request_calls/new");*/
  var cook = $.cookie("primaaqua");
  if (cook) {
  }
  else {
    $("#tests").load("/quick_orders/new").load("/request_calls/new").html("");
    $.cookie("primaaqua","1");
  }

});

$(window).unload(function(){
  $.removeCookie("primaaqua");
});

function changevolume () {
  $("#quick_order_volume").val("111111111");
  return true;
}

function render_fieldset (){
  var tmp = $('.for_water').html();
  var water = $("[id^=quick_order_water]").last().get(0);
  var count = $("[id^=quick_order_count]").last().get(0);
  var er = $(".errr");
  if (water.value.length > 3 && count.value > 0){
    er.html('');
    $(".for_water_fields").append(tmp);
    water.setAttribute("id", "quick_order_watertype"+Date.now());
    count.setAttribute('id', 'quick_order_count'+Date.now());
    if ($("[id^=quick_order_water]").length == 4) {$("#link_to_add_water").remove();}
  }
  else {
    er.html("Заполните, пожалуйста, поля 'Вода' и 'Количество'!");
  }

}
