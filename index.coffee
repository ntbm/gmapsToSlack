express = require 'express'
bodyparser = require 'body-parser'

config  = require('./config.json')

app = express()
port = config.port

app.use bodyparser.urlencoded
    extended: yes

app.post '/', (req, res) ->
    console.log req.body
    res.send 'success'
app.listen port, () ->
    console.log "Slack Bot is listening on Port #{port}"
