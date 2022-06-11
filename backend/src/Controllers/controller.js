const services = require('../Services/services');
const { validationResult } = require('express-validator');


async function login(req,res){
    try{
        const result = await services.login(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function register(req,res){
    try{
        const errors = validationResult(req);
        if(!errors.isEmpty()){
            return res.status(400).json({errors: errors.array()});
        }else{
            const result = await services.register(req.body);
            res.json(result);
        }
    }catch(err){
        res.json({message: err.detail});
    }
}

module.exports = {
    login,
    register
}