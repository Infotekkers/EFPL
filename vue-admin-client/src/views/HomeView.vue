<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <HelloWorld msg="Welcome to Your Vue.js App" />
    <NotificationComponent
      message="A global Notification System Message here."
      type="success"
      v-show="showNotification"
      @closeNotification="showNotification = false"
      :duration="2000"
    />
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
import NotificationComponent from "@/components/NotificationComponent";

export default {
  name: "HomeView",
  components: {
    HelloWorld,
    NotificationComponent,
  },
  data() {
    return {
      showNotification: true,
    };
  },
};
</script>
