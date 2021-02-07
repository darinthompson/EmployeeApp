import Vue from "vue";
import Router from "vue-router";
import RegisterAccount from "../components/RegisterAccount";
import Home from "../components/Home";

Vue.use(Router);

export default new Router({
  routes: [
    { path: "/register", name: "Register", component: RegisterAccount },
    { path: "/", name: "Home", component: Home },
  ],
});
