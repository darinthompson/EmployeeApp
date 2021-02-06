

module.exports = class Account {
    constructor(username, password, employeeId, roleId){
        this.username = username;
        this.password = password;
        this.employeeId = employeeId;
        this.roleId = roleId;
    }
}