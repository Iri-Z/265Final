const { Router } = require('express');
const publicController = require('../controllers/publicController');

const router = Router();

//Account pages available to public
router.get('/signup', publicController.signup_get);
router.post('/signup', publicController.signup_post);
router.get('/login', publicController.login_get);
router.post('/login', publicController.login_post);
router.get('/logout', publicController.logout_get);

//Recipe Catalog 
router.get('/catalog', publicController.catalog_get);
router.post('/catalog', publicController.catalog_post);
router.get('/catalog/:id', publicController.catalog_entry_get);
router.post('/catalog/:id', publicController.catalog_entry_post);

module.exports = router;