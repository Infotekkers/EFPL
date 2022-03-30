<template>
  <div class="home">
    <NotificationComponent />

    <HelloWorld />
  </div>
</template>

<script>
import NotificationComponent from "@/components/NotificationComponent";

import HelloWorld from "@/components/HelloWorld";

import store from "../store/index";

export default {
  name: "HomeView",
  components: {
    NotificationComponent,

    HelloWorld,
  },

  methods: {
    closeNotification() {
      store.dispatch("Global/setNotificationInfo", { showNotification: false });
    },
  },
};
</script>
