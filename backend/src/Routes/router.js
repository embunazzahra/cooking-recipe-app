const express = require('express');
const router = express.Router();
const controllers = require('../Controllers/controller');
const { check } = require('express-validator');

router.get('/login', controllers.login);

router.post('/register', [check('username')
.notEmpty()
.custom(value => !/\s/.test(value))
.withMessage('No spaces are allowed in the username')],controllers.register);

module.exports = router;