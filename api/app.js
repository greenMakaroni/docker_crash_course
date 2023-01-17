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
        },
        {
        "id":"3",
        "data": "and another change",
        },
        {
            "id": "4",
            "data": "and another change to the source code"
        },
        {
            "id":"5",
            "data": "test data to see how volumes work"
        },
        {
            "id":"6",
            "data": "test data to see how volumes work"
        },
        {
            "id":"7",
            "data": "NANADAJME HOKAGE"
        },
        {
            "id":"8",
            "data": "Orochimaru Sama"
        }
        
])
console.log("get happened")
})

app.get('/kappa', (req, res) => {
    res.json([
        {
            "id":"1",
            "data":"kappa"
        },
        {
            "id":"2",
            "data": "change to the file"
        }
    ])
})

app.listen(4000, () => {
    console.log("Server running on port 4000")
})