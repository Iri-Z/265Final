const { Sequelize, DataTypes } = require("sequelize");
const db = require("../config/database");

//Defining models (tables in database that can be accessed)
const Ingredient = db.define("ingredients", {
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    imageName: {
        type: DataTypes.STRING,
        allowNull: true
    },
    shelfStable: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    staple : {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    vegetarian: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    vegan: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    }
}, {
    timestamps: false,
 });

const IngredientType  = db.define("ingredientTypes", {
    description: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    timestamps: false,
 });

//Association
IngredientType.hasMany(Ingredient);
Ingredient.belongsTo(IngredientType);
 //SYNC
//Ingredient.sync();
//IngredientType.sync();

//Exports
module.exports = { Ingredient, IngredientType };