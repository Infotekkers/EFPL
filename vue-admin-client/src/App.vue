<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |

    <div v-if="currentAdmin.email">
      {{ currentAdmin.email }}
      <button @click="logOutAdmin">Logout</button>
    </div>
    <div v-else>Not Logged In</div>
  </nav>

  <!-- eslint-disable-next-line -->
  <router-view />
</template>

<style>
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

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  computed: {
    ...mapGetters(["currentAdmin"]),
  },
  methods: {
    ...mapActions(["logOutAdmin"]),
  },
};
</script>
