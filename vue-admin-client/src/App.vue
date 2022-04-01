<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link :to="{ name: 'admin' }" v-if="currentAdmin.email"
      >Admin</router-link
    >
    <div v-if="currentAdmin.email">
      {{ currentAdmin.email }}
      <button @click="logOutAdmin">Logout</button>
    </div>
    <div v-else>
      Not Logged In
      <router-link :to="{ name: 'admin-login' }"
        ><button>Login</button></router-link
      >
    </div>
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
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters(["currentAdmin"]),
  },
  methods: {
    logOutAdmin() {
      this.$store.dispatch("logOutAdmin");
      this.$router.push({ name: "home" });
    },
  },
  mounted() {
    this.$store.dispatch("setAdmin");
  },
};
</script>
