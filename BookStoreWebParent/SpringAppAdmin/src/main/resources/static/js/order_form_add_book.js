var bookDetailCount;

$(document).ready(function() {
	bookDetailCount = $(".hiddenBookId").length;
	
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

function addBook(bookId, bookName) {
	getShippingCost(bookId);	
}

function getShippingCost(bookId) {
	selectedCountry = $("#country option:selected");
	countryId = selectedCountry.val();
	
	state = $("#state").val();
	if (state.length == 0) {
		state = $("#city").val();		
	}
	
	requestUrl = contextPath + "get_shipping_cost";
	params = {bookId: bookId, countryId: countryId, state: state};
	
	$.ajax({
		type: 'POST',
		url: requestUrl,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfValue);
		},
		data: params		
	}).done(function(shippingCost) {
		getBookInfo(bookId, shippingCost);
	}).fail(function(err) {
		showWarningModal(err.responseJSON.message);
		shippingCost = 0.0;
		getBookInfo(bookId, shippingCost);
	}).always(function() {
		$("#addBookModal").modal("hide");
	});		
}

function getBookInfo(bookId, shippingCost) {
	requestURL = contextPath + "books/get/" + bookId;
	$.get(requestURL, function(bookJson) {
		console.log(bookJson);
		bookName = bookJson.name;
		mainImagePath = contextPath.substring(0, contextPath.length - 1) + bookJson.imagePath;
		bookCost = $.number(bookJson.cost, 2);
		bookPrice = $.number(bookJson.price, 2);
		
		htmlCode = generateBookCode(bookId, bookName, mainImagePath, bookCost, bookPrice, shippingCost);
		$("#bookList").append(htmlCode);
		
		updateOrderAmounts();
		
	}).fail(function(err) {
		showWarningModal(err.responseJSON.message);
	});	
}

function generateBookCode(bookId, bookName, mainImagePath, bookCost, bookPrice, shippingCost) {
	nextCount = bookDetailCount + 1;
	bookDetailCount++;
	rowId = "row" + nextCount;
	quantityId = "quantity" + nextCount;
	priceId = "price" + nextCount;
	subtotalId = "subtotal" + nextCount;
	blankLineId= "blankLine" + nextCount;
	
	htmlCode = `
		<div class="border rounded p-1" id="${rowId}">
			<input type="hidden" name="detailId" value="0" />
			<input type="hidden" name="bookId" value="${bookId}" class="hiddenBookId" />
			<div class="row">
				<div class="col-1">
					<div class="divCount">${nextCount}</div>
					<div><a class="fas fa-trash icon-red linkRemove" href="" rowNumber="${nextCount}"></a></div>				
				</div>
				<div class="col-3">
					<img src="${mainImagePath}" class="img-fluid" width="60%" />
				</div>
			</div>
			
			<div class="row m-2">
				<b>${bookName}</b>
			</div>
			
			<div class="row m-2">
			<table>
				<tr>
					<td>Book Cost:</td>
					<td>
						<input type="text" required class="form-control m-1 cost-input"
							name="bookDetailCost"
							rowNumber="${nextCount}" 
							value="${bookCost}" style="max-width: 250px"/>
					</td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td>
						<input type="number" step="1" min="1" max="5" class="form-control m-1 quantity-input"
							name="quantity"
							id="${quantityId}"
							rowNumber="${nextCount}" 
							value="1" style="max-width: 250px"/>
					</td>
				</tr>	
				<tr>
					<td>Unit Price:</td>
					<td>
						<input type="text" required class="form-control m-1 price-input"
							name="bookPrice"
							id="${priceId}"
							rowNumber="${nextCount}" 
							value="${bookPrice}" style="max-width: 250px"/>
					</td>
				</tr>
				<tr>
					<td>Subtotal:</td>
					<td>
						<input type="text" readonly="readonly" class="form-control m-1 subtotal-output"
							name="bookSubtotal"
							id="${subtotalId}" 
							value="${bookPrice}" style="max-width: 250px"/>
					</td>
				</tr>				
				<tr>
					<td>Shipping Cost:</td>
					<td>
						<input type="text" required class="form-control m-1 ship-input"
							name="bookShipCost" 
							value="${shippingCost}" style="max-width: 250px"/>
					</td>
				</tr>											
			</table>
			</div>
			
		</div>
		<div id="${blankLineId}"class="row">&nbsp;</div>	
	`;	
	
	return htmlCode;
}

function isBookAlreadyAdded(bookId) {
	bookExists = false;
	
	$(".hiddenBookId").each(function(e) {
		aBookId = $(this).val();
		
		if (aBookId == bookId) {
			bookExists = true;
			return;
		}
	});
	
	return bookExists;
}