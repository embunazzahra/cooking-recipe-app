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

router.post("/login", controllers.login);

router.post("/register", [validateUsername], controllers.register);

router.get("/recipes", controllers.getAllRecipes);

router.get("/recipebyid", [validateRecipeId], controllers.getRecipeByRecipeId);

router.get("/recipebyuser", [validateUserId], controllers.getRecipeByUserId);

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

router.delete("/deleteRecipe", [validateRecipeId], controllers.deleteRecipe);

router.post(
  "/addBookmark",
  [validateRecipeId, validateUserId],
  controllers.addBookmark
);

router.get("/getBookmark", [validateUserId], controllers.getBookmark);

router.delete(
  "/deleteBookmark",
  [validateRecipeId, validateUserId],
  controllers.deleteBookmark
);

module.exports = router;
