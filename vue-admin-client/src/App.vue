<template>
  <div class="wrapper">
    <SideBar />
    <main>
      <!-- eslint-disable-next-line -->
      <router-view />
    </main>
  </div>
</template>

<script>
import SideBar from "./components/SideBar.vue";

export default {
  components: {
    SideBar,
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
  }
}
</style>
