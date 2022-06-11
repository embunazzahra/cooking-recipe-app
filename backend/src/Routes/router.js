const express = require("express");
const router = express.Router();
const controllers = require("../Controllers/controller");
const {
  validateUsername,
  validateRecipeName,
  validateRecipeIngredient,
  validateRecipeDirection,
  validateUserId,
} = require("../Middleware/requestValidator");

router.get("/login", controllers.login);

router.post("/register", [validateUsername], controllers.register);

router.get("/recipes", controllers.getAllRecipes);

router.post(
  "/addRecipe",
  [
    validateRecipeName,
    validateRecipeIngredient,
    validateRecipeDirection,
    validateUserId,
  ],
  controllers.addRecipe
);

module.exports = router;
