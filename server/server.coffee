express = require('express')
request = require('request')

BASE_URL = 'https://sprint.ly/api'
USERNAME = process.env.SPRINTLY_USERNAME
PASSWORD = process.env.SPRINTLY_API_KEY

app = express()
app.configure ->
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(express.static('public'))

app.get '/api/products', (req, res) ->
  request.get("#{BASE_URL}/products.json",
    auth:
      username: USERNAME
      password: PASSWORD
  ).pipe(res)

itemParams =
  auth:
    username: USERNAME
    password: PASSWORD
  qs:
    limit: 100
    status: 'someday,backlog,in-progress'

app.get '/api/products/:id/items', (req, res) ->
  request.get("#{BASE_URL}/products/#{req.params.id}/items.json", itemParams)
    .pipe(res)

app.listen(1234)
