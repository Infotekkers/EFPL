import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
// Player Routes
import ALLPLAYERS from "../components/ManagePlayers/AllPlayers";
import ADDPLAYER from "../components/ManagePlayers/AddPlayer";
import EDITPLAYERS from "../components/ManagePlayers/EditPlayer";
import VIEWPLAYERS from "../components/ManagePlayers/viewPlayer";
const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/allplayers",
    name: "alllayer",
    component: ALLPLAYERS,
  },
  {
    path: "/addplayer",
    name: "addplayer",
    component: ADDPLAYER,
  },
  {
    path: "/editplayer",
    name: "editplayer",
    component: EDITPLAYERS,
  },
  {
    path: "/viewPlayer",
    name: "viewPlayer",
    component: VIEWPLAYERS,
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
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
