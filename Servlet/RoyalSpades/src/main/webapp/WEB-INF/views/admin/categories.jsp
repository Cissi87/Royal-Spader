<script>
	window.location.hash = "p=" + "${pageUid}";
</script>
<h2> 
	Varor
</h2>
<div id="categoryTableDiv">
	<table id="categoryTable" class="listtable">
		<thead>
			<tr>
				<th>Kategorier</th><th>&nbsp;</th><th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<form id="newCatForm" style="display: none">
	<input type="text" type="text" name="name" placeholder = "Skriv in din nya varukategori." >
	<button submit="" id="toggleCatBtn">Spara</button>
</form>
	<button id="addCatBtn">L�gg till ny kategori</button><br>
	<form id="editCatForm" style="display: none">
	<input type="text" type="text" name="name" placeholder = "Skriv in din nya varukategori." >
	<button submit="" id="toggleeditCatBtn">Spara</button>
</form>
<<<<<<< HEAD
	
	<script>
$( document ).ready(function() {	
	refreshTable();
=======
	<button id= editCatBtn >Redigera</button><br>
	<button id= deleteCatBtn >Ta bort</button>

<div class="response"></div>
<div class="error"></div>
	<script>
$( document ).ready(function() {	
	
	$.fn.serializeObject = function()
	{
	   var o = {};
	   var a = this.serializeArray();
	   a.re
	   $.each(a, function() {
	       if (o[this.name]) {
	           if (!o[this.name].push) {
	               o[this.name] = [o[this.name]];
	           }
	           o[this.name].push(this.value || '');
	       } else {
	           o[this.name] = this.value || '';
	       }
	   });
	   return o;
	};
	
	
>>>>>>> b70e6b35b8dc30f748848762f36e001a8ecd9087
	function preZero(s){
		s += "";
		if(s.length < 2){
			s = "0" + s;
		}
		return s;
	}
	$(document).on("click","#addCatBtn",function(){
		$("#newCatForm").show();
		$("#addCatBtn").hide();
	});

	$(document).on("click","#toggleCatBtn",function(event){
		$("#newCatForm").hide();
		
		$("#addCatBtn").show();
	});

   // Save category
	$('#newCatForm').submit(function(e) {
		  $(".response").text("");
	  	  $('.error').text("");
    	  var data = $(this).serializeObject();
    	  // will pass the form data and parse it to json string
    	  $.ajax({
    		  url: baseUrl+'/api/category/admin/add_category',
    		  data: JSON.stringify(data),
    		  contentType:'application/json',
    		  accept:'application/json',
    		  processData:false,
    		  type: 'POST',
    		  complete: function(response) {
  				if(response.status == 200){
  	    			// clear values
  				    $(':input','#newCatForm')
  						.not(':button, :submit, :reset, :hidden')
  						.val('');
  		    	    $('.response').text(response.responseText);
  		    	    refreshTable();
  				}
				
    		  }, error: function(response){
    			if(response.status != 200){
        			var responseJSON = response.responseJSON;
        			
        	  	   	if(typeof responseJSON != 'undefined'){
        	  	   		var errors = '';
        	  	   		
            	  	   	for(var i = 0; i < responseJSON.fieldErrors.length; i ++){
                	  	   	errors += (responseJSON.fieldErrors[i].message); 
                	  	   	errors += '<br>';
            	  	   	}
            	  	  	
            	  	   	$('.error').append(errors);

        	  	   	} else {
            	  	   	$('.error').text(response.responseText); 
        	  	   	}
    			}
    	  	   	
    		  }
    	  });
	   
	  e.preventDefault(); // prevent actual form submit and page reload
	});
 
	
	//kunna posta datan i formuläret för att skapa ny cat, kunna markera nya poster och ta bort eller �ndra
	
	$("#addCatBtn").on("click", function(){
		//$("newCatForm").show();
	});
	
	var d = new Date();
	$("input[name$='date']").val(d.getFullYear() + "-" + preZero(d.getMonth()+1) + "-" + preZero(d.getDate()) + " " + preZero(d.getHours()) + ":" + preZero(d.getMinutes())).prop('disabled', true);
	
	function getCategory (id){
		//Diven töms på information och sedan laddas om
			//$("#categoryTableDiv").html("<table id=\"categoryTable\" class=\"listtable\"><tr><th>Kategorier</th><th>&nbsp;</th></tr></table>");
		
		//Hämtar all data från kategorier i db:n
		$.ajax({
			type: "GET",
			url: "/royalspades/api/category/"+id,
			dataType: "text",
			success: function (data, textStatus, jqXHR) {
				var arr = JSON.parse(data);
				//startar en tbody-tag
				//loopar igenom all data och l�gger i en tabell
				for(var i = 0; i < arr.length; i++){
					var row = arr[i].name;
				}
				
			},
			error: function (data, textStatus, jqXHR) {
				alert("Error: " + textStatus + ", " + jqXHR);
			}
		});
	}
	
	function deleteCategory(event, id){
		  event.preventDefault();
		  
		  if (confirm(' �r du s�ker p� att du vill ta bort aff�ren?')) {
		   
		   $.post('/royalspades/api/store/admin/remove_category/' + id, null, function(response) {
		      console.log(response);
		        });
		  	}
		 }
		//row += '&nbsp;<a class="link" href="" onclick="deleteCategory(event, ' + arr[i].id + ')">X</a>';
	
});
function refreshTable (){
//Diven töms på information och sedan laddas om
	
<<<<<<< HEAD

//Hämtar all data från kategorier i db:n
=======
	//H�mtar all data fr�n kategorier i db:n
>>>>>>> b70e6b35b8dc30f748848762f36e001a8ecd9087
	$.ajax({
		type: "GET",
		url: "/royalspades/api/category/all/",
		dataType: "text",
		success: function (data, textStatus, jqXHR) {
			var arr = JSON.parse(data);
			//startar en tbody-tag
<<<<<<< HEAD
			
			$("#categoryTable tbody").empty();
			//loopar igenom all data och lägger i en tabell
=======
			$("#categoryTable").append("<tbody>");
			//loopar igenom all data och l�gger i en tabell
>>>>>>> b70e6b35b8dc30f748848762f36e001a8ecd9087
			for(var i = 0; i < arr.length; i++){
				var row = "<tr><td>";
				row += arr[i].name;
				row += '</td><td style="text-align:center;">';
				row += '<i class="fa fa-pencil black"></i>';
				row += '</td><td style="text-align:center;">';
				row += '<i class="fa fa-times red"></i>';
				row += "</td></tr>";
				
				$("#categoryTable tbody").append(row);
			}
		},
		error: function (data, textStatus, jqXHR) {
			alert("Error: " + textStatus + ", " + jqXHR);
		}
	});
} 
</script>