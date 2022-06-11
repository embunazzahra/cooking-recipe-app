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
  }
  if (comparePassword(password, result.rows[0].password)) {
    return { message: "log in success", user: result.rows[0] };
  } else {
    return { message: "Wrong Password" };
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

async function addRecipe(recipe) {
  const { recipe_name, ingredient, direction, user_id } = recipe;
  const query = `INSERT INTO recipes(recipe_name,ingredient,direction,user_id) VALUES 
  ('${recipe_name}','${ingredient}','${direction}',${user_id});`;
  let result = await db.query(query);
  console.log(result);
  if (result.rowCount > 0) {
    return { message: "Success" };
  } else {
    return { message: "Failed" };
  }
}

module.exports = {
  login,
  register,
  getAllRecipes,
  addRecipe,
  getRecipeByRecipeId,
};
