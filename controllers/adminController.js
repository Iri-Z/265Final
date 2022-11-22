const User = require('../models/User');
const jwt = require('jsonwebtoken');


//handle Admin specific errors 

const handleErrors = (err) => {
};

//GET Requests
module.exports.dashboard_get = (req, res) => {
    res.render('dashboard', {title: 'Dashboard'});
};

//POST Requests
module.exports.dashboard_post = (req, res) => {
    
};

//DELETE Requests