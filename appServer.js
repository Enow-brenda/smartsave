const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const db = require('./models/db');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Sample Route
app.get('/', (req, res) => {
    res.send('Financial App API is Running');
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
