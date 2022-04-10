import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import AdminLoginView from "../views/AdminLoginView.vue";
import PageNotFoundComponent from "../components/PageNotFoundComponent.vue";
import SettingsComponent from "../components/AdminSettingsComponent.vue";
import Admin from "../components/AdminComponent.vue";
import ForgotPassword from "../components/ForgotPasswordComponent";
import ResetPassword from "../components/ResetPasswordComponent";
import FixtureDetail from "../components/FixtureDetailComponent.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/admin",
    name: "admin",
    component: Admin,
    beforeEnter(to, from, next) {
      // get the currently signed in admin
      const currentAdmin = JSON.parse(
        window.localStorage.getItem("currentAdmin")
      );
      if (currentAdmin) {
        next();
      } else {
        next("/");
      }
    },
    children: [
      // settings page
      {
        path: "settings",
        name: "settings",
        component: SettingsComponent,
      },
      // about page
      {
        path: "about",
        name: "about",
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () =>
          import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
      },
    ],
  },

  // admin login page
  {
    path: "/login",
    name: "admin-login",
    component: AdminLoginView,
  },

  // forgot password page
  {
    path: "/forgotpassword",
    name: "forgot-password",
    component: ForgotPassword,
  },

  // reset password
  {
    path: "/resetPassword/:token",
    name: "reset-password",
    component: ResetPassword,
  },

  // 404 page should always be the last route add routes above this
  {
    path: "/:catchAll(.*)",
    name: "pagenotfound",
    component: PageNotFoundComponent,
  },

  // Fixture Routes
  {
    path: "/fixtures",
    name: "Fixtures",
    component: () => import("../components/FixturesComponent.vue"),
  },

  {
    path: "/fixture/detail",
    name: "Fixture Detail",
    component: FixtureDetail,
  },

  // Team Route
  {
    path: "/teams",
    name: "Teams",
    component: () => import("../components/TeamsComponent.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
