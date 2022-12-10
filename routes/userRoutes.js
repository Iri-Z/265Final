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
router.post('/favoriterecipes', userController.add_fav_post);
router.delete('/favoriterecipes', userController.delete_fav);


//Particular Meal Plan
router.get('/plans/:id', userController.plans_entry_get);
router.post('/plans/:id', userController.plans_entry_post);
router.get('/list/:id', userController.list_entry_get);
router.post('/list/:id', userController.list_entry_post);
router.delete('/plans/:id',  userController.plans_delete);
router.delete('/', userController.delete_redirect);

module.exports = router;
