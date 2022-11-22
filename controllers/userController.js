const Sequelize = require('sequelize');
const User = require('../models/User').User;
const Recipe = require('../models/Recipe').Recipe;
const { Plan, PlanRecipe } = require('../models/MealPlan');
const jwt = require('jsonwebtoken');
const Op = Sequelize.Op;

//handle User specific page errors
const handleErrors = (err) => {
    console.log(err.message, err.code);
};

//GET Requests
module.exports.account_get = async (req, res) => {
    const id = req.params.id;
    User.findByPk(id)
    .then((result) => {res.render('account', { User: result, title: 'Account' });})
    .catch((err) => console.log(err));
};

module.exports.mealplanner_get = (req, res) => {
    res.render('mealplanner', { title: 'Meal Planner' });
};

module.exports.plans_get = async (req, res) => {
    const user = req.cookies.user;
    jwt.verify(user, 'sdev 265', async (err, decodedToken) => {
        if (err) {
            console.log(err.message);
          }else {
            Plan.findAll({where: {userId:decodedToken.id}})
            .then((result) => {
                res.render('plans', { plans: result, title: 'Plans' });})
            .catch((err) => console.log(err));
          }
    })
};

module.exports.plans_entry_get = async (req, res) => {
    const id = req.params.id;
    let plan = await Plan.findOne({where: {id: id}});
    var numDays = plan.numDays;
    var numMeals = plan.numMeals;
    await PlanRecipe.findAll({where: {planId: id}})
    .then(async (result) => {
        await Plan.findRecipes(result)
        .then((meals) => {
            res.render('planDetails', { recipes: meals, numDays, numMeals, planId: id, title: 'Plan '+id });
        })
        .catch((err) => {
            console.log(err);
        });
    })
    .catch((err) => {
        console.log(err)
    });
};

//POST Requests
//Editing account info
module.exports.account_post = (req, res) => {
    //Update Account information
};

//Creates MEal plan and then sends user to that plan's page
module.exports.mealplanner_post = async (req, res) => {
    //Make a meal plan
    const { numDays, numMeals, breakfast, lunch, dinner, userId } = req.body;
    const mealsPicked = [];
    let recipeId = '';
    var  planId;

    //Create the plan in the database 
    try {
        const plan = await Plan.create({ numDays, numMeals, breakfast, lunch, dinner, userId });
        planId = plan.id;

        for (let i = 0; i < numDays; i++) {
            for (let j = 0; j < numMeals; j++) {
                //First three meals of the day in standard order
                if (j == 0 && breakfast === 'true') {
                    //Selcet a breakfast option
                    let meal = await Recipe.findOne({
                        where: { recipeTypeId: '1' },
                        order: Sequelize.literal('rand()')
                    });
                    mealsPicked.push(meal.id);
                    recipeId = meal.id;
                }
                else if (j == 1 && lunch === 'true') {
                    // Select a lunch option
                    let meal = await Recipe.findOne({
                        where: { recipeTypeId: '2' },
                        order: Sequelize.literal('rand()')
                    });
                    mealsPicked.push(meal.id);
                    recipeId = meal.id;
                }
                else if (j == 2 && dinner === 'true') {
                    //Select a dinner option
                    let meal = await Recipe.findOne({
                        where: { recipeTypeId: '3' },
                        order: Sequelize.literal('rand()')
                    });
                    mealsPicked.push(meal.id);
                    recipeId = meal.id;
                }
                //Randomize any other meals that do not fit this standard
                else {
                    if (breakfast === 'true' && lunch === 'true' && dinner === 'true') {
                        let meal = await Recipe.findOne({
                            where: { [Op.or]: [{ recipeTypeId: '1' }, { recipeTypeId: '2' }, { recipeTypeId: '3' }] },
                            order: Sequelize.literal('rand()')
                        });
                        mealsPicked.push(meal.id);
                        recipeId = meal.id;
                    } else if (breakfast === 'true') {
                        if (lunch === 'true') {
                            let meal = await Recipe.findOne({
                                where: { [Op.or]: [ {recipeTypeId : '1'}, {recipeTypeId: '2'} ] },
                                order: Sequelize.literal('rand()')
                            });
                            mealsPicked.push(meal.id);
                            recipeId = meal.id;
                        } else {
                            let meal = await Recipe.findOne({
                                where: { recipeTypeId: '1' },
                                order: Sequelize.literal('rand()')
                            });
                            mealsPicked.push(meal.id);
                            recipeId = meal.id;
                        }
                    } else if (lunch === 'true') {
                        if (dinner === 'true') {
                            let meal = await Recipe.findOne({
                                where: { [Op.or]: [ {recipeTypeId: '2'}, {recipeTypeId: '3'} ] },
                                order: Sequelize.literal('rand()')
                            });
                            mealsPicked.push(meal.id);
                            recipeId = meal.id;
                        } else {
                            let meal = await Recipe.findOne({
                                where: { recipeTypeId : '2' },
                                order: Sequelize.literal('rand()')
                            });
                            mealsPicked.push(meal.id);
                            recipeId = meal.id;
                        }
                    } else if (dinner === 'true') {
                        if (breakfast === 'true') {
                            let meal = await Recipe.findOne({
                                where: { [Op.or]: [ {recipeTypeId: '1'}, {recipeTypeId: '3'} ] },
                                order: Sequelize.literal('rand()')
                            });
                            mealsPicked.push(meal.id);
                            recipeId = meal.id;
                        } else {
                            let meal = await Recipe.findOne({
                                where: { recipeTypeId: '3'},
                                order: Sequelize.literal('rand()')
                            });
                            mealsPicked.push(meal.id);
                            recipeId = meal.id;
                        }
                    }
                    else {
                        console.log('Error');
                    }
                } 
    
                //Create PlanRecipe entry
                const plan_recipe = await PlanRecipe.create({recipeId, planId});
    
            }
        }
        console.log(mealsPicked);
        //Send to specific meal plan page
        res.status(201).json({ plan: planId });
        // Hold in Limbo until User decides to save the meal plan (maybe add)
    
        
    } catch (err) {
        const errors = handleErrors(err);
        res.status(400).json({ errors });       
    }

};

//These need to be clarified
module.exports.plans_post = (req, res) => {
    //Make edits to a meal Plan and save or discard them
};

module.exports.plans_entry_post = (req, res) => {
    //Make edits to a meal Plan and save or discard them
};