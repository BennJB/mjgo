jQuery(document).ready(function($) { 
	$(".cook_jquery").click(function(event) {
	link=$(this).attr("href");
	$.ajax({
	async: true, 
	url: link,
	})
	.done(function(html) {
	$("#page").empty().append(html);
	})
	.fail(function() {
	console.log("error");
	})
	.always(function() {
	console.log("complete");
	});
	return false;
});
});