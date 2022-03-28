<template>
  <div class="home">
    <FixturesComponent v-if="1 == 0" />
    <NotificationComponent />
    <TeamsComponent />
  </div>
</template>

<script>
// @ is an alias to /src
import FixturesComponent from "@/components/fixture/FixturesComponent";
import NotificationComponent from "@/components/shared/NotificationComponent";
import TeamsComponent from "@/components/team/TeamsComponent";

import store from "../store/index";

export default {
  name: "HomeView",
  components: {
    FixturesComponent,
    NotificationComponent,
    TeamsComponent,
  },

  methods: {
    closeNotification() {
      store.dispatch("Global/setNotificationInfo", { showNotification: false });
    },
  },
};
</script>
