<template>
  <div class="player-container">
    <div class="player-id-container">{{ player.relative_id }}</div>
    <div
      class="player-logo-container"
      :style="{
        'background-image': 'url(' + getPlayerImage + ')',
      }"
    ></div>

    <div class="playercontainer">{{ player.playerName }}</div>
    <div class="playercontainer">{{ player.teamName }}</div>
    <div class="playercontainer">{{ player.position }}</div>
    <div class="playercontainer">{{ player.currentPrice }}</div>
    <div class="playercontainer">{{ player.injuryStatus }}</div>
    <div class="playercontainer">{{ player.injuryMessage }}</div>
    <div class="player-controls-container">
      <div @click="editPlayer">Edit</div>
      <div @click="deletePlayer">Delete</div>
    </div>
  </div>
</template>
<script>
import store from "../../store/index";

export default {
  name: "PlayerComponent",
  props: {
    player: Object,
  },
  methods: {
    editPlayer() {
      store.dispatch("Player/setEditPlayerId", this.player.playerId);
      this.$emit("activateModalEdit");
    },
    deletePlayer() {
      store.dispatch("Player/deletePlayer", this.player.playerId);
    },
  },
  computed: {
    getPlayerId() {
      return this.$.vnode.key;
    },
    getPlayerImage() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;
      const player = this.player.playerImage;
      return baseUrl + player;
    },
    // getplayers() {
    //   return store.state.Player.players;
    // },
  },
};
</script>

<style lang="scss" scoped>
.player-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 16px;
  /* margin-top: var(--spacing-large); */
  min-height: 110px;
  border-bottom: 2px solid var(--neutral-200);
  font-size: 18px;
  color: var(--neutral-900);
}
.player-container:nth-of-type(odd) {
  background: var(--neutral-100);
}
.player-id-container {
  width: 5%;
  min-width: 45px;
}
.player-logo-container {
  text-align: start;
  width: 60px;
  min-width: 60px;
  min-height: 60px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;

  background: yellow;
}

.playercontainer {
  width: 20%;
  min-width: 130px;
}
.player-container-colored {
  background: var(--primary-100);
}
.player-controls-container {
  width: 10%;
  display: flex;
  justify-content: space-between;
}
.player-controls-container > div:nth-of-type(1) {
  margin-right: 8px;
}
</style>
