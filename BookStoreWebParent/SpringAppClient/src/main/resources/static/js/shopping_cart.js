$(document).ready(function() {
	$(".linkMinus").on("click", function(evt) {
		evt.preventDefault();
		decreaseQuantity($(this));
	});
	
	$(".linkPlus").on("click", function(evt) {
		evt.preventDefault();
		increaseQuantity($(this));
	});	
});

function decreaseQuantity(link) {
	bookId = link.attr("pid");
	quantityInput = $("#quantity" + bookId);
	newQuantity = parseInt(quantityInput.val()) - 1;
	
	if (newQuantity > 0) {
		quantityInput.val(newQuantity);
		updateQuantity(bookId, newQuantity);
	} else {
		showWarningModal('Minimum quantity is 1');
	}	
}

function increaseQuantity(link) {
		bookId = link.attr("pid");
		quantityInput = $("#quantity" + bookId);
		newQuantity = parseInt(quantityInput.val()) + 1;
		
		if (newQuantity <= 5) {
			quantityInput.val(newQuantity);
			updateQuantity(bookId, newQuantity);
		} else {
			showWarningModal('Maximum quantity is 5');
		}	
}

function updateQuantity(bookId, quantity) {
	url = contextPath + "cart/update/" + bookId + "/" + quantity;
	
	$.ajax({
		type: "POST",
		url: url,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfValue);
		}
	}).done(function(updatedSubtotal) {
		updateSubtotal(updatedSubtotal, bookId);
		updateTotal();
	}).fail(function() {
		showErrorModal("Error while updating book quantity.");
	});	
}

function updateSubtotal(updatedSubtotal, bookId) {
	formattedSubtotal = $.number(updatedSubtotal, 2);
	$("#subtotal" + bookId).text(formattedSubtotal);
}

function updateTotal() {
	total = 0.0;
	
	$(".subtotal").each(function(index, element) {
		total += parseFloat(element.innerHTML.replaceAll(",", ""));
	});
	
	formattedTotal = $.number(total, 2);
	$("#total").text(formattedTotal);
}