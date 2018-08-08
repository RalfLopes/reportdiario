$(document).ready(function () {
    var i;
    $.getJSON("doc.json", function (result) {
        for (i = 0; i < 4; i++) {
            alert(result.dados[i].sistema);
            alert(result.dados[i].QTD);

        }

    });

   
});

