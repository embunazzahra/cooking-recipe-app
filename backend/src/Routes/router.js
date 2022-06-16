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

router.post("/recipebyid", [validateRecipeId], controllers.getRecipeByRecipeId);

router.post("/recipebyuser", [validateUserId], controllers.getRecipeByUserId);

router.post(
  "/checkRecipe",
  [validateUserId, validateRecipeId],
  controllers.checkRecipe
);

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

router.post("/getBookmark", [validateUserId], controllers.getBookmark);

router.delete(
  "/deleteBookmark",
  [validateRecipeId, validateUserId],
  controllers.deleteBookmark
);

router.post(
  "/checkBookmark",
  [validateRecipeId, validateUserId],
  controllers.checkBookmark
);
module.exports = router;
