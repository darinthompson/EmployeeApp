const mySql = require("mysql");
const config = require("config");
let instance = null;

const connection = mySql.createConnection({
  host: config.get("sqlHost"),
  user: config.get("sqlUser"),
  password: config.get("sqlPassword"),
  database: config.get("sqlDatabase"),
});

connection.connect((err) => {
  if (err) {
    console.log(err.message);
  }
  console.log("db connected");
});

class DbService {
  static getDbServiceInstance() {
    return instance ? instance : new DbService();
  }

  async getAccountsByUsername(username) {
    try {
      const response = await new Promise((resolve, reject) => {
        let query = `select * from account where username = '${username}'`;
        connection.query(query, (err, results) => {
          if (err) {
            reject(new Error(err.message));
          }
          if (results.length == 0) {
            console.log("No existing account found");
            resolve([{ id: -1 }]);
          } else {
            console.log(`Existing account found ID: ${results[0].id}`);
            resolve(results);
          }
        });
      });

      return response;
    } catch (error) {
      console.log(error);
    }
  }

  async createEmployee(Employee) {
    try {
      const response = await new Promise((resolve, reject) => {
        let sql = `insert into employee(first_name, last_name, email) VALUES ('${Employee.firstName}','${Employee.lastName}','${Employee.email}')`;
        connection.query(sql, (error, result) => {
          if (error) {
            reject(new Error(error.message));
          }
          resolve(result);
        });
      });
      return response;
    } catch (error) {
      console.log(error);
    }
  }

  async getEmployeeIdByEmail(email) {
    try {
      const response = await new Promise((resolve, reject) => {
        let sql = `select id from employee where email = '${email}'`;
        connection.query(sql, (error, results) => {
          if (error) {
            reject(new Error(error.message));
          }

          if (results.length == 0) {
            resolve([{ id: -1 }]);
          } else {
            resolve(results);
          }
        });
      });
      return response[0].id;
    } catch (error) {
      console.log(error);
    }
  }

  async createAccount(Account) {
    try {
      const response = await new Promise((resolve, reject) => {
        let sql = `insert into account(username, password, role_id, employee_id) VALUES ('${Account.username}', '${Account.password}', ${Account.roleId}, ${Account.employeeId})`;
        connection.query(sql, (error, result) => {
          if (error) {
            reject(new Error(error.message));
          }
          resolve(result);
        });
      });
      console.log(response);
      return response;
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = DbService;
