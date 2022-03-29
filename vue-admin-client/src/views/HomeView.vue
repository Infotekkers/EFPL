<template>
  <div class="home">
    <addPlayer />
  </div>
</template>

<script>
// @ is an alias to /src
import addPlayer from "@/components/ManagePlayers/AddPlayer.vue";

export default {
  name: "HomeView",
  components: {
    addPlayer,
  },
};
</script>
