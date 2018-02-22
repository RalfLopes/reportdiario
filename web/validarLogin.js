$(document).ready(function () {
 
    $("#btnApont").click(function (){
        console.log($("#name"));
        $("#tbFunc").append("<tr><td>"+ $("#name").val()+"</td><td>Sobrenome</td><td>Torre</td><td>\n\
Horário oficial</td><td>Entrada</td></tr>");            
            
        ;
    });
    
    $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
});

