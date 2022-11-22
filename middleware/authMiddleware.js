const User = require('../models/User').User;
const jwt = require('jsonwebtoken');

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
    if (user) {
        jwt.verify(user, 'sdev 265', async (err, decodedToken) => {
            if (err) {
                console.log(err.message);
                res.locals.user = null;
                res.locals.admin = null;
                next();
            }else {
                let user = await User.findByPk(decodedToken.id);
                res.locals.user = user;
                res.locals.admin = null;
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
          next();
        } else {
          let admin = await User.findByPk(decodedToken.id);
          res.locals.user = null;
          res.locals.admin = admin;
          next();
        }
      })
    }
    else {
        res.locals.user = null;
        res.locals.admin = null;
        next();
    }
};




module.exports = { requireAuth, requireAdminAuth, checkUser};