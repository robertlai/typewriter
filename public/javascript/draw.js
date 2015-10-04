// Generated by CoffeeScript 1.9.3
var stocksApp;

stocksApp = angular.module('drawingApp', []);

stocksApp.controller('drawingController', function($scope, $http, $window) {
  var CHARHEIGHT, SPACEWIDTH, absWidthCount, canvas, ctx, draw, drawLetter, heightCount, letters, resetCanvas;
  letters = {};
  $http.get('/letters').then(function(stuff) {
    return letters = stuff.data;
  });
  $scope.text = '';
  $scope.badness = 5;
  absWidthCount = 0;
  heightCount = 0;
  SPACEWIDTH = 30;
  CHARHEIGHT = 50;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  $scope.update = function() {
    var j, len, letter, ref, results;
    resetCanvas();
    ref = $scope.text;
    results = [];
    for (j = 0, len = ref.length; j < len; j++) {
      letter = ref[j];
      results.push(draw(letter.toLowerCase()));
    }
    return results;
  };
  resetCanvas = function() {
    absWidthCount = heightCount = 0;
    return ctx.clearRect(0, 0, canvas.width, canvas.height);
  };
  draw = function(letter) {
    if (absWidthCount > 1150) {
      absWidthCount = 0;
      heightCount++;
    }
    if (letter === '\n') {
      absWidthCount = 0;
      return heightCount++;
    } else if (letters[letter]) {
      drawLetter(letters[letter].points);
      return absWidthCount += letters[letter].width;
    } else {
      return absWidthCount += SPACEWIDTH;
    }
  };
  drawLetter = function(points) {
    var i, j, ref, x, xShift, y, yShift;
    ctx.beginPath();
    for (i = j = 0, ref = points.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      xShift = (Math.random() - 0.5) * $scope.badness;
      yShift = (Math.random() - 0.5) * $scope.badness;
      x = points[i][0] + xShift + absWidthCount + 25;
      y = points[i][1] + yShift + (heightCount * CHARHEIGHT);
      if (i === 0) {
        ctx.moveTo(x, y);
      } else {
        ctx.lineTo(x, y);
      }
    }
    return ctx.stroke();
  };
  return $scope.$watch('window.innerWidth', function() {
    return canvas.width = window.innerWidth - 150;
  });
});
