<template>
  <div class="player-container">
    <!-- ID -->
    <div class="player-id-container">{{ player.relative_id }}</div>
    <!-- ID -->

    <!-- Image -->
    <div
      class="player-logo-container"
      :style="{
        'background-image': 'url(' + getPlayerImage + ')',
      }"
    ></div>
    <!-- Image -->

    <!-- Name -->
    <div class="player-container-playerName">{{ player.playerName }}</div>
    <!-- Name -->
    <div class="player-container-player-teamName">{{ player.eplTeamId }}</div>
    <div class="player-container-player-position">{{ player.position }}</div>
    <div class="player-container-player-price">{{ player.currentPrice }}</div>
    <div class="player-container-player-injuryStatus">
      <img
        :src="injuredIcon.path"
        :alt="injuredIcon.alt"
        v-if="player.availability && player.availability.injuryStatus"
        class="small-icon"
      />
      <div v-if="player.availability && player.availability.injuryStatus">
        {{ player.availability.injuryStatus }}%
      </div>
    </div>

    <!-- Controls -->
    <div class="player-controls-container">
      <div @click="editPlayer">
        <img :src="editIcon.path" :alt="editIcon.alt" class="small-icon" />
      </div>
      <div @click="deletePlayer">
        <img :src="deleteIcon.path" :alt="deleteIcon.alt" class="small-icon" />
      </div>
    </div>
  </div>
</template>
<script>
import store from "../store/index";

// Icons
import { editIcon, deleteIcon, injuredIcon } from "../utils/Icons";

export default {
  name: "PlayerComponent",
  props: {
    player: Object,
  },
  data() {
    return {
      // Icons

      editIcon: editIcon,
      deleteIcon: deleteIcon,
      injuredIcon: injuredIcon,
    };
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

      if (player) {
        return baseUrl + player;
      } else {
        return require("../assets/img/Player_Image_Placeholder_60x60.jpg");
      }
    },
    // getplayers() {
    //   return store.state.Player.players;
    // },
  },
};
</script>

<style lang="scss" scoped>
/* Icons */
.extra-small-icon {
  width: 7px;
  height: fit-content;
  object-fit: contain;
}
.small-icon {
  width: 18px;
  height: fit-content;
  object-fit: contain;
}
/*  */
.player-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 16px;
  /* margin-top: var(--spacing-large); */
  min-height: 110px;
  border-bottom: 2px solid var(--neutral-200);
  font-size: 16px;
  color: var(--neutral-900);
}
.player-container:nth-of-type(odd) {
  background: var(--neutral-200);
}

.player-id-container,
.player-logo-container,
.player-container-playerName,
.player-container-player-teamName,
.player-container-player-price,
.player-container-player-position {
  display: flex;
}

.player-id-container {
  width: 6%;
  min-width: 40px;
}
.player-logo-container {
  width: 60px;
  min-width: 60px;
  min-height: 60px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
.player-container-playerName {
  width: 20%;
  min-width: 130px;
}
.player-container-player-teamName {
  min-width: 110px;
  width: 18%;
}
.player-container-player-price {
  width: 6%;
}

.player-container-player-position {
  min-width: 60px;
  width: 7%;
}
.player-container-player-injuryStatus {
  min-width: 80px;
  width: 8%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.player-container-player-injuryStatus > div {
  font-size: 12px;
  margin-top: 2px;
}
.player-controls-container {
  width: 5%;
  display: flex;
  align-items: center;
  padding: 0px 36px;
}
.player-container-colored {
  background: var(--primary-100);
}
.player-controls-container {
  width: 10%;
  display: flex;
  justify-content: space-between;
  padding: 0 22px;
}
.player-controls-container > div:nth-of-type(1) {
  margin-right: 5px;
}
</style>
