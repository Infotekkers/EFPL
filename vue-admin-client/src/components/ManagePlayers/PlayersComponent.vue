<template>
  <main class="players-main-container">
    <!-- Modal -->
    <PlayerModal
      v-show="showModal"
      @closeModal="closeModal"
      :isEditMode="isEditMode"
    />
    <!-- Modal -->
    <!-- <input
      type="text"
      class="team-search-bar"
      @keyup="searchBarFilter"
      placeholder="Search Term Here..."
      ref="searchBar"
    /> -->
    <!-- Header -->
    <div class="players-header-container">
      <!-- Title -->
      <div class="players-title">Ethiopian Premier League - Players</div>

      <!-- Add Button -->
      <div class="players-add-new" @click="activateModal">
        <div>+</div>
        Add
      </div>
    </div>
    <!-- Header -->
    <!-- Sorter Header -->
    <!-- <div class="teams-sorter-header">
      <div @click="sortByID" class="teams-id-sorter">ID</div>
      <div class="teams-logo-sorter">Logo</div>
      <div @click="sortByName" class="teams-name-sorter">Team</div>
      <div @click="sortByCity" class="teams-city-sorter">City</div>
      <div @click="sortbyStadium" class="teams-stadium-sorter">Stadium</div>
      <div @click="sortByFoundedDate" class="teams-founded-sorter">Year</div>
      <div class="teams-controls-sorter">Controls</div>
    </div> -->
    <!-- Sorter Header -->
    <div class="players-container" v-if="getAllPlayers.length > 0">
      <PlayerComponent
        v-for="player in getAllPlayers"
        :key="player.playerId"
        :player="player"
        @activateModalEdit="activateModalEdit"
      />
    </div>

    <!-- No items -->
    <div class="no-players-container" v-else>No Players</div>
  </main>
</template>
<script>
import store from "../../store/index";

import PlayerComponent from "@/components/ManagePlayers/PlayerComponent";
import PlayerModal from "@/components/ManagePlayers/PlayerModalComponent";
export default {
  name: "PlayersComponent",
  components: {
    PlayerComponent,
    PlayerModal,
  },
  data() {
    return {
      showModal: false,
      isEditMode: false,
    };
  },
  methods: {
    // Event Handlers
    activateModal() {
      this.isEditMode = false;
      this.showModal = true;
    },
    activateModalEdit() {
      this.isEditMode = true;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
  },
  computed: {
    getAllPlayers() {
      return store.state.Player.allPlayers;
    },
  },

  beforeMount() {
    store.dispatch("Player/setAllPlayers");
  },
};
</script>
<style scoped>
.players-main-container {
  /* background: var(--primary-400); */
  width: 82%;
  margin-left: 18%;
  padding: 100px 24px 60px 16px;
}
.player-search-bar {
  width: 20%;
  height: 32px;
  margin-left: 80%;
  padding: 0 3px;
  outline: none;
}
.players-header-container {
  margin-top: var(--spacing-medium);
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;

  /*  */
  position: relative;
  z-index: 1;
}
.players-title {
  font-size: var(--text-medium);
}
.players-add-new {
  font-size: 16px;
  position: absolute;
  right: 0%;
  background: var(--primary-900);
  padding: 5px 22px 5px 16px;
  color: var(--neutral-100);
  display: flex;
}
.players-add-new > div {
  width: 20px;
  height: 20px;
  background: var(--primary-800);
  border-radius: 50%;
  display: grid;
  place-items: center;
  margin-right: 6px;
}
.players-sorter-header {
  padding: 0 12px;
  margin: var(--spacing-xlarge) 0 var(--spacing-regular) 0;
  display: flex;
  justify-content: space-between;
  font-weight: 500;
  font-size: 15px;
  color: var(--neutral-700);
}
.players-id-sorter {
  width: 5%;
  min-width: 45px;
}
.players-logo-sorter {
  width: 60px;
}
.players-name-sorter {
  width: 20%;
  min-width: 130px;
}
.players-city-sorter {
  min-width: 100px;
  width: 17%;
}
.players-stadium-sorter {
  width: 16%;
}
.players-founded-sorter {
  width: 8%;
}
.players-controls-sorter {
  width: 10%;
}
.no-players-container {
  margin-top: var(--spacing-xlarge);
  width: 100%;
  min-height: 200px;
  display: grid;
  place-items: center;
  font-weight: bold;
  font-size: var(--text-medium);
}
</style>
