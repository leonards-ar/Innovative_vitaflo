function updateAddPrice(e){
    document.getElementById('addPrice').value = e.responseText;
}

function updatePurchaseDetailsPrice(e, index){
	document.getElementById('prices['+index+']').value = e.responseText;
}
