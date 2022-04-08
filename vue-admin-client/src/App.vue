<template>
  <nav>
    <router-link to="/">{{ $t("home") }}</router-link> |
    <router-link :to="{ name: 'admin' }" v-if="currentAdmin.email">{{
      $t("admin")
    }}</router-link>
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
  <section><router-view /><NotificationComponent /></section>
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
import NotificationComponent from "./components/NotificationComponent.vue";
import { mapGetters } from "vuex";
export default {
  components: {
    NotificationComponent,
  },
  computed: {
    ...mapGetters(["currentAdmin"]),
  },
  methods: {
    logOutAdmin() {
      this.$store.dispatch("logOutAdmin");
    },
  },
  mounted() {
    this.$store.dispatch("setAdmin");
  },
};
</script>
