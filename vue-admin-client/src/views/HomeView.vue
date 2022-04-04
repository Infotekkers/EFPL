<template>
  <div class="home">
    <HelloWorld />
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
// import addPlayer from "@/components/ManagePlayers/AddPlayer.vue";
export default {
  name: "HomeView",
  components: {
    HelloWorld,
    // addPlayer,
  },
};
</script>
