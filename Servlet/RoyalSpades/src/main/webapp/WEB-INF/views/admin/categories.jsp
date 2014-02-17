<script>
	window.location.hash = "p=" + "${pageUid}";
</script>
<h2> 
	Varor
</h2>

<table id="categoryTable" class="listtable">
	<tr>
		<th>Kategorier</th>
	</tr>
</table>
<form id="newCatForm" style="display: none">
	<input name="catName" type="text">
	<button submit="/"></button>
</form>
	<button id= addCatBtn >L�gg till ny kategori</button><br>
	<button id= editCatBtn >Redigera</button><br>
	<button id= deleteCatBtn >Ta bort</button>
	
	<script>
$( document ).ready(function() {	
	function preZero(s){
		s += "";
		if(s.length < 2){
			s = "0" + s;
		}
		return s;
	}
	
	//kunna posta datan i formul�ret f�r att skapa ny cat, kunna markera nya poster och ta bort eller �ndra
	
	$("#addCatBtn").on("click", function(){
		$("newCatForm").show();
	});
	
	var d = new Date();
	$("input[name$='date']").val(d.getFullYear() + "-" + preZero(d.getMonth()+1) + "-" + preZero(d.getDate()) + " " + preZero(d.getHours()) + ":" + preZero(d.getMinutes())).prop('disabled', true);
	
	//H�mtar all data fr�n kategorier i db:n
	$.ajax({
		type: "GET",
		url: "/royalspades/api/category/all/",
		dataType: "text",
		success: function (data, textStatus, jqXHR) {
			var arr = JSON.parse(data);
			//startar en tbody-tag
			$("#categoryTable").append("<tbody>");
			//loopar igenom all data och l�gger i en tabell
			for(var i = 0; i < arr.length; i++){
				var row = "<tr><td>";
				row += arr[i].name;
				row += '</td><td style="text-align:center;">';
				row += '<input type="checkbox">';
				row += "</td></tr>";
				$("#categoryTable").append(row);
			}
			
			$("#categoryTable").append("</tbody>");
			
			/* $('#categoryTable').dataTable({
				"aLengthMenu": [
		            [25, 50, 100, -1],
		            [25, 50, 100, "All"]],
				"iDisplayLength" : -1,
		        "bScrollInfinite": true,
		        "bScrollCollapse": false,
		        "sScrollY": "300px",
				"oLanguage": {
					"sLengthMenu": "Visar _MENU_ produkter per sida",
					"sZeroRecords": "Hittade inget - tyv�rr",
					"sInfo": "Visar _START_ till _END_ av _TOTAL_ varor",
					"sInfoEmpty": "Visar 0 av 0 varor",
					"sInfoFiltered": "(filtrerat fr�n _MAX_ varor)",
					"sSearch": "Filtrera: "
				}		
			}); */
		},
		error: function (data, textStatus, jqXHR) {
			alert("Error: " + textStatus + ", " + jqXHR);
		}
	});
});
</script>