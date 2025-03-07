const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const db = require('./models/db');

const app = express();
app.use(cors());
app.use(bodyParser.json());


app.use('/assets', express.static(path.join(__dirname, 'assets')));

// Set up routes to serve HTML files
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/landingPage.html'));
});

app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/login.html'));
});
app.get('/signup', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/signup.html'));
});
app.get('/user/dashboard', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/dashboard.html'));
});
app.get('/user/myexpenses', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/expenses.html'));
});
app.get('/user/education', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/lessons.html'));
});
app.get('/user/myprofile', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/profile.html'));
});
app.get('/user/savings', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/saving.html'));
});
app.get('/user/debt_control', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/debtManagement.html'));
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
