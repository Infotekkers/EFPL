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
import NotificationComponent from "@/components/NotificationComponent";
export default {
  components: {
    NotificationComponent,
  },
};
</script>
