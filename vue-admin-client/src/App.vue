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

  main {
    background: var(--neutral-100);
    flex-grow: 1;
    min-height: 100vh;
    overflow-y: auto;
  }
}
</style>
