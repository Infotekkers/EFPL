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
      <div class="players-title">
        {{ $t("Ethiopian Premier League") }} - {{ $t("Players") }}
      </div>

      <!-- Add Button -->
      <div class="players-add-new" @click="activateModal">
        <div>
          <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
        </div>
        {{ $t("Add") }}
      </div>
    </div>
    <!-- Header -->

    <!-- Filter Section -->
    <div class="players-filter-section">
      <!-- Club -->
      <div class="club-price-filter">
        {{ $t("Team") }}
        <select
          name="PlayerTeam"
          ref="eplTeamId"
          v-model="selectedPlayerTeam"
          @change="filterByTeam"
        >
          <option value="All">{{ $t("All") }}</option>
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
        {{ $t("Price") }}
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
        {{ $t("Position") }}
        <select
          name="PlayerPositionFilter"
          id=""
          v-model="selectedPlayerPosition"
          @change="filterByPosition"
          ref="playerPosition"
        >
          <option value="All">{{ $t("All") }}</option>
          <option value="GK">{{ $t("GoalKeepers") }}</option>
          <option value="DEF">{{ $t("Defenders") }}</option>
          <option value="MID">{{ $t("Midfielders") }}</option>
          <option value="ATT">{{ $t("Attackers") }}</option>
        </select>
      </div>

      <!-- Reset -->
      <div @click="resetFilters" class="reset-filter-button">
        <img :src="resetIcon.path" :alt="resetIcon.alt" class="small-icon" />
        <div>
          {{ $t("Reset Filters") }}
        </div>
      </div>
    </div>

    <!-- Filter Section -->

    <!-- Sorter Header -->
    <div class="players-sorter-header">
      <div class="players-id-sorter">
        <span @click="sortByID(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>
        <span class="sorter-content"> {{ $t("ID") }}</span>
        <span @click="sortByID(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <div class="players-logo-sorter">{{ $t("Image") }}</div>

      <div class="players-name-sorter">
        <span @click="sortByName(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>
        <span class="sorter-content"> {{ $t("Name") }}</span>

        <span @click="sortByName(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <div class="players-team-sorter">
        <span @click="sortByTeam(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>

        <span class="sorter-content"> {{ $t("Team") }}</span>
        <span @click="sortByTeam(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <div class="players-city-sorter">
        <span @click="sortByPosition(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>

        <span class="sorter-content"> {{ $t("Position") }}</span>
        <span @click="sortByPosition(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <div class="players-stadium-sorter">
        <span @click="sortbyPrice(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>

        <span class="sorter-content"> {{ $t("Price") }}</span>
        <span @click="sortbyPrice(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>

      <div class="players-controls-injury">{{ $t("Injury") }}</div>

      <div class="players-controls-sorter">{{ $t("Controls") }}</div>
    </div>
    <!-- Sorter Header -->

    <div
      class="players-container"
      v-if="getAllPlayers.length > 0 && isPlayerLoading == false"
    >
      <PlayerComponent
        v-for="player in getAllPlayers"
        :key="player.playerId"
        :player="player"
        @activateModalEdit="activateModalEdit"
      />
    </div>

    <!-- No items -->
    <div
      class="no-players-container"
      v-else-if="getAllPlayers.length == 0 && isPlayerLoading == false"
    >
      {{ $t("No") }} {{ $t("Players") }}
    </div>

    <!-- Loading -->
    <div v-else-if="isPlayerLoading === true" class="no-players-container">
      <SpinnerComponent />
    </div>
  </main>
</template>

<script>
// utils
import store from "../store/index";

// Components
import PlayerComponent from "@/components/PlayerComponent";
import PlayerModal from "@/components/PlayerModalComponent";
import SpinnerComponent from "@/components/SpinnerComponent.vue";

// Slider
import MultiRangeSlider from "multi-range-slider-vue";

// Icons
import { addIcon, sortUpIcon, sortDownIcon, resetIcon } from "../utils/Icons";

export default {
  name: "PlayersComponent",
  components: {
    PlayerComponent,
    PlayerModal,
    MultiRangeSlider,
    SpinnerComponent,
  },
  data() {
    return {
      showModal: false,
      isEditMode: false,
      barMinValue: 3,
      barMaxValue: 19,
      selectedPlayerPosition: "All",
      selectedPlayerTeam: "All",
      isPlayerLoading: true,

      // Icons
      addIcon: addIcon,
      sortUpIcon: sortUpIcon,
      sortDownIcon: sortDownIcon,
      resetIcon: resetIcon,
    };
  },
  methods: {
    resetFilters() {
      // reset price
      store.dispatch("Player/filterByPrice", []);
      this.barMinValue = 3;
      this.barMaxValue = 19;

      // reset position
      store.dispatch("Player/filterByPosition", "");
      (this.selectedPlayerPosition = "All"),
        // reset team
        store.dispatch("Player/filterByTeam", "");
      (this.selectedPlayerTeam = "All"), this.getAllPlayers;
    },
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
      this.isEditMode = false;
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
      this.getAllPlayers;
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
    this.isPlayerLoading = true;
    store.dispatch("Player/setAllPlayers");
    setTimeout(() => {
      this.isPlayerLoading = false;
    }, 2000);
  },
};
</script>

<style scoped>
/* Icons */
.extra-small-icon {
  width: 8px;
  height: fit-content;
  object-fit: contain;
}
.small-icon {
  width: 15px;
  height: fit-content;
  object-fit: contain;
}
/*  */

.players-main-container {
  width: 100%;
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
  width: 100%;
  min-height: 60px;
  margin-top: 32px;
  margin-bottom: 26px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.players-filter-section select {
  height: 30px;
  border: none;
  outline: none;
  margin-left: 4px;
}
/* Overrides */
.multi-range-slider {
  box-shadow: none;
  border: none;
}
/* Overrides */

.player-price-filter {
  min-width: 350px;
}
.reset-filter-button {
  font-size: 16px;

  background: var(--primary-900);
  padding: 5px 22px 5px 16px;
  color: var(--neutral-100);
  display: flex;
  align-items: center;
}
.reset-filter-button > img {
  margin-right: 4px;
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
.players-id-sorter,
.players-name-sorter,
.players-city-sorter,
.players-stadium-sorter,
.players-founded-sorter,
.players-team-sorter {
  display: flex;
  align-items: center;
}
.players-id-sorter > span,
.players-name-sorter > span,
.players-city-sorter > span,
.players-stadium-sorter > span,
.players-team-sorter > span {
  display: flex;
  align-items: center;
  cursor: pointer;
  height: 100%;
  min-width: 10px;
}
.sorter-content {
  margin-right: 8px;
  margin-left: 8px;
}
/* ID */
.players-id-sorter {
  width: 6%;
  min-width: 40px;
}
/* Image */
.players-logo-sorter {
  width: 60px;
}
/* Name */
.players-name-sorter {
  width: 20%;
  min-width: 130px;
}

/* Price */
.players-stadium-sorter {
  width: 6%;
}

/* Position */
.players-city-sorter {
  min-width: 60px;
  width: 7%;
}
.players-controls-injury {
  min-width: 80px;
  width: 8%;
}
.players-team-sorter {
  min-width: 110px;
  width: 18%;
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
