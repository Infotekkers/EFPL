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
  <section><router-view /><NotificationComponent /></section>
</template>

<style>
@import url("./assets/design-system.css");
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
