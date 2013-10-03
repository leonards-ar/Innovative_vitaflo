function updateAddPrice(e){
    document.getElementById('addPrice').value = e.responseText;
}

function updatePurchaseDetailsPrice(e, index){
	document.getElementById('prices['+index+']').value = e.responseText;
}

function updateAmount(e){
	alert("texto: " + $('count').value);
	$('amount').value = "250";
}
