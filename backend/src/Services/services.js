const db = require('../Config/database');
const {hashPassword,
    comparePassword,
    validateEmail,
    validatePassword} = require('../Helpers/helper');

async function login(user) {
    const { email, password } = user;
    const query = `SELECT * FROM users WHERE email = '${email}';`
    const result = await db.query(query);
    if(result.rowCount == 0) {
        return {message: 'account not found'};
    }
    if(comparePassword(password,result.rows[0].password)){
            console.log(comparePassword(password,result.rows[0].password));
            return {message: 'log in success', user: result.rows[0]};
    }else{
        return {message: 'Wrong Password'};
    }
}

async function register(user) {
    const { username, email, password } = user;
    console.log(user);
    if(await !validateEmail(email)){
        message = 'Email is invalid.';
        return {message: message};
    }else if(await validatePassword(password) !== true){
        message = validatePassword(password)[0].message;
        return {message: message};
    }else{
        const query = `INSERT INTO users (username, email, password) VALUES ('${username}', '${email}', '${await hashPassword(password)}');`;

        let result = await db.query(query);

        if (result.rowCount>0){
            message = 'Register Success.';
            return {message: message};
        }else{
            message = 'Register Failed.';
            return {message: message};
        }
    }
}

// let data = register({username:'fifu', email: 'hahyu@gaja.com',password:'tetoS90sa'});
// data.then(result=>console.log(result));

module.exports = {
    login,
    register
}