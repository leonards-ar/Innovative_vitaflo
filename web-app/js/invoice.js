  function updateProformaAmount(e)
  {
    document.createInvoice.amount.value = e.responseText;
  }
  
  function updateAddPrice(e){
    var object = JSON.parse(e.responseText);
    var lots = object.lotList;
    if(lots.size() > 0){
        $('addLot').options.length=lots.size();
		for(i=0;i < lots.size();i++){
  			$('addLot').options[i] = new Option(lots[i], lots[i]);
		}
        
      	$('addPrice').value = object.price;
  	}
  }
  
  function updateInvoiceDetailsPrice(e, index){
    var object = JSON.parse(e.responseText);
  	$('prices['+index+']').value = object.price;
    var lots = object.lotList;
    
    if(lots.size() > 0){
        $('lots['+index+']').value=lots[0];
    } else {
        $('lots['+index+']').value='';
    }         	
  }
  
  function showStock(productId){
  	new Ajax.Updater('showStockDetail', showProductStockLink, 
  	{method: 'post', 
  	 parameters:'addProductId=' + productId,
  	 onSuccess:$('showStockDetail').appear()
  		});
  	new Draggable('showStockDetail');
  }
  
  function hideProductStock(){
  	Effect.DropOut('showStockDetail');
  }
  
  Event.observe('invoiceTable','click',function(event) {
	  var clickedRow = event.findElement('tr');
	  if(clickedRow){
		  productId = clickedRow.down('');
	  }
  })