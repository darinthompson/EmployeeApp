const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { check, validationResult } = require("express-validator/check");
const Account = require("../models/Account");
const Employee = require("../models/Employee");
const dbService = require("../config/db");

var employeeId = 4;

router.post(
  "/",
  [
    check("username", "Username is required").not().isEmpty(),
    check("password", "Please enter a valid password").not().isEmpty(),
    check("role", "Please select a role for this account").not().isEmpty(),
    check("firstName", "Please enter the first name of the account owner")
      .not()
      .isEmpty(),
    check("lastName", "Please enter the last name of the account owner")
      .not()
      .isEmpty(),
    check("email", "Please enter a valid email").not().isEmpty(),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        errors: errors.array(),
      });
    }

    const { username, password, role, firstName, lastName, email } = req.body;

    try {
      dbConnection = dbService.getDbServiceInstance();
      let id = await dbConnection.getAccountsByUsername(username);
      if (-1 == id) {
        return res.status(400).json({ msg: "This username is already in use" });
      }

      let newEmployee = new Employee(firstName, lastName, email);
      let checkId = await dbConnection.getEmployeeIdByEmail(newEmployee.email);
      if (checkId[0] !== -1) {
        return res.status(400).json({ msg: "Email already in use" });
      }
      await dbConnection.createEmployee(newEmployee);

      let sqlEmployeeId = await dbConnection.getEmployeeIdByEmail(
        newEmployee.email
      );

      let roleId = role === "employee" ? 1 : 2;

      let account = new Account(username, password, sqlEmployeeId, roleId);
      const salt = await bcrypt.genSalt(10);
      account.password = await bcrypt.hash(password, salt);

      dbConnection.createAccount(account);
      res.status(200).json({ msg: "Account created successfully" });
    } catch (error) {
      console.log(error);
    }
  }
);

module.exports = router;
