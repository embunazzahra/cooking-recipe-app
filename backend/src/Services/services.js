const { query } = require("express");
const db = require("../Config/database");
const {
  hashPassword,
  comparePassword,
  validateEmail,
  validatePassword,
} = require("../Helpers/helper");

async function login(user) {
  const { email, password } = user;
  const query = `SELECT * FROM users WHERE email = '${email}';`;
  const result = await db.query(query);
  if (result.rowCount == 0) {
    return { message: "account not found" };
  } else {
    let isMatch = await comparePassword(password, result.rows[0].password);
    if (isMatch) {
      return { message: "log in success", data: result.rows[0] };
    } else {
      return { message: "Wrong Password" };
    }
  }
}

async function register(user) {
  const { username, email, password } = user;
  if (await !validateEmail(email)) {
    message = "Email is invalid.";
    return { message: message };
  } else if ((await validatePassword(password)) !== true) {
    message = validatePassword(password)[0].message;
    return { message: message };
  } else {
    const query = `INSERT INTO users (username, email, password) VALUES ('${username}', '${email}', '${await hashPassword(
      password
    )}');`;

    let result = await db.query(query);

    if (result.rowCount > 0) {
      message = "Register Success.";
      return { message: message };
    } else {
      message = "Register Failed.";
      return { message: message };
    }
  }
}

async function getAllRecipes() {
  const query = `SELECT recipe_id,recipe_name,ingredient,direction,recipes.user_id,users.username
    FROM recipes
    INNER JOIN users
    ON recipes.user_id = users.user_id;`;
  let result = await db.query(query);
  if (result.rowCount == 0) {
    return { message: "No recipe exist." };
  } else {
    return { message: "success", data: result.rows };
  }
}

async function getRecipeByRecipeId(recipe) {
  const { recipe_id } = recipe;
  const query = `SELECT recipe_id,recipe_name,ingredient,direction,recipes.user_id,users.username
      FROM recipes
      INNER JOIN users
      ON recipes.user_id = users.user_id
      WHERE recipe_id = ${recipe_id};`;
  let result = await db.query(query);
  if (result.rowCount == 0) {
    return { message: "Recipe not found." };
  } else {
    return { message: "success", data: result.rows };
  }
}

async function getRecipeByUserId(recipe) {
  const { user_id } = recipe;
  const query = `
    SELECT recipes.recipe_id,recipes.recipe_name,recipes.user_id,users.username
    FROM recipes
    INNER JOIN users
    ON recipes.user_id = users.user_id
    WHERE recipes.user_id = ${user_id}`;
  let result = await db.query(query);
  if (result.rowCount == 0) {
    return { message: "You have no recipe" };
  } else {
    return { message: "success", data: result.rows };
  }
}

async function addRecipe(recipe) {
  const { recipe_name, ingredient, direction, user_id } = recipe;
  const query = `INSERT INTO recipes(recipe_name,ingredient,direction,user_id) VALUES 
  ('${recipe_name}','${ingredient}','${direction}',${user_id});`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return { message: "Success" };
  } else {
    return { message: "Failed" };
  }
}

async function updateRecipe(recipe) {
  const { recipe_id, recipe_name, ingredient, direction } = recipe;
  const query = `UPDATE recipes SET 
    recipe_name = '${recipe_name}',
    ingredient = '${ingredient}',
    direction = '${direction}'
    WHERE recipe_id = '${recipe_id}'`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return { message: "Success" };
  } else {
    return { message: "Failed" };
  }
}

async function deleteRecipe(recipe) {
  const { recipe_id } = recipe;
  const query = `DELETE FROM recipes WHERE recipe_id = '${recipe_id}'`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return { message: "Success" };
  } else {
    return { message: "Failed" };
  }
}

async function addBookmark(bookmark) {
  if (await isBookmarkAlreadyExist(bookmark)) {
    return { message: "It's already in your bookmarks" };
  } else {
    const { user_id, recipe_id } = bookmark;
    const query = `INSERT INTO saved_recipes(recipe_id,user_id)
      VALUES
      (${recipe_id},${user_id})`;
    let result = await db.query(query);
    if (result.rowCount > 0) {
      return { message: "Success" };
    } else {
      return { message: "Failed" };
    }
  }
}

async function isBookmarkAlreadyExist(bookmark) {
  const { user_id, recipe_id } = bookmark;
  const query = `SELECT * FROM saved_recipes WHERE recipe_id = ${recipe_id} AND user_id = ${user_id}`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return true;
  } else {
    return false;
  }
}

async function getBookmark(user) {
  const { user_id } = user;
  const query = `SELECT recipes.recipe_id,recipes.recipe_name,recipes.user_id,users.username
    FROM recipes
    INNER JOIN users
    ON recipes.user_id = users.user_id
    INNER JOIN saved_recipes
    ON recipes.recipe_id = saved_recipes.recipe_id
    WHERE saved_recipes.user_id = ${user_id}`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return { message: "success", data: result.rows };
  } else {
    return { message: "You have no bookmark" };
  }
}

async function deleteBookmark(bookmark) {
  const { user_id, recipe_id } = bookmark;
  const query = `DELETE FROM saved_recipes WHERE recipe_id = ${recipe_id} AND user_id = ${user_id}`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return { message: "Success" };
  } else {
    return { message: "Failed" };
  }
}

async function checkBookmark(bookmark) {
  const { user_id, recipe_id } = bookmark;
  const query = `SELECT * FROM saved_recipes WHERE recipe_id = ${recipe_id} AND user_id = ${user_id}`;
  let result = await db.query(query);
  if (result.rowCount > 0) {
    return { message: "Exist" };
  } else {
    return { message: "Not Exist" };
  }
}

async function getUserByUserId(user) {
  const { user_id } = user;
  const query = `SELECT * FROM users WHERE user_id = ${user_id}`;
  let result = await db.query(query);
  if (result.rowCount == 0) {
    return { message: "User not found." };
  } else {
    return { message: "success", data: result.rows[0] };
  }
}

module.exports = {
  login,
  register,
  getAllRecipes,
  addRecipe,
  getRecipeByRecipeId,
  getRecipeByUserId,
  updateRecipe,
  deleteRecipe,
  addBookmark,
  getBookmark,
  deleteBookmark,
  checkBookmark,
  getUserByUserId,
};
