const { check } = require("express-validator");

module.exports = {
  validateUsername: check("username")
    .notEmpty()
    .withMessage("Username can't be empty")
    .isLength({ min: 3, max: 15 })
    .withMessage("Username required min 3 and max 15 char")
    .custom((value) => !/\s/.test(value))
    .withMessage("No spaces are allowed in the username"),
  validateRecipeName: check("recipe_name")
    .notEmpty()
    .withMessage("Recipe name can't be empty")
    .isLength({ min: 3, max: 100 })
    .withMessage("Recipe name required min 3 and max 100 char")
    .custom((value) => /^\s*\S[^]*$/.test(value))
    .withMessage("cannot contain only blankspaces"),
  validateRecipeIngredient: check("ingredient")
    .notEmpty()
    .withMessage("Recipe name can't be empty")
    .isLength({ min: 3, max: 100 })
    .withMessage("Recipe name required min 3 and max 100 char")
    .custom((value) => /^\s*\S[^]*$/.test(value))
    .withMessage("cannot contain only blankspaces"),
  validateRecipeDirection: check("direction")
    .notEmpty()
    .withMessage("Recipe name can't be empty")
    .isLength({ min: 3, max: 100 })
    .withMessage("Recipe name required min 3 and max 100 char")
    .custom((value) => /^\s*\S[^]*$/.test(value))
    .withMessage("cannot contain only blankspaces"),
  validateUserId: check("user_id")
    .notEmpty()
    .withMessage("User id name can't be empty")
    .isNumeric()
    .withMessage("User id should be a number"),
  validateRecipeId: check("recipe_id")
    .notEmpty()
    .withMessage("User id name can't be empty")
    .isNumeric()
    .withMessage("User id should be a number"),
};
