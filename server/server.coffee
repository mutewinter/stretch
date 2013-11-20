express = require('express')
request = require('request')

BASE_URL = 'https://sprint.ly/api'

app = express()

app.configure ->
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(express.static('public'))
  app.use(express.cookieParser())
  app.use(express.cookieSession(
    secret: process.env.STRETCH_SESSION_SECRET
  ))

app.all '*', (req, res, next) ->
  username = req.get('Sprintly-User')
  apiKey = req.get('Sprintly-Api-Key')
  req.session.credentials =
    username: username
    password: apiKey

  if username and apiKey
    next()
  else
    next(new Error(401))

app.get '/api/products', (req, res) ->
  request.get("#{BASE_URL}/products.json",
    auth: req.session.credentials
  ).pipe(res)

itemParams =
  qs:
    limit: 100
    status: 'someday,backlog,in-progress'

app.get '/api/products/:id/items', (req, res) ->
  itemParams.auth = req.session.credentials
  request.get("#{BASE_URL}/products/#{req.params.id}/items.json", itemParams)
    .pipe(res)

app.listen(1234)

