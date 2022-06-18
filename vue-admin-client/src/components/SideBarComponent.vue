<template>
  <aside v-if="showSidebar">
    <button class="collapse-sidebar">
      <span>&#11164;</span>
    </button>

    <div class="sidebar-wrapper">
      <h1>
        Ethiopian <br />
        Fantasy PL <br />
        Admin
      </h1>
      <!-- Home -->

      <router-link class="sidebar__link" to="/admin/home"
        ><img :src="homeSidebarIcon.path" :alt="homeSidebarIcon.alt" />{{
          $t("home")
        }}</router-link
      >

      <!-- Fixtures -->

      <router-link class="sidebar__link" to="/admin/fixtures">
        <img :src="fixturesSidebarIcon.path" :alt="fixturesSidebarIcon.alt" />
        {{ $t("Fixtures") }}</router-link
      >

      <!-- Teams -->

      <router-link class="sidebar__link" to="/admin/teams">
        <img :src="teamsSidebarIcon.path" :alt="teamsSidebarIcon.alt" />{{
          $t("Teams")
        }}</router-link
      >

      <!-- Players -->

      <router-link class="sidebar__link" to="/admin/players">
        <img :src="playersSidebarIcon.path" :alt="playersSidebarIcon.alt" />{{
          $t("Players")
        }}</router-link
      >

      <!-- settings -->

      <router-link class="sidebar__link" to="/admin/settings"
        ><img
          :src="settingsSidebarIcon.path"
          :alt="settingsSidebarIcon.alt"
        />{{ $t("Settings") }}</router-link
      >
    </div>
  </aside>
</template>

<script>
import store from "../store/index";

import {
  homeSidebarIcon,
  fixturesSidebarIcon,
  teamsSidebarIcon,
  playersSidebarIcon,
  settingsSidebarIcon,
  // infoSidebarIcon,
} from "@/utils/Icons";

export default {
  data() {
    return {
      sidebar: 1,

      // Icons
      homeSidebarIcon,
      fixturesSidebarIcon,
      teamsSidebarIcon,
      playersSidebarIcon,
      settingsSidebarIcon,
      // infoSidebarIcon,
    };
  },
  methods: {
    toggleSidebar(e) {
      const sidebar = document.querySelector(".sidebar-wrapper");

      if (this.sidebar) {
        sidebar.style.display = "none";
        e.target.innerHTML = "&#11166;";
        this.sidebar = 0;
      } else {
        sidebar.style.display = "flex";
        e.target.innerHTML = "&#11164;";
        this.sidebar = 1;
      }
    },
  },
  mounted() {
    const toggle = document.querySelector(".collapse-sidebar");
    toggle.addEventListener("click", this.toggleSidebar);
  },
  computed: {
    showSidebar() {
      return store.state.Global.showSidebar;
    },
  },
};
</script>

<style lang="scss" scoped>
aside {
  position: relative;

  &:before,
  &:after {
    content: "";
    height: 100%;
    width: 100%;

    display: block;
    position: absolute;
    top: 0;
    z-index: -1;
  }

  &:before {
    background-image: url("../assets/img/Ethiopian_Premier_League_logo.png"),
      linear-gradient(90deg, var(--primary-900), var(--primary-900));
    background-position: 35% -150%, 0 0;
    background-size: 200%, cover;
    background-repeat: no-repeat;
  }

  &:after {
    opacity: 0.6;
    background: url("../assets/img/overlay.jpg");
    background-size: cover;
    background-position: center center;
  }

  h1 {
    text-align: left;
    color: white;
    font-size: var(--text-large);

    margin-bottom: var(--spacing-regular);
  }

  box-shadow: 1px 0 4px 0 var(--neutral-200);
  .collapse-sidebar {
    padding: var(--spacing-3xsmall) var(--spacing-xsmall);
    font-size: var(--text-base);
    border: none;

    background: var(--neutral-400);

    position: absolute;
    top: 0;
    left: 100%;
  }

  .sidebar-wrapper {
    padding: 0 var(--spacing-regular);
    width: 300px;
    height: 100%;

    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .sidebar__link {
    display: flex;
    align-items: center;
    margin-bottom: var(--spacing-xsmall);

    padding: var(--spacing-small);
    text-decoration: none;

    font-size: var(--text-regular);
    font-weight: 500;
    color: var(--neutral-200);
  }

  .sidebar__link img {
    width: 20px;
    margin-right: var(--spacing-xsmall);
  }

  .sidebar__link.router-link-active {
    background: var(--neutral-200);
    color: var(--neutral-900);

    border-radius: 999px;
  }
}
</style>
