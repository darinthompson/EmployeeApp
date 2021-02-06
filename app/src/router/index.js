import Vue from "vue";
import Router from "vue-router";
import HelloWorld from "@/components/HelloWorld";

Vue.useContext(Router);

export default new Router({
  routes: [{ path: "/register", name: "Register", component: HelloWorld }],
});
