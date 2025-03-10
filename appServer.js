const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
//const db = require('./routes/db');
const path = require("path");

const app = express();
app.use(cors());
app.use(bodyParser.json());


app.use('/assets', express.static(path.join(__dirname, 'frontend/assets')));

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
    res.sendFile(path.join(__dirname, 'frontend/user/savings.html'));
});
app.get('/user/debt_control', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/user/debtManagement.html'));
});
app.get('/admin/dashboard', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/admin/dashboard.html'));
});
app.get('/admin/usermanagement', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/admin/users.html'));
});
app.get('/admin/usermanagement/single', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/admin/usersSingle.html'));
});
app.get('/admin/financial', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/admin/financial.html'));
});
app.get('/admin/transactions', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/admin/transactions.html'));
});
app.get('/admin/myprofile', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend/admin/profile.html'));
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
