const { Router } = require('express');
const userController = require('../controllers/userController');

const router = Router();

//Account Page
router.get('/user/:id', userController.account_get);
router.post('/user/:id', userController.account_post);

//Meal Planning Page
router.get('/mealplanner', userController.mealplanner_get);
router.post('/mealplanner', userController.mealplanner_post);

//Meal Plans
router.get('/plans', userController.plans_get);
router.post('/plans', userController.plans_post);

//Particular Meal Plan
router.get('/plans/:id', userController.plans_entry_get);
router.post('/plans/:id', userController.plans_entry_post);

module.exports = router;
