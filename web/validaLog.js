$(document).ready(function () {
    
      var recebeString = $("#status").html();

    if (recebeString==="Fechado") {
        $("#btnend").remove();
        $("#btnAlt").remove();
       
    }
  if(recebeString!=="Fechado") {
        $("#altOpen").remove();
       
    }
   {
       
   }
    $("#btnCadFunc").click(function () {
        alert("Usuário cadastrado com sucesso");
    });
    $("#btnApont").click(function () {

        $("#tbFunc").append("<tr><td>" + $("#name").val() + "</td><td>" + $("#torreOP").val() + "</td><td>\n\
Horário oficial</td><td>" + $("#hora").val() + "</td></tr>");
    });
    $("#btnIncident").click(function () {

        $("#tbInci").append("<tr><td>" + $("#ocorrencia").val() + "</td><td>" + $("#sistema").val() + "</td><td>\n\
Horário oficial</td><td>" + $("#hora").val() + "</td></tr> ");
        
    });
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus');
    });
    var i;
    for (i = 0; i < $("#obs").html(); i++) {
        $("#tbObs").append("<tr><td>" + $("#name").val() + "</td><td>" + $("#torreOP").val() + "</td><td>\n\
Horário oficial</td><td>" + $("#hora").val() + "</td></tr>");
    }


   $("#btnRel").click(function () {
      
	$("#C:/incidentes.xls").uploadFile({
	url:"YOUR_FILE_UPLOAD_URL",
	fileName:"myfile"
	});
    });


  


});
