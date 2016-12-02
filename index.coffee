express = require 'express'
bodyparser = require 'body-parser'

config  = require('./config.json')

app = express()
port = config.port

app.use bodyparser.urlencoded
    extended: yes

app.post '/', (req, res) ->
    if req.body.token isnt config.token
        return res.status(404).send 'not found'
    coords = req.body.text.split("maps?q=")[1].split(">")[0].split(',')
    maps_picture_url = "https://maps.googleapis.com/maps/api/staticmap?center=#{coords[0]},#{coords[1]}&markers=#{coords[0]},#{coords[1]}&zoom=16&size=640x400&key=#{config.gmapsToken}"
    res.send
        text: "1"
        atachments:[
            {
                image_url: maps_picture_url
            }
        ]
app.listen port, () ->
    console.log "Slack Bot is listening on Port #{port}"
