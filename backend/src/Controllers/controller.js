const services = require("../Services/services");
const { validationResult } = require("express-validator");

async function login(req, res) {
  try {
    const result = await services.login(req.body);
    res.json(result);
  } catch (err) {
    res.json(err);
  }
}

async function register(req, res) {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ message: errors.array()[0].msg });
    } else {
      const result = await services.register(req.body);
      res.json(result);
    }
  } catch (err) {
    if (err.detail != null) {
      res.json({ message: err.detail });
    } else {
      res.json(err);
    }
  }
}

async function getAllRecipes(req, res) {
  try {
    const result = await services.getAllRecipes();
    res.json(result);
  } catch (err) {
    res.json(err);
  }
}

async function getRecipeByRecipeId(req, res) {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ message: errors.array()[0].msg });
    } else {
      const result = await services.getRecipeByRecipeId(req.body);
      res.json(result);
    }
  } catch (err) {
    if (err.detail != null) {
      res.json({ message: err.detail });
    } else {
      res.json(err);
    }
  }
}

async function addRecipe(req, res) {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ message: errors.array()[0].msg });
    } else {
      const result = await services.addRecipe(req.body);
      res.json(result);
    }
  } catch (err) {
    if (err.detail != null) {
      res.json({ message: err.detail });
    } else {
      res.json(err);
    }
  }
}
module.exports = {
  login,
  register,
  getAllRecipes,
  addRecipe,
  getRecipeByRecipeId,
};
