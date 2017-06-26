const express = require('express')
const app = express()
const fs = require('fs')
app.get('/ping', function (req, res) {
  res.status(200).send()
})

app.get('/*', function (req, res) {
  fs.readFile('./secrets/' + req.params[0], function (err, data) {
	if(err) {
		return res.status(404).json({success:false, error:"secret not found"})
    }
    return res.status(200).set({'content-type':'text/plain'}).send(data)
  })

})

app.listen(9455)
