dropdownBrands = $("#author");
dropdownCategories = $("#category");

$(document).ready(function() {
	
	$("#description").richText();
	
	dropdownBrands.change(function() {
		dropdownCategories.empty();
		getCategories();
	});	
	
	getCategories();

});

function getCategories() {
	authorId = dropdownBrands.val(); 
	url = authorModuleURL + "/" + authorId + "/categories";
	
	$.get(url, function(responseJson) {
		$.each(responseJson, function(index, category) {
			$("<option>").val(category.id).text(category.name).appendTo(dropdownCategories);
		});			
	});
}

function checkUnique(form) {
	bookId = $("#id").val();
	bookName = $("#name").val();
	
	csrfValue = $("input[name='_csrf']").val();
	
	params = {id: bookId, name: bookName, _csrf: csrfValue};
	
	$.post(checkUniqueUrl, params, function(response) {
		if (response == "OK") {
			form.submit();
		} else if (response == "Duplicate") {
			showWarningModal("There is another book having the name " + bookName);	
		} else {
			showErrorModal("Unknown response from server");
		}
		
	}).fail(function() {
		showErrorModal("Could not connect to the server");
	});
	
	return false;
}	