const { Sequelize, DataTypes } = require("sequelize");
const db = require("../config/database");
const { Ingredient, IngredientType } = require('./Ingredient');

//Defining models (tables in database that can be accessed)
const RecipeType = db.define("recipeType", {
    type: {
        type: DataTypes.STRING,
        allowNull: false
      }
}, {
    timestamps: false,
    tableName: 'recipeTypes'
});

const Recipe = db.define("recipe", {
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    //brief tagline
    description: {
      type: DataTypes.STRING,
      allowNull: true
    },
    numSteps: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    prepTime: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    imageName: {
        type: DataTypes.STRING,
        allowNull: true
    },
    official: {
        type: DataTypes.BOOLEAN,
        allowNull: true
    },
    public: {
        type: DataTypes.BOOLEAN,
        allowNull: true
    }
 },
 {
    timestamps: false,
    tableName: 'recipes'
 });

 
 const RecipeInstruction = db.define("recipeInstruction", {
    stepIndex: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    stepBody: {
        type: DataTypes.STRING,
        allowNull: false
    }
 },
 {
    timestamps: false,
    tableName: 'recipeInstructions'
 });

 const RecipeIngredients = db.define("recipeIngredient", {
    recipeId: {
        type: DataTypes.INTEGER,
        references: {
            model: Recipe,
            key: 'id'
          }
    },
    ingredientId: {
        type: DataTypes.INTEGER,
        references: {
            model: Ingredient,
            key: 'id'
          }
    },
    quantity: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    qualifier: {
        type: DataTypes.STRING,
        allowNull: true
    }


 },
 {
    timestamps: false,
    tableName: 'recipeIngredients'
 })

 //Associations between models
 RecipeType.hasOne(Recipe);
 Recipe.belongsTo(RecipeType);

 Recipe.hasMany(RecipeInstruction);
 RecipeInstruction.belongsTo(Recipe);

 Ingredient.belongsToMany(Recipe, { through: RecipeIngredients });
 Recipe.belongsToMany(Ingredient, { through: RecipeIngredients });

 //SYNC
 //RecipeType.sync();
 //Recipe.sync();
 //RecipeInstruction.sync();

//Export models
module.exports = { RecipeType, Recipe, RecipeInstruction };