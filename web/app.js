var results;
var qtd;

var cont = 0;
var teste = 0;
var chamados = 0;

$.getJSON("doc.json", function (result) {
    results = result;
    qtd = result.dados.length;
    while (teste<qtd){
      chamados+= result.dados[teste].y ;
      teste++;
    }


console.log(chamados+ " num sei n");
});


    
    



$(document).ready(function () {
    $("#total").html("Total de chamados: " + chamados);
});

var app = angular.module('plunker', ['nvd3']);

app.controller('MainCtrl', function ($scope) {
    $scope.options = {
        chart: {
            type: 'pieChart',
            height: 450,
            x: function (d) {
                return d.key;
            },
            y: function (d) {
                return d.y;
            },
            showLabels: true,
            duration: 500,
            labelThreshold: 0.01,
            labelSunbeamLayout: true,
            legend: {
                margin: {
                    top: 5,
                    right: 35,
                    bottom: 5,
                    left: 0
                }
            }
        }
    };


    $scope.sistemas = [
    ];
    while (cont < qtd) {
        
        $scope.sistemas.push({key: results.dados[cont].key, y: ((results.dados[cont].y*100)/chamados)});
        cont++;
    }

});

 