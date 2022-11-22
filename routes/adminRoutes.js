const { Router } = require('express');
const adminController = require('../controllers/adminController');

const router = Router();

//Dashboard
router.get('/dashboard', adminController.dashboard_get);
router.post('/dashboard', adminController.dashboard_post);


//Edit Catalog page?? 

//Create new 

module.exports = router;