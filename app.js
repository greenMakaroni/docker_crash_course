const express = require('express')
const cors = require('cors')

const app = express()

app.use(cors())

app.get('/', (req, res) => {
    res.json([
        {
        "id":"1",
        "data": "Data of id 1"
        },
        {
        "id":"2",
        "data": "Data of id2"
        }
])
})

app.get('/kappa', (req, res) => {
    res.json([
        {
            "id":"1",
            "data":"kappa"
        }
    ])
})

app.listen(3000, () => {
    console.log("Server running on port 3000")
})