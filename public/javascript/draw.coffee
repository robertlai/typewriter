stocksApp = angular.module('drawingApp', [])


stocksApp.controller 'drawingController', ($scope, $window) ->

    letters = {
        "a":{
            "width": 30,
            "points":[[21,24],[10,24],[4,35],[10,43],[20,36],[23,24],[25,42]]
            },
        "b":{
            "width": 30,
            "points":[[5,4],[5,24],[5,43],[5,27],[18,24],[24,35],[16,43],[5,40]]
            },
        "c":{
            "width": 30,
            "points":[[21,24],[10,24],[5,34],[11,43],[23,42]]
            },
        "d":{
            "width": 30,
            "points":[[22,26],[11,26],[6,33],[11,43],[20,42],[22,31],[22,18],[22,3],[22,18],[22,31],[24,44]]
            },
        "e":{
            "width": 30,
            "points":[[6,32],[21,33],[23,25],[11,25],[5,35],[10,43],[24,43]]
            },
        "f":{
            "width": 30,
            "points":[[22,15],[18,6],[9,11],[9,23],[9,35],[9,44],[9,35],[4,26],[18,26]]
            },
        "g":{
            "width": 30,
            "points":[[24,26],[10,24],[4,35],[10,43],[20,39],[24,24],[24,38],[24,54],[20,66],[11,71],[4,60]]
            },
        "h":{
            "width": 30,
            "points":[[5,3],[5,18],[5,31],[5,44],[5,31],[15,26],[23,32],[24,45]]
            },
        "i":{
            "width": 30,
            "points":[[14,21],[14,32],[14,44]]
            },
        "j":{
            "width": 30,
            "points":[[23,29],[23,42],[23,56],[21,66],[10,67],[6,58]]
            },
        "k":{
            "width": 30,
            "points":[[5,4],[6,18],[6,29],[6,44],[6,35],[20,26],[6,35],[16,37],[22,45]]
            },
        "l":{
            "width": 30,
            "points":[[13,4],[13,16],[13,28],[18,42]]
            },
        "m":{
            "width": 40,
            "points":[[5,26],[5,35],[5,44],[5,35],[11,27],[19,32],[19,44],[19,32],[26,28],[33,34],[33,44]]
            },
        "n":{
            "width": 30,
            "points":[[5,23],[5,35],[5,44],[5,30],[15,24],[22,31],[22,44]]
            },
        "o":{
            "width": 30,
            "points":[[14,22],[5,28],[7,40],[17,43],[23,35],[22,26],[14,22]]
            },
        "p":{
            "width": 30,
            "points":[[5,25],[5,39],[5,54],[5,70],[5,54],[5,39],[5,28],[16,26],[23,33],[20,42],[13,44],[5,41]]
            },
        "q":{
            "width": 30,
            "points":[[19,28],[9,26],[4,33],[8,42],[16,41],[19,35],[19,26],[19,39],[19,54],[19,69],[25,65]]
            },
        "r":{
            "width": 30,
            "points":[[5,23],[5,34],[5,44],[5,30],[13,26],[21,29]]
            },
        "s":{
            "width": 30,
            "points":[[20,22],[11,20],[5,26],[11,32],[19,34],[20,42],[12,44],[4,40]]
            },
        "t":{
            "width": 30,
            "points":[[21,18],[5,18],[9,16],[9,4],[9,16],[9,27],[10,38],[19,43]]
            },
        "u":{
            "width": 30,
            "points":[[5,25],[5,37],[1,43],[19,41],[23,33],[23,25],[23,37],[24,44]]
            },
        "v":{
            "width": 30,
            "points":[[5,25],[9,35],[14,44],[20,35],[24,25]]
            },
        "w":{
            "width": 40,
            "points":[[5,25],[9,35],[13,44],[17,36],[20,29],[24,37],[27,44],[31,35],[35,25]]
            },
        "x":{
            "width": 30,
            "points":[[5,25],[13,35],[21,44],[13,35],[21,25],[13,35],[5,44]]
            },
        "y":{
            "width": 30,
            "points":[[5,25],[5,37],[13,44],[21,39],[21,25],[22,44],[22,55],[21,67],[13,71],[6,62]]
            },
        "z":{
            "width": 30,
            "points":[[5,25],[21,25],[13,35],[5,44],[21,44]]
            },
        " ":{
            "width": 30,
            "points":[]
            },
        ".":{
            "width": 30,
            "points":[[12,43],[13,44],[14,43],[13,42]]
            }
        ",":{
            "width": 30,
            "points":[[14,43],[13,42],[12,43],[13,44],[14,43],[13,46]]
            }
        "!":{
            "width": 30,
            "points":[[14,5],[10,9],[11,24],[12,38],[10,41],[12,44],[15,43],[14,39],[13,36],[18,22],[18,8],[14,5]]
            }
        "?":{
            "width": 30,
            "points":[[4,14],[8,6],[16,6],[21,10],[21,18],[14,25],[13,37],[11,39],[14,42],[16,40],[13,37]]
            }
        "#":{
            "width": 30,
            "points":[[10,19],[9,25],[4,25],[9,25],[6,35],[3,35],[6,35],[5,41],[6,35],[17,35],[16,41],[17,35],[22,35],[17,35],[19,25],[23,25],[19,25],[21,20],[19,25],[9,25]]
        }
    }
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
