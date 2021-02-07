const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { check, validationResult } = require("express-validator/check");
const Account = require("../models/Account");
const Employee = require("../models/Employee");
const dbService = require("../config/db");

router.post(
  "/create",
  [
    check("description", "Job description is required").not().isEmpty(),
    check("employeeId", "Please select an employee for this job")
      .not()
      .isEmpty(),
    check("locationId", "Please select a location for this job")
      .not()
      .isEmpty(),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({ errors: errors.array() });
    }

    const { description, employeeId, locationId } = req.body;

    const dbConnection = dbService.getDbServiceInstance();

    const result = await dbConnection.createJob(
      description,
      employeeId,
      locationId
    );

    res.status(200).json({ msg: result });
  }
);

router.post("/update", async (req, res) => {
  const { jobId } = req.body;

  const dbConnection = dbService.getDbServiceInstance();

  const response = await dbConnection.completeJob(jobId);

  res.status(200).json({msg: response});
});

module.exports = router;
