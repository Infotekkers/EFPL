import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import AdminLoginView from "../views/AdminLoginView.vue";
import PageNotFoundComponent from "../components/PageNotFoundComponent.vue";
import SettingsView from "../views/SettingsView.vue";
import AdminUserList from "../views/AdminUserList.vue";
const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },
  // admin login page
  {
    path: "/admin/login",
    name: "admin-login",
    component: AdminLoginView,
  },
  // settings page
  {
    path: "/admin/settings",
    name: "settings",
    component: SettingsView,
  },
  // admin user list
  {
    path: "/admin/adminUsers",
    name: "admin-users",
    component: AdminUserList,
  },
  // 404 page should always be the last route add routes above this
  {
    path: "/:catchAll(.*)",
    name: "pagenotfound",
    component: PageNotFoundComponent,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
