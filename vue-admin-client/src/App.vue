<template>
  <!-- <nav> -->
  <!-- <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
  </nav> -->

  <!-- eslint-disable-next-line -->
  <section>
    <router-view />
    <NotificationComponent />
  </section>
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
