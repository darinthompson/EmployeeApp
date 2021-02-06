<template>
  <div class="hello">
    <h1>{{ msg }}</h1>

    <input type="text" placeholder="First Name" v-model="firstName" />
    <input type="text" placeholder="Last Name" v-model="lastName" />
    <input type="email" placeholder="Email" v-model="email" />
    <input type="text" placeholder="Role" v-model="role" />
    <input type="text" placeholder="Username" v-model="username" />
    <input type="password" placeholder="Password" v-model="password" />
    <button @click="submit">Register</button>
  </div>
</template>

<script>
import authService from '../service/authService'
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  data () {
    return {
      firstName: '',
      lastName: '',
      email: '',
      role: '',
      username: '',
      password: ''
    }
  },
  methods: {
    async submit () {
      const response = await authService.register({
          firstName: this.firstName,
          lastName: this.lastName,
          email: this.email,
          role: this.role,
          username: this.username,
          password: this.password
        })
        console.log(response.data.msg);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
