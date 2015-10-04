
stocksApp = angular.module('drawingApp', [])


stocksApp.controller 'drawingController', ($scope) ->

    $scope.text = ''
    globX = 30
    globY = 50
    CHARWIDTH = 30
    CHARHEIGHT = 50
    SPACEWIDTH = 10
    BADNESS = 2

    $scope.update = ->
        points = [[20,30],[10,30],[10,45],[20,45],[20,30],[20,57]]
        drawLetter(points)

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

    drawLetter = (points) ->

        canvasElement = document.getElementById('canvas')
        ctx = canvasElement.getContext('2d')

        for i in [0...points.length]
            xShift = (Math.random() - 0.5) * BADNESS
            yShift = (Math.random() - 0.5) * BADNESS
            points[i][0] += xShift + globX
            points[i][1] += yShift + globY

            if i == 0
                ctx.moveTo(points[i][0], points[i][1])
            else
                ctx.lineTo(points[i][0], points[i][1])
        
        ctx.stroke()