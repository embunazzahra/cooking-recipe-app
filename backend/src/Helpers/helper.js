const bcrypt = require("bcryptjs");
var passwordValidator = require("password-validator");

async function hashPassword(password) {
  const hashedPassword = await bcrypt.hash(password, 8);
  return hashedPassword;
}

async function comparePassword(password, hashedPassword) {
  return await bcrypt.compare(password, hashedPassword);
}

function validateEmail(emailAdress) {
  let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if (emailAdress.match(regexEmail)) {
    return true;
  } else {
    return false;
  }
}

function validatePassword(password) {
  var schema = new passwordValidator();
  schema
    .is()
    .min(8) // Minimum length 8
    .is()
    .max(20) // Maximum length 20 (include)
    .has()
    .uppercase() // Must have uppercase letters
    .has()
    .lowercase() // Must have lowercase letters
    .has()
    .digits(1) // Must have digit
    .has()
    .not()
    .spaces();
  return schema.validate(password)
    ? true
    : schema.validate(password, { details: true });
}

// console.log(validatePassword("Babijagsk1ssssssssssa"));

module.exports = {
  hashPassword,
  comparePassword,
  validateEmail,
  validatePassword,
};
