$( document ).ready(function() {

	$("button").click(function(){
	  $("#table2excel").table2excel({
	    // exclude CSS class
	    exclude: ".noExl",
	    name: "Excel Document Name"
	  }); 
	});

});