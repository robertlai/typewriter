
stocksApp = angular.module('drawingApp', [])


stocksApp.controller 'drawingController', ($scope) ->

    $scope.text = ''

    $scope.update = ->
        console.log $scope.text

    $scope.doClick = (event) ->
        x = event.clientX
        y = event.clientY
        offsetX = event.offsetX
        offsetY = event.offsetY
        #/ These are the 2 new lines, see you target the canvas element then apply it to getContext
        canvasElement = document.getElementById('canvas')
        ctx = canvasElement.getContext('2d')
        #draw a circle
        ctx.beginPath()
        ctx.arc x, y, 10, 0, Math.PI * 2, true
        ctx.closePath()
        ctx.fill()