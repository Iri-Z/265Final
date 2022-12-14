const User = require('../models/User').User;
const jwt = require('jsonwebtoken');
const { result } = require('lodash');
const { Recipe } = require('../models/Recipe');
const FavoriteRecipes = require('../models/Recipe').FavoriteRecipes;

//require user to be logged in
const requireAuth = (req, res, next) => {
  const token = req.cookies.user;

  // check json web token exists & is verified
  if (token) {
    jwt.verify(token, 'sdev 265', (err, decodedToken) => {
      if (err) {
        console.log(err.message);
        res.redirect('/login');
      } else {
        next();
      }
    });
  } else {
    res.redirect('/login');
  }
};

const requireAdminAuth = (req, res, next) => {
  const token = req.cookies.admin;

  // check json web token exists & is verified
  if (token) {
    jwt.verify(token, 'sdev 265 admin', (err, decodedToken) => {
      if (err) {
        console.log(err.message);
        res.redirect('/login');
      } else {
        next();
      }
    });
  } else {
    res.redirect('/login');
  }

}

//Submit User info to the ejs files
const checkUser = (req, res, next) => {
    const user = req.cookies.user;
    const admin = req.cookies.admin;
    let favs =[];
    let favNames =[];
    if (user) {
        jwt.verify(user, 'sdev 265', async (err, decodedToken) => {
            if (err) {
                console.log(err.message);
                res.locals.user = null;
                res.locals.admin = null;
                res.locals.favs = null;
                res.locals.favNames = null;
                next();
            }else {
                let [user, favObjects] = await Promise.all([
                  User.findByPk(decodedToken.id),
                  FavoriteRecipes.findAll({ where: {userId: decodedToken.id}, attributes: ['recipeId']})
                ]); 
                for(let i = 0; i < favObjects.length; i++) {
                  favs.push(favObjects[i].recipeId);
                  await Recipe.findByPk(favObjects[i].recipeId)
                    .then((result) => {favNames.push(result.name)});
                }
                res.locals.user = user;
                res.locals.admin = null;
                res.locals.favs = favs;
                res.locals.favNames = favNames;
                next();
            }
        });
    }
    else if (admin) {
      jwt.verify(admin, 'sdev 265 admin', async (err, decodedToken) => {
        if (err) {
          console.log(err.message);
          res.locals.user = null;
          res.locals.admin = null;
          res.locals.favs = null;
          res.locals.favNames = null;
          next();
        } else {
          let admin = await User.findByPk(decodedToken.id);
          res.locals.user = null;
          res.locals.admin = admin;
          res.locals.favs = null;
          res.locals.favNames = null;
          next();
        }
      })
    }
    else {
        res.locals.user = null;
        res.locals.admin = null;
        res.locals.favs = null;
        next();
    }
};

module.exports = { requireAuth, requireAdminAuth, checkUser};