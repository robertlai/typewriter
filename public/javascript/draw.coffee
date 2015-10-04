
stocksApp = angular.module('drawingApp', [])


stocksApp.controller 'drawingController', ($scope, $window) ->

    $scope.text = ''
    widthCount = 0
    heightCount = 0

    CHARWIDTH = 30
    CHARHEIGHT = 50
    SPACEWIDTH = 10
    BADNESS = 10
    canvas = document.getElementById('canvas')
    ctx = canvas.getContext('2d')

    $scope.update = ->
        resetCanvas()
        draw(letter) for letter in $scope.text

    resetCanvas = ->
        widthCount = heightCount = 0
        ctx.clearRect(0, 0, 1000, 800)

    draw = (letter) ->
        points = []
        if letter == 'a'
            points = [[20,30],[10,30],[10,45],[20,45],[20,30],[20,57]]
        drawLetter(points)
        widthCount++
        if widthCount == 25
            widthCount = 0
            heightCount++

    drawLetter = (points) ->
        ctx.beginPath()
        for i in [0...points.length]
            xShift = (Math.random() - 0.5) * BADNESS
            yShift = (Math.random() - 0.5) * BADNESS
            points[i][0] += xShift + (widthCount * (CHARWIDTH + SPACEWIDTH))
            points[i][1] += yShift + (heightCount * (CHARHEIGHT + SPACEWIDTH))

            if i == 0
                ctx.moveTo(points[i][0], points[i][1])
            else
                ctx.lineTo(points[i][0], points[i][1])
        ctx.stroke()

    $scope.$watch 'window.innerWidth', ->
        canvas.width = window.innerWidth - 150
