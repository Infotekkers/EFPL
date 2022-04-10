<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <HelloWorld msg="Welcome to Your Vue.js App" />
  </div>
</template>

<script>
import axiosToken from "../services/AxiosTokenInstance";
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "HomeView",
  components: {
    HelloWorld,
  },

  async beforeMount() {
    const teams = await axiosToken.get(
      `${process.env.VUE_APP_API_BASE_URL}/teams/all`
    );

    console.log(teams);
  },
};
</script>
