<template>
  <div class="home">
    <PlayersComponent />
  </div>
</template>

<script>
// @ is an alias to /src
import PlayersComponent from "@/components/ManagePlayers/PlayersComponent.vue";
// import addPlayer from "@/components/ManagePlayers/AddPlayer.vue";
export default {
  name: "HomeView",
  components: {
    PlayersComponent,
    // addPlayer,
  },
};
</script>
