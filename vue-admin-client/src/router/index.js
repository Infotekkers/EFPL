import { createRouter, createWebHistory } from "vue-router";
import Main from "../views/MainView.vue";

const routes = [
  {
    path: "/admin",
    name: "admin",
    component: Main,
    beforeEnter(to, from, next) {
      // get the currently signed in admin
      const currentAdmin = JSON.parse(
        window.localStorage.getItem("currentAdmin")
      );

      if (currentAdmin && currentAdmin.token) {
        next();
      } else {
        next("/login");
      }
    },
    children: [
      // Home
      {
        path: "home",
        name: "Home",
        component: () => import("../views/HomeView.vue"),
      },

      // Fixtures
      {
        path: "fixtures",
        name: "Fixtures",
        component: () => import("../views/FixturesView.vue"),
        // component: () => import("../components/FixturesComponent.vue"),
      },

      // Teams
      {
        path: "teams",
        name: "Teams",
        component: () => import("../views/TeamsView.vue"),
      },

      // Settings
      {
        path: "settings",
        name: "settings",
        component: () => import("../views/SettingsView.vue"),
      },

      {
        path: "players",
        name: "Players",
        component: () => import("../views/PlayersView.vue"),
      },

      /*

      */

      // settings page

      // Fixture Routes

      // {
      //   path: "fixture/detail",
      //   name: "Fixture Detail",
      //   component: FixtureDetail,
      // },
    ],
  },

  // admin login page
  {
    path: "/login",
    name: "admin-login",
    component: () => import("../views/AdminLoginView.vue"),
  },

  // forgot password page
  {
    path: "/forgotpassword",
    name: "forgot-password",
    component: () => import("../components/ForgotPasswordComponent.vue"),
  },

  // reset password
  {
    path: "/resetPassword/:token",
    name: "reset-password",
    component: () => import("../components/ResetPasswordComponent.vue"),
  },

  // 404 page should always be the last route add routes above this
  {
    path: "/:catchAll(.*)",
    name: "Page Not Found",
    component: () => import("../views/PageNotFoundView.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
