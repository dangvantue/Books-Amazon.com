$(document).ready(function() {
	$("#bookList").on("click", ".linkRemove", function(e) {
		e.preventDefault();
		
		if (doesOrderHaveOnlyOneBook()) {
			showWarningModal("Could not remove book. The order must have eat least one book.");
		} else {
			removeBook($(this));		
			updateOrderAmounts();	
		}
	});
});

function removeBook(link) {
	rowNumber = link.attr("rowNumber");
	$("#row" + rowNumber).remove();
	$("#blankLine" + rowNumber).remove();
	
	$(".divCount").each(function(index, element) {
		element.innerHTML = "" + (index + 1);
	});
}

function doesOrderHaveOnlyOneBook() {
	bookCount = $(".hiddenBookId").length;
	return bookCount == 1;
}