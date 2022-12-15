const User = require('../models/User').User;
const Recipe = require('../models/Recipe').Recipe;
const jwt = require('jsonwebtoken');
const fs = require("fs");
const { result } = require('lodash');
const { RecipeType } = require('../models/Recipe');

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
    res.redirect('/');
};

module.exports.catalog_get = (req, res) => {
    Recipe.findAll()
    .then((result) => {
        res.render('catalog', { title: 'Catalog', recipes: result});
    })
    .catch((err) => {
        console.log(errr);
        res.status(404).render('404', { message: null, title: "404"});
    });

};

module.exports.catalog_entry_get = async (req, res) => {
    //Submit which recipe is being accessed to the page to display correct details
    const id = req.params.id;
    console.log(id);
    await Recipe.findOne({where: {id: id}})
    .then(async (result) => {
        const type = await RecipeType.findByPk(result.recipeTypeId);
        const file = result.name.toLowerCase().replace(/ /g, "_");
        const Path = "./public/" + type.type + "/" + file +".pdf";
        if(result && fs.existsSync(Path)) {
            res.render('recipeDetails', {pdf: "/" + type.type + "/" + file +".pdf", title: `Recipe ${id}`});
        } else {
            res.status(404).render('404', { message: 'The recipe you are looking for does not exist', title: "404"});
        }   
    })
    .catch((err) => {
        res.status(404).render('404', { message: 'The recipe you are looking for does not exist', title: "404"});
    }    );

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
