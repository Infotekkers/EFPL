<template>
  <div class="home">
    <FixturesComponent />
    <NotificationComponent
      :message="notificationMessage"
      :type="notificationType"
      v-show="showNotification"
      @closeNotification="closeNotification"
      :duration="notificationDuration"
    />
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

  computed: {
    showNotification() {
      return store.state.Global.showNotification;
    },
    notificationMessage() {
      return store.state.Global.notificationMessage;
    },
    notificationType() {
      return store.state.Global.notificationType;
    },
    notificationDuration() {
      console.log("Duration", store.state.Global.notificationDuration);
      return store.state.Global.notificationDuration;
    },
  },
};
</script>
