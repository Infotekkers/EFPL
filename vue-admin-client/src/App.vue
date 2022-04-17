<template>
  <div>
    <notification />
    <router-view />
  </div>
</template>

<script>
import Notification from "@/components/NotificationComponent.vue";

export default {
  components: {
    Notification,
  },
};
</script>

<style>
@import "assets/css/design-system.css";
</style>
