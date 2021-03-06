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
//= require bootstrap
//= require_tree .
//= require ckeditor/init

$(function() {
  $("#datepicker").datepicker();
  $(".ad-image img").on('click' ,function() {
    var t = $(".ad-image img").attr("src");
    if (t == "/assets/bigban1.jpg"){
      var url = "http://prima-aqua.ru/skidki/1";
      $(location).attr('href',url);
    }else {
      var url = "http://prima-aqua.ru/skidki/2";
      $(location).attr('href',url);
    }
  });

  $('.order-button').on("click", function(){
    $("#tests").html("");
    $(".wrapper").addClass("disable");
    $('#popup').html("").removeClass().addClass("order").load("/quick_orders/new", function(){
      $("#quick_order_date").datepicker({
      beforeShowDay: noVoskresenie,
      onSelect: function(dateText, inst) {
        var datas = $('#datas');
        var dayed = datas.data('dayed').split(',');
        var dateed = datas.data('dateed').split(',');
        var tmp = dateText.split('/');
        var startDate = new Date(tmp[1] + '/' + tmp[0] + '/' + tmp[2]);
        var selDay = startDate.getDay() + '';
        var selDate = startDate.getDate() + '';
        var radiobutton = $(".time input:radio");
        if (($.inArray(selDay, dayed) > -1) || ($.inArray(selDate, dateed) > -1)){
          radiobutton.eq(1).attr("disabled", "disabled");
          radiobutton.eq(0).attr("checked", "checked");
          radiobutton.eq(1).removeAttr("checked")}
        else{
          radiobutton.eq(1).removeAttr("disabled")
        }
      }
      });
      $("form").validate();
    });
  });

  $('#call-phone').on("click", function(){
    $(".wrapper").addClass("disable");
    $('#popup').html("").removeClass().addClass("request-call").load("/request_calls/new", function(){

    });

  });

  $("#new_quick_order").on('submit', function (event){
    var water = $("#new_quick_order").find("select");
    var count = $('.water_count');
    var i = 0;
    var hdn = $("#quick_order_volume");
    var tmp_str = '';
    var tmpw = '';
    var tmpc = '';
    var er = $(".errr");
    water.each(function(){
      tmpw = water[i].value;
      tmpc = count[i].value;
      if (tmpw.length > 0 && tmpc > 0){
        tmp_str = tmp_str + tmpw+" литров ("+ tmpc+" штук); ";
        i++;
      }
      else{
        event.preventDefault(event);
        er.html("Заполните, пожалуйста, поля 'Вода' и 'Количество'!");
        return false;
      }
    });
    hdn.val(tmp_str);
    return true;
  });
});

function stop(){
  $('#popup').html("").removeClass('request-call').removeClass('order');
  $('.wrapper').removeClass("disable");
}
function sbmt_form(){
    var er = $(".errr");
    er.html('');
    var water = $("#new_quick_order").find("select");
    var count = $('.water_count');
    var i, flag;
    i = 0;
    flag = 0;
    var hdn = $("#quick_order_volume");
    var tmp_str = '';
    var tmpw = '';
    var tmpc = '';
    water.each(function(){
        tmpw = water[i].value;
        tmpc = count[i].value;
        if (tmpw.length > 0) {
            if (tmpc > 0) {
                tmp_str = tmp_str + tmpw + " литров (" + tmpc + " штук); ";
                i++;
            } else {
                /*event.preventDefault(event);*/
                er.html("Заполните, пожалуйста, поле 'Количество'!");
                flag = 1;
                return false;
            }
        } else {
            /*event.preventDefault(event);*/
            er.html("Заполните, пожалуйста, поле 'Вода'!");
            flag = 1;
            return false;
        }
    });
    hdn.val(tmp_str);
    if (flag == 0) {
        $('#new_quick_order').submit();
    }
}

function noVoskresenie(date){
  /*var startDate = new Date(dateText);
  $.inArray('37', str2.split(','))
  var selDay = startDate.getDay();
  return [(selDay>0),""];*/
  var datas = $('#datas');
  var dayd = datas.data('dayd').split(',');
  var dated = datas.data('dated').split(',');
  var dat = date.getDate() + '';
  var day = date.getDay() + '';
  /*return [(day != 0) && (dat != 12), ''];*/
  return [($.inArray(day, dayd) == -1) && ($.inArray(dat, dated) == -1), ''];
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

function render_fieldset (){
  var tmp = $('.for_water').html();
  var water = $("#new_quick_order").find("select").last().get(0);
  var count = $('.water_count').last().get(0);
  var er = $(".errr");
  if (water.value.length > 0 && count.value > 0){
    er.html('');
    $(".for_water_fields").append(tmp);
    water.setAttribute("id", "quick_order_watertype"+Date.now());
    count.setAttribute('id', 'quick_order_count'+Date.now());
    if ($("[id^=quick_order_water]").length == 4) {$("#link_to_add_water").remove();}
  }
  else {
    er.html("Заполните, пожалуйста, поля 'Вода' и 'Количество'.");
  }
}
