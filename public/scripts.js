$(document).ready(function(){
	console.log("Javascript linked! Time to get ajaxy!");
	$("form").submit(function(e){
		e.preventDefault();
		var uri = $(this).attr("action");
		var toEncrypt = $(this).find("textarea[name='encrypt']").val();
		var key = $(this).find("input[name='key']").val();
		var data = {encrypt: toEncrypt, key: key};
		
		$.ajax({
			type: "POST",
			dataType: "json",
			data: data,
			url: uri,
			success: showEncrypted,
			error: showError
		});
	});
	
});

function showEncrypted(response){
	// console.log("success");
	// console.log(response);
	var encrypted_text = response.encrypted;
	$(".cipher-text").empty().append(encrypted_text);
	$("#randkey").empty().append(response.key);
}

function showError(response){
	console.log("Error");
	console.log(response);
}