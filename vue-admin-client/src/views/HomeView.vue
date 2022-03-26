<template>
  <div class="home">
    <FixturesComponent />
    <NotificationComponent />
  </div>
</template>

<script>
// @ is an alias to /src
import FixturesComponent from "@/components/FixturesComponent";
import NotificationComponent from "@/components/NotificationComponent";
import store from "../store/index";

export default {
  name: "HomeView",
  components: {
    FixturesComponent,
    NotificationComponent,
  },

  methods: {
    closeNotification() {
      store.dispatch("Global/setNotificationInfo", { showNotification: false });
    },
  },
};
</script>
