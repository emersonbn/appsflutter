const express = require('express');
const router = express.Router();
const db = require('../config/database');
const User = require('../models/User');


router.get('/', (req,res) => 
User.findAll()
.then(users => {
    console.log(users)
    //res.sendStatus(200);
    res.send(users);
} )
    .catch(err => {console.log(err) })

);

router.get('/add', (req,res) =>{
    const data = {
        firstName:'Emerson',
        lastName:'Nascimento',
        email:'emerson_ka@hotmail.com'
    }

    let {firstName, lastName, email} = data;

    User.create({
        firstName,
        lastName,
        email
    })
    .then(user =>res.redirect('/users'))
    .catch(err => console.log(err));
})
module.exports = router;