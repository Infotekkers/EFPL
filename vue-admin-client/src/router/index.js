import { createRouter, createWebHistory } from "vue-router";
import FixtureDetail from "../pages/FixtureDetailPage.vue";

const routes = [
  {
    path: "/fixture/detail",
    name: "Fixture Detail",
    component: FixtureDetail,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
