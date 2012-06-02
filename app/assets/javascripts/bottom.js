$("#active").change(function(){
	status=$('#active').val()
	window.location.replace("/?status="+status);

})