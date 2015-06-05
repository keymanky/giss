// Selectores:
// 	"elemento de html"
// 	"#id"
// 	".clase"

$(document).ready(function(){

	$(".limpiar").click(function(){
		$(".form-control").val('');
	});


	$(".tab").click(function (e) {
	  e.preventDefault()
	  $(this).tab('show');
	  alert("TEST");
	})

	// $(".tab").hover(function(){
	//     $(this).css(
	//     	"background-color", "#216490"
	//     );
	//     $(this).css(
	//     	"color", "#000"
	//     );	    
	   
	// });


});
