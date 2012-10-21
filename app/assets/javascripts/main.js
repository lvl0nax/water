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
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
	/*$('.trainings input:checkbox').click(function() {
			$('.temp_month').toggle();
		});
	*/

	$(document).on('click',".ad-image img" ,function() {
		var t = $(".ad-image img").attr("src");
		if (t == "/assets/bigban1.jpg"){
			var url = "http://109.120.139.79/specoffers/1";    
			$(location).attr('href',url);
		}else {
			var url = "http://109.120.139.79/specoffers/2";    
			$(location).attr('href',url);
		}

    
  });

  $('#order-button').on("click", function(){
  	$(".wrapper").addClass("disable");
    $('#popup').html("").removeClass().addClass("order").load("/quick_orders/new", function(response, status, xhr){

    });
  });
	$('#call-phone').on("click", function(){
		$(".wrapper").addClass("disable");
		$('#popup').html("").removeClass().addClass("request-call").load("/request_calls/new", function(){

    });
		
	});

	$(document).on('click',"#close" ,function() {
		$(".wrapper").removeClass("disable");
		$('#popup').html("").removeClass();
	});
});


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

function checkradio () {
	
}

function test(){
	var tmp = $(".days input:radio:checked").val();
	if (tmp == "ВТ" || tmp == "ПТ"){
		$(".time input:radio").eq(1).attr("disabled", "disabled");
		$(".time input:radio").eq(0).attr("checked", "checked");
		$(".time input:radio").eq(1).removeAttr("checked");
	}else {
		$(".time input:radio").eq(1).removeAttr("disabled");
	}
}
