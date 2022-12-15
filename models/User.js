const bcrypt = require('bcrypt');
const { Sequelize, DataTypes } = require("sequelize");
const db = require("../config/database");

const User = db.define("users", {
    fName: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Please enter your first name'
        }
    }},
    lName: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Please enter your last name'
        }
    }
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notNull: {
                msg: 'Please enter a password'
              }
        }
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notNull: {
              msg: 'Please enter your email'
            }
    }},
    phone: {
        type: DataTypes.STRING,
        allowNull: true
    }
 }, {
    timestamps: false,
    hooks: {
        beforeCreate: async (user) => {
            if (user.password) {
             const salt = await bcrypt.genSaltSync(10, 'a');
             user.password = bcrypt.hashSync(user.password, salt);
            }
           },
           beforeUpdate:async (user) => {
            if (user.password) {
             const salt = await bcrypt.genSaltSync(10, 'a');
             user.password = bcrypt.hashSync(user.password, salt);
            }
           }
          },
          instanceMethods: {
           validPassword: (password) => {
            return bcrypt.compareSync(password, this.password);
           }
          }
 });

 const AuthLevel = db.define("AuthLevels", { 
    description: {
        type: DataTypes.STRING,
        allowNull: true
    }
 }, {
    timestamps: false,
 });

 //Associations
 AuthLevel.hasOne(User);
 User.belongsTo(AuthLevel);

 //Functions
 User.login = async function (username, password) {
    const user = await this.findOne( {where: {username}});
    if (user) {
        const auth = await bcrypt.compare(password, user.password);
        if (auth) {
            return user;
        }
        throw Error ('Incorrect password');
    }
    throw Error ('Incorrect username');

 };

//SYNC
//User.sync();
//AuthLevel.sync();
 
module.exports = { User, AuthLevel };  