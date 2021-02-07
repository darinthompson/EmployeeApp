<template>
  <div>
    <h1>Maitence Tracking</h1>
    <div>
      <input type="text" placeholder="Username" v-model="username" />
      <br />
      <input type="password" placeholder="Password" v-model="password" />
      <br />
      <button @click="submit">Login</button>
      <button @click="navigateTo('Register')">Create Account</button>
    </div>
  </div>
</template>

<script>
import authService from "../service/authService";
export default {
  name: "Home",
  data() {
    return {
      username: '',
      password: ''
    };
  },
  methods: {
    async submit() {
      const response = await authService.logIn({
        username: this.username,
        password: this.password,
      })
      console.log(response.data[0].ID + response.data[0].USERNAME);
    },
    navigateTo(route) {
      this.$router.push(route);
    }
  },
};
</script>


<style scoped>
</style>