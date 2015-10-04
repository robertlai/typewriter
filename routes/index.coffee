express = require('express')
router = express.Router()

router.get '/letters', (req, res, next) ->
    res.sendfile('./public/letters.json')

router.get '*', (req, res, next) ->
  res.render('index', title: 'Typewriter')


module.exports = router
