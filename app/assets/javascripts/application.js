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
			var url = "http://water.lvl0nax.locum.ru/skidki/1";    
			$(location).attr('href',url);
		}else {
			var url = "http://water.lvl0nax.locum.ru/skidki/2";    
			$(location).attr('href',url);
		}
  });

  $('.order-button').live("click", function(){
  	$(".wrapper").addClass("disable");
    $('#popup').html("").removeClass().addClass("order").load("/quick_orders/new", function(){
	    $("#quick_order_date").datepicker({
			beforeShowDay: noVoskresenie,
	    	onSelect: function(dateText, inst) {
                    var startDate = new Date(dateText);
                    var selDay = startDate.getDay();
                    
                        if (selDay == 2 || selDay == 5){
	                    	$(".time input:radio").eq(1).attr("disabled", "disabled");
	                    	$(".time input:radio").eq(0).attr("checked", "checked");
	                    	$(".time input:radio").eq(1).removeAttr("checked");}
	                    else{
	                    	$(".time input:radio").eq(1).removeAttr("disabled");}

	        }    	
	    });
	    $("form").validate();
    });
  });


function noVoskresenie(date){
	/*var startDate = new Date(dateText);
	var selDay = startDate.getDay();
	return [(selDay>0),""];*/
	var day = date.getDay(); 
    return [(day > 0), '']; 
};


	$('#call-phone').live("click", function(){
		$(".wrapper").addClass("disable");
		$('#popup').html("").removeClass().addClass("request-call").load("/request_calls/new", function(){

    });
		
	});

	$("#close").live('click' ,function() {
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