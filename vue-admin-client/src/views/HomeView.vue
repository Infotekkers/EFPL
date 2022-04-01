<template>
  <div class="home">
    <allplayers />
  </div>
</template>

<script>
// @ is an alias to /src
import allplayers from "@/components/ManagePlayers/AllPlayers.vue";
// import addPlayer from "@/components/ManagePlayers/AddPlayer.vue";
export default {
  name: "HomeView",
  components: {
    allplayers,
    // addPlayer,
  },
};
</script>
