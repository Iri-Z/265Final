const express = require('express');
const { result } = require('lodash');
const { render } = require('ejs');
const userRoutes = require('./routes/userRoutes');
const publicRoutes = require('./routes/publicRoutes');
const adminRoutes = require('./routes/adminRoutes');
const cookieParser = require('cookie-parser');
const { requireAuth, requireAdminAuth, checkUser} = require('./middleware/authMiddleware');
const db = require("./config/database");
const { User, AuthLevel } = require('./models/User');
const { Ingredient, IngredientType } = require('./models/Ingredient');
const { RecipeType, Recipe, RecipeInstruction, RecipeIngredients } = require('./models/Recipe');
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
    res.status(404).render('404', { message: null, title: "404"});
  });