<template>
  <main class="players-main-container">
    <!-- Modal -->
    <PlayerModal
      v-show="showModal"
      @closeModal="closeModal"
      :isEditMode="isEditMode"
    />
    <!-- Modal -->
    <input
      type="text"
      class="team-search-bar"
      @keyup="searchBarFilter"
      placeholder="Search Term Here..."
      ref="searchBar"
    />
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

    <!-- Filter Section -->
    <div class="players-filter-section">
      <!-- Club -->
      <div class="club-price-filter">
        <select
          name="PlayerTeam"
          ref="eplTeamId"
          v-model="selectedPlayerTeam"
          @change="filterByTeam"
        >
          <option value="All">All</option>
          <option
            v-for="team in getTeams"
            :key="team.teamName"
            :value="team.teamName"
          >
            {{ team.teamName }}
          </option>
        </select>
      </div>

      <!-- Price -->
      <div class="player-price-filter">
        <MultiRangeSlider
          baseClassName="multi-range-slider"
          :min="3.0"
          :max="19"
          :step="0.1"
          :ruler="false"
          :label="true"
          :minValue="barMinValue"
          :maxValue="barMaxValue"
          @input="UpdateValues"
        />
      </div>

      <!-- Position -->
      <div class="player-position-filter">
        <select
          name="PlayerPositionFilter"
          id=""
          v-model="selectedPlayerPosition"
          @change="filterByPosition"
          ref="playerPosition"
        >
          <option value="All">All</option>
          <option value="GK">Goalkeepers</option>
          <option value="DEF">Defenders</option>
          <option value="MID">Midfielders</option>
          <option value="ATT">Attackers</option>
        </select>
      </div>
    </div>

    <!-- Filter Section -->

    <!-- Sorter Header -->
    <div class="players-sorter-header">
      <div class="players-id-sorter">
        <span @click="sortByID(-1)">D</span>
        ID
        <span @click="sortByID(1)">A</span>
      </div>
      <div class="players-logo-sorter">Image</div>

      <div class="players-name-sorter">
        <span @click="sortByName(-1)">D</span>
        Name
        <span @click="sortByName(1)">A</span>
      </div>
      <div class="players-team-sorter">
        <span @click="sortByTeam(-1)">D</span>
        Team
        <span @click="sortByTeam(1)">A</span>
      </div>
      <div class="players-city-sorter">
        <span @click="sortByPosition(-1)">D</span>
        Position
        <span @click="sortByPosition(1)">A</span>
      </div>
      <div class="players-stadium-sorter">
        <span @click="sortbyPrice(-1)">D</span>
        Price
        <span @click="sortbyPrice(1)">A</span>
      </div>

      <div class="players-controls-sorter">Controls</div>
    </div>
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
import store from "../store/index";

import PlayerComponent from "@/components/PlayerComponent";
import PlayerModal from "@/components/PlayerModalComponent";

// Slider
import MultiRangeSlider from "multi-range-slider-vue";

export default {
  name: "PlayersComponent",
  components: {
    PlayerComponent,
    PlayerModal,
    MultiRangeSlider,
  },
  data() {
    return {
      showModal: false,
      isEditMode: false,
      barMinValue: 3,
      barMaxValue: 19,
      selectedPlayerPosition: "All",
      selectedPlayerTeam: "All",
    };
  },
  methods: {
    filterByPosition() {
      store.dispatch("Player/filterByPosition", this.selectedPlayerPosition);
      store.dispatch("Player/filterAll");
    },
    filterByTeam() {
      store.dispatch("Player/filterByTeam", this.selectedPlayerTeam);
      store.dispatch("Player/filterAll");
    },
    UpdateValues(e) {
      this.barMinValue = e.minValue;
      this.barMaxValue = e.maxValue;

      store.dispatch("Player/filterByPrice", [
        this.barMinValue,
        this.barMaxValue,
      ]);
      store.dispatch("Player/filterAll");
    },
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
    sortByID(order) {
      store.dispatch("Player/sortByID", order);
    },
    sortByTeam(order) {
      store.dispatch("Player/sortByTeam", order);
    },

    sortByPosition(order) {
      store.dispatch("Player/sortByPosition", order);
    },
    sortbyPrice(order) {
      store.dispatch("Player/sortbyPrice", order);
    },
    sortByName(order) {
      store.dispatch("Player/sortByName", order);
    },
    searchBarFilter() {
      store.dispatch("Player/filterSearchTerm", this.$refs.searchBar.value);
    },
  },
  computed: {
    getAllPlayers() {
      return store.state.Player.allPlayers;
    },
    getTeams() {
      return store.state.Player.allTeams;
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
.players-sorter-header {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
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
.players-filter-section {
  width: 95%;
  min-height: 60px;

  background: teal;
  margin-top: 32px;
  margin-bottom: 26px;

  display: flex;
  justify-content: space-between;
  align-items: center;
}
.player-price-filter {
  min-width: 300px;
}
.multi-range-slider {
  box-shadow: none;
  border: none;
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
