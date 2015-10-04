stocksApp = angular.module('drawingApp', [])


stocksApp.controller 'drawingController', ($scope, $http, $window) ->

    letters = {}

    $http.get('/letters').then (stuff) ->
        letters = stuff.data

    $scope.text = ''

    $scope.badness = 5

    absWidthCount = 0
    heightCount = 0

    SPACEWIDTH = 30
    CHARHEIGHT = 50
    canvas = document.getElementById('canvas')
    ctx = canvas.getContext('2d')

    $scope.update = ->
        resetCanvas()
        draw(letter.toLowerCase()) for letter in $scope.text

    resetCanvas = ->
        absWidthCount = heightCount = 0
        ctx.clearRect(0, 0, canvas.width, canvas.height)

    draw = (letter) ->
        if absWidthCount > 1150
            absWidthCount = 0
            heightCount++
        if letter == '\n'
            absWidthCount = 0
            heightCount++
        else if letters[letter]
            drawLetter(letters[letter].points)
            absWidthCount += letters[letter].width
        else
            absWidthCount += SPACEWIDTH

    drawLetter = (points) ->
        ctx.beginPath()
        for i in [0...points.length]
            xShift = (Math.random() - 0.5) * $scope.badness
            yShift = (Math.random() - 0.5) * $scope.badness
            x = points[i][0] + xShift + absWidthCount + 25
            y = points[i][1] + yShift + (heightCount * CHARHEIGHT)
            if i == 0
                ctx.moveTo(x, y)
            else
                ctx.lineTo(x, y)
        ctx.stroke()

    $scope.$watch 'window.innerWidth', ->
        canvas.width = window.innerWidth - 150
