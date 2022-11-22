const User = require('../models/User').User;
const Recipe = require('../models/Recipe').Recipe;
const jwt = require('jsonwebtoken');
const { result } = require('lodash');

//handle errors on Public pages

const handleErrors = (err) => { 
    console.log(err.message, err.code);
};

//tokens
const maxAge = 3 * 24 * 60 *60;
const createUserTokens = (id) => {
    return jwt.sign({id}, 'sdev 265', {
        expiresIn: maxAge
    });
};
const createAdminTokens = (id) => {
    return jwt.sign({id}, 'sdev 265 admin', {
        expiresIn: maxAge
    });
};

//GET Requests 
module.exports.signup_get = (req, res) => {
    res.render('signup', {title: 'Sign Up'});
};

module.exports.login_get = (req, res) => {
    res.render('login', {title: 'Log In'});
};

module.exports.logout_get = (req, res) => {
    res.cookie('user', '', { maxAge: 1 });
    res.cookie('admin', '', { maxAge: 1 });
    res.redirect('/', {title: 'Home'});
};

module.exports.catalog_get = (req, res) => {
    Recipe.findAll()
    .then((result) => {
        res.render('catalog', { title: 'Catalog', recipes: result});
    })
    .catch((err) => {
        console.log(errr);
        res.redirect('/404', {title: '404'});
    });

};

module.exports.catalog_entry_get = (req, res) => {
    //Submit which recipe is being accessed to the page to display correct details
    res.render('recipeDetails', {title: 'Recipe'});

};


//POST Requests 
module.exports.signup_post = async (req, res) => {
    //Try Create User account or display errors

    const {fName, lName, email, phone, username, password} = req.body;
    AuthLevelId = 2;
    try{
        const user = await User.create({fName, lName, username, password, email, phone, AuthLevelId});
        const token = createUserTokens(user.id);
        res.cookie('user', token, {httpOnly: true, maxAge: maxAge*1000});
        res.status(201).json({user: user.id});
    }catch (err) {
        //console.log(err);
        const errors = handleErrors(err);
        res.status(400).json({ errors });
    }

};

module.exports.login_post = async (req, res) => {
    ///Try Find User account and save to token or display errors 
    const {username, password} = req.body;
    try {
        const user = await User.login(username, password);
        //Check if user is admin
        if (user.AuthLevelId == 1) {
            const token = createAdminTokens(user.id);
            res.cookie('admin', token, {httpOnly: true, maxAge: maxAge*1000});
            res.status(201).json({user: user.id});

        } else {
            const token = createUserTokens(user.id);
            res.cookie('user', token, {httpOnly: true, maxAge: maxAge*1000});
            res.status(201).json({user: user.id});
        }
        
    } catch (err) {
        const errors = handleErrors(err);
        res.status(400).json( { errors } );

    }
    
};

module.exports.catalog_post = async (req, res) => {

};

module.exports.catalog_entry_post = async (req, res) => {

};

// const {email, password } = req.body;
// try{
//     const user = await User.create({email, password});
//     const token = createTokens(user._id);
//     res.cookie('jwt', token, {httpOnly: true, maxAge: maxAge*1000});
//     res.status(201).json({user: user._id});
// }catch (err) {
//     //console.log(err);
//     const errors = handleErrors(err);
//     res.status(400).json({ errors });
// }

// // console.log(email, password);
// // res.send('new signup');

// const {email, password } = req.body;

//     try {
//         const user = await User.login(email, password);
//         const token = createTokens(user._id);
//         res.cookie('jwt', token, {httpOnly: true, maxAge: maxAge*1000});
//         res.status(200).json({user: user._id});
//     } catch (err) {
//         const errors = handleErrors(err);
//         res.status(400).json( { errors } );

//     }