$(document).ready(function() {
	$("#books").on("click", "#linkAddBook", function(e) {
		e.preventDefault();
		link = $(this);
		url = link.attr("href");
		
		$("#addBookModal").on("shown.bs.modal", function() {
			$(this).find("iframe").attr("src", url);
		});
		
		$("#addBookModal").modal('show');
	})
});