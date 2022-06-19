<template>
  <aside v-if="showSidebar">
    <button class="collapse-sidebar" :class="{ right: minimizeSidebar }">
      <img :src="toggleSidebarIcon.path" :alt="toggleSidebarIcon.alt" />
    </button>

    <div class="sidebar-wrapper" :class="{ minimized: minimizeSidebar }">
      <h1>
        Ethiopian <br />
        Fantasy PL <br />
        Admin
      </h1>
      <!-- Home -->

      <router-link class="sidebar__link" to="/admin/home">
        <img :src="homeSidebarIcon.path" :alt="homeSidebarIcon.alt" />
        <p>
          {{ $t("home") }}
        </p>
      </router-link>

      <!-- Fixtures -->

      <router-link class="sidebar__link" to="/admin/fixtures">
        <img :src="fixturesSidebarIcon.path" :alt="fixturesSidebarIcon.alt" />
        <p>{{ $t("Fixtures") }}</p>
      </router-link>

      <!-- Teams -->

      <router-link class="sidebar__link" to="/admin/teams">
        <img :src="teamsSidebarIcon.path" :alt="teamsSidebarIcon.alt" />
        <p>
          {{ $t("Teams") }}
        </p>
      </router-link>

      <!-- Players -->

      <router-link class="sidebar__link" to="/admin/players">
        <img :src="playersSidebarIcon.path" :alt="playersSidebarIcon.alt" />
        <p>
          {{ $t("Players") }}
        </p>
      </router-link>

      <!-- settings -->

      <router-link class="sidebar__link" to="/admin/settings">
        <img :src="settingsSidebarIcon.path" :alt="settingsSidebarIcon.alt" />
        <p>{{ $t("Settings") }}</p>
      </router-link>
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
  toggleSidebarIcon,
  // infoSidebarIcon,
} from "@/utils/Icons";

export default {
  data() {
    return {
      sidebar: 1,
      minimizeSidebar:
        localStorage.getItem("minimizeSidebar") === "true" ? true : false,

      // Icons
      homeSidebarIcon,
      fixturesSidebarIcon,
      teamsSidebarIcon,
      playersSidebarIcon,
      settingsSidebarIcon,
      toggleSidebarIcon,
      // infoSidebarIcon,
    };
  },
  methods: {
    toggleSidebar() {
      this.minimizeSidebar = !this.minimizeSidebar;
      localStorage.setItem("minimizeSidebar", this.minimizeSidebar);
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
    transition: opacity 800ms 500ms;

    text-align: left;
    color: white;
    font-size: var(--text-large);

    margin-bottom: var(--spacing-regular);
    margin-left: var(--spacing-small);
  }

  box-shadow: 1px 0 4px 0 var(--neutral-200);
  .collapse-sidebar {
    padding: var(--spacing-xsmall) var(--spacing-2xsmall);
    font-size: var(--text-base);
    border: none;

    background: var(--neutral-400);

    position: absolute;
    top: 0;
    left: 100%;

    & img {
      width: 5px;
    }
  }

  .collapse-sidebar.right {
    transform: rotate(180deg);
  }

  .sidebar-wrapper {
    padding: 0 var(--spacing-regular);
    width: 300px;
    height: 100%;

    display: flex;
    flex-direction: column;
    justify-content: center;

    transition: width 800ms;
  }

  .minimized {
    width: 80px;
    padding: var(--spacing-small);

    & h1 {
      visibility: hidden;
      height: 0;
      opacity: 0;
    }
    & .sidebar__link {
      max-height: 50px;
      border-radius: 50%;

      transition: border-radius 800ms;

      & p {
        display: none;
      }

      & img {
        max-height: 100%;
        width: 30px;
        margin-right: 0;
      }
    }
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
    background: var(--neutral-400);
    color: var(--neutral-900);

    border-radius: 999px;
  }
}
</style>
