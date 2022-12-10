const { Sequelize, DataTypes } = require("sequelize");
const db = require("../config/database");
const { User, AuthLevel } = require('./User');
const { RecipeType, Recipe, RecipeInstruction, RecipeIngredients, FavoriteRecipes } = require('./Recipe');
const { Ingredient } = require("./Ingredient");

//Defining models (tables in database that can be accessed)

const Plan = db.define("plans", {
    numMeals: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    numDays: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    breakfast: {
        type: DataTypes.BOOLEAN,
        allowNull: true
    },
    lunch: {
        type: DataTypes.BOOLEAN,
        allowNull: true
    },
    dinner: {
        type: DataTypes.BOOLEAN,
        allowNull: true
    },

});

const PlanRecipe = db.define('planRecipes', {
    recipeId: {
        type: DataTypes.INTEGER,
        references: {
            model: Recipe,
            key: 'id'
          }
    },
    planId: {
        type: DataTypes.INTEGER,
        references: {
            model: Plan,
            key: 'id'
          }
    }
}, {
    timestamps: false,
 });


//Associations
Plan.belongsToMany(Recipe, {through: 'PlanRecipe' });
Recipe.belongsToMany(Plan, {through: 'PlanRecipe' });

User.hasMany(Plan);
Plan.belongsTo(User);

//Functions

Plan.findRecipes = async function (recipes) {
    let meals = [];
    for (recipe of recipes) {
        let meal = await Recipe.findOne({where: {id: recipe.recipeId}});
        meals.push(meal); 
    }
    return meals;
};

 Plan.findIngredients = async function (recipes) {
    let ingredientList = [];
    let ingredientNames = [];
    for (recipe of recipes) {
        let ingredients = await RecipeIngredients.findAll({where: {recipeId: recipe.id}});
        for (ingredient of ingredients) {
            await Ingredient.findOne({where: {id: ingredient.ingredientId}})
            .then((result) => {
                ingredientNames.push(result.name);
                ingredientList.push(ingredient);
            })
        }
    }
    return [ingredientList, ingredientNames];
 };

 //SYNC
 //Plan.sync();
 //PlanRecipe.sync();

//Exports 
module.exports = { Plan, PlanRecipe };