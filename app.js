const express = require('express');
const { result } = require('lodash');
const { render } = require('ejs');
const jwt = require('jsonwebtoken');
const userRoutes = require('./routes/userRoutes');
const publicRoutes = require('./routes/publicRoutes');
const adminRoutes = require('./routes/adminRoutes');
const cookieParser = require('cookie-parser');
const { requireAuth, requireAdminAuth, checkUser} = require('./middleware/authMiddleware');
const db = require("./config/database");
const { User, AuthLevel } = require('./models/User');
const { Ingredient, IngredientType } = require('./models/Ingredient');
const { RecipeType, Recipe, RecipeInstruction } = require('./models/Recipe');
const { Plan, PlanRecipe } = require('./models/MealPlan');

//express app
const app = express();

//Port
const port = 3000;

//Test db connection and begin listening at port 3000
db.authenticate().then(() => {
    console.log('Connected to SQL database.');
 }).then((result) => app.listen(port, () => {console.log(`Server listening at http://localhost:${port}`);})).catch((err) => {
    console.error('Unable to connect to the database: ', err);
 });

//register view engine 
app.set('view engine', 'ejs');

//middleware & static files
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cookieParser());

//Routes
app.get('*', checkUser);
app.get('/', (req, res) => res.render('index', { title: 'Home Page' }));
app.use('/admin', requireAdminAuth, adminRoutes);
app.use('/account', requireAuth, userRoutes);
app.use(publicRoutes);

//LAST
app.use((req, res) => {
    res.status(404).render('404', { title: "404"});
  
  });

  //TEMP NOTES

  // app.get('/profile', (req, res) => {
//     res.render('profile', { title: 'Profile' });
// });

// app.get('/catalog', (req, res) => {
//     res.render('catalog', { title: 'Catalog' });
// });

// app.get('/catalog/:id', (req, res) => {
//   res.render('recipe', { title: 'Recipe Page' });
// });

// app.get('/mealPlan', (req, res) => {
//   res.render('mealPlan', { title: 'Meal Plans' });
// });

// app.get('/mealPlan/:id', (req, res) => {
//   res.render('planDetails', { title: 'Plan Details' });
// });

// app.get('/planner', (req, res) => {
//     res.render('planner', { title: 'Planner' });
// });

//  app.post('/planner', (req, res) => {
//   //What meal plan we're working with
//   let mealPlan ='';
//   let recipes = [];
//   //Insert plan into plans table
//   const sqlQuery = 'insert into plans(created, numMeals, numDays, breakfast, lunch, dinner) values( now(),' + req.body.numMeals + ',' + req.body.numDays + ',' + req.body.breakfast + ',' + req.body.lunch + ',' + req.body.dinner + ');';
//    db.query(sqlQuery, (err, res, fields) => {
//      if(err) {
//        throw err;
//      }
//      //Get the recipes for the plan
//      mealPlan =res.insertId;
//      const planForeign = '(select plan_code from plans where plan_code=' + res.insertId + ')';
//      const foreignStart = '(select recipe_code from recipes where recipe_code=';
//      const foreignEnd = ')'; 
//      let x = 1;
//      for (let i = 0; i <parseInt(req.body.numDays); i++) {
//       for (let j = 0; j < parseInt(req.body.numMeals); j++) {
//         //Add switch statement for the different recipe types
//         db.query('select recipe_code from recipes order by rand() limit 1;', (err, res, fields) => {
//           if(err) {
//             throw err;
//           }
//           let recipeForeign = foreignStart + res[0].recipe_code + foreignEnd;
//           //Save randomly selected recipes
//           db.query('insert into plans_recipes(plan_code, recipe_code, list_index) values('+ planForeign + ',' + recipeForeign + ',' + x+ ');', (err, res, fields) => {
//             if(err) {
//               throw err;
//             }
//           });
//           db.query('select * from recipes where recipe_code =' + res[0].recipe_code + ';', (err, res, fields) => {
//             if(err) {
//               throw err;
//             }
//             recipes.push(res);
//           });
//         });
//         x++;
//       }
//      }
//    });

//    console.log(recipes);
//    //location.replace('/mealPlan/'+mealPlan);
//    //res.render('planDetails', {plan: mealPlan, recipes: recipes, title: 'Meal Plan Page'});
   
// });

// //connect to mysql
// db.connect((err) => {
//   if (err) {
//     throw err;
//   }

//   console.log("MySql Connected");
// });

// const db = mysql.createConnection({
//     host: "127.0.0.1",
//     user: "root",
//     password: "password",
//     database: "sdev265",
//     port: "3306",
//   });

//Adding default database entries

// Recipe_type.create({
//     type: 'breakfast'
// });
// Recipe_type.create({
//     type: 'lunch'
// });
// Recipe_type.create({
//     type: 'dinner'
// });

// Recipe.create({
//     name: 'TestB1',
//     description: 'This is test recipe 1 for breakfast',
//     num_steps: 3,
//     prep_time: 20
// });

// Recipe.create({
//     name: 'TestB2',
//     description: 'This is test recipe 2 for breakfast',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestB3',
//     description: 'This is test recipe 3 for breakfast',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestL1',
//     description: 'This is test recipe 1 for lunch',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestL2',
//     description: 'This is test recipe 2 for lunch',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestL3',
//     description: 'This is test recipe 3 for lunch',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestD1',
//     description: 'This is test recipe 1 for dinner',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestD2',
//     description: 'This is test recipe 2 for dinner',
//     num_steps: 5,
//     prep_time: 30
// });
// Recipe.create({
//     name: 'TestD3',
//     description: 'This is test recipe 3 for dinner',
//     num_steps: 5,
//     prep_time: 30
// });