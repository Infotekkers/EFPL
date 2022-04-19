<template>
  <div class="wrapper">
    <SideBar v-show="isAuth" />
    <main>
      <!-- eslint-disable-next-line -->
      <!-- <router-view /> -->
      <MainView />
      <NotificationComponent />
    </main>
  </div>
</template>

<script>
import MainView from "@/views/MainView.vue";
import NotificationComponent from "@/components/NotificationComponent.vue";
import SideBar from "@/components/SideBarComponent.vue";

export default {
  components: {
    SideBar,
    MainView,
    NotificationComponent,
  },

  data() {
    return {
      showSidebar: false,
    };
  },
  // TODO:Change
  computed: {
    isAuth() {
      const routeName = this.$route.name;

      if (routeName === "admin-login") {
        return false;
      } else {
        return true;
      }
    },
  },
  mounted() {
    this.$store.dispatch("setAdmin");
  },
};
</script>

<style>
@import "./assets/design-system.css";

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>

<style lang="scss">
.wrapper {
  height: 100vh;
  display: flex;

  .collapse-sidebar {
    padding: var(--spacing-3xsmall) var(--spacing-xsmall);
    font-size: var(--text-base);
    border: none;

    background: var(--neutral-400);

    position: absolute;
    top: 0;
    left: 100%;
  }

  aside {
    position: relative;
    height: 100vh;
    background: var(--neutral-50);
    box-shadow: 1px 0 4px 0 var(--neutral-200);

    .sidebar-wrapper {
      padding: 0 var(--spacing-regular);
      width: 250px;
      height: 100%;

      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .sidebar__link {
      display: flex;
      align-items: center;
      margin-bottom: var(--spacing-xsmall);

      &:before {
        content: "";
        width: 30px;
        height: 30px;

        background: var(--neutral-400);
        border-radius: 50%;
        display: block;
      }

      a {
        padding: var(--spacing-small);
        text-decoration: none;

        font-size: var(--text-regular);
        font-weight: 500;
        color: var(--neutral-900);
      }
    }

    .sidebar__link.active {
    }
  }

  main {
    background: var(--neutral-100);
    flex-grow: 1;
    min-height: 100vh;
    overflow-y: auto;
  }
}
</style>
