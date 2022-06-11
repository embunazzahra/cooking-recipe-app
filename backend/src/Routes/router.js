const express = require("express");
const router = express.Router();
const controllers = require("../Controllers/controller");
const {
  validateUsername,
  validateRecipeName,
  validateRecipeIngredient,
  validateRecipeDirection,
  validateUserId,
  validateRecipeId,
} = require("../Middleware/requestValidator");

router.get("/login", controllers.login);

router.post("/register", [validateUsername], controllers.register);

router.get("/recipes", controllers.getAllRecipes);

router.get("/recipebyid", [validateRecipeId], controllers.getRecipeByRecipeId);

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

router.put(
  "/updateRecipe",
  [
    validateRecipeId,
    validateRecipeName,
    validateRecipeIngredient,
    validateRecipeDirection,
  ],
  controllers.updateRecipe
);

module.exports = router;
