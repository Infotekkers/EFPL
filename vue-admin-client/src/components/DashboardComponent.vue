<template>
  <main>
    <!-- Header -->
    <div class="teams-header-container">
      <!-- Title -->
      <div class="teams-title">
        {{ $t("Ethiopian Premier League") }} - {{ getSeason }}
        {{ $t("Teams") }}
      </div>
    </div>
    <!-- Header -->

    <!-- Sorter Header -->
    <div class="teams-sorter-header">
      <div class="teams-id-header">
        {{ $t("ID") }}
      </div>

      <div class="teams-logo-header"></div>

      <div class="teams-team-header">{{ $t("Teams") }}</div>

      <div class="teams-gf-header">{{ $t("GF") }}</div>

      <div class="teams-ga-header">{{ $t("GA") }}</div>

      <div class="teams-gd-header">{{ $t("GD") }}</div>

      <div class="teams-won-header">{{ $t("Won") }}</div>

      <div class="teams-draw-header">{{ $t("Draw") }}</div>

      <div class="teams-lost-header">{{ $t("Lost") }}</div>

      <div class="teams-pts-header">{{ $t("Points") }}</div>
    </div>
    <!-- Sorter Header -->
    <div
      class="teams-container"
      v-if="getAllTeams.length > 0 && isTeamLoading == false"
    >
      <DashLeagueTableComponent
        v-for="team in getAllTeams"
        :key="team.teamId"
        :team="team"
        @activateModalEdit="activateModalEdit"
      />
    </div>

    <!-- No items -->
    <div
      class="no-teams-container"
      v-else-if="getAllTeams.length == 0 && isTeamLoading == false"
    >
      {{ $t("No") }} {{ $t("Teams") }}
    </div>
    <div v-else-if="isTeamLoading == true" class="no-teams-container">
      <SpinnerComponent />
    </div>
    <div class="spacer"></div>
    <div class="stats-cards">
      <EPLStatsComponent :statArray="topScorers || []" statType="goals" />
      <EPLStatsComponent :statArray="mostAssists || []" statType="assists" />
      <EPLStatsComponent
        :statArray="mostCleanSheets || []"
        statType="cleanSheets"
      />
      <EPLStatsComponent :statArray="mostSaves || []" statType="saves" />
      <EPLStatsComponent :statArray="mostReds || []" statType="reds" />
      <EPLStatsComponent :statArray="mostYellows || []" statType="yellows" />
      <EPLStatsComponent
        :statArray="mostMinutesPlayed || []"
        statType="minutesPlayed"
      />
    </div>
    <!-- Loading -->
  </main>
</template>
<script>
// Utils
import store from "../store/index";
import {
  sortUpIcon,
  sortDownIcon,
  addIcon,
  editIcon,
  deleteIcon,
} from "@/utils/Icons";

// Components
// import TeamComponent from "@/components/TeamComponent";
import DashLeagueTableComponent from "@/components/dashLeagueTableComponent";
import SpinnerComponent from "@/components/SpinnerComponent.vue";
import EPLStatsComponent from "@/components/EPLStatsComponent.vue";

export default {
  name: "TeamsComponent",
  components: {
    DashLeagueTableComponent,
    SpinnerComponent,
    EPLStatsComponent,
  },
  data() {
    return {
      showModal: false,
      isEditMode: false,
      isTeamLoading: true,

      // Icons
      sortUpIcon: sortUpIcon,
      sortDownIcon: sortDownIcon,
      addIcon: addIcon,
      editIcon: editIcon,
      deleteIcon: deleteIcon,
    };
  },

  methods: {
    searchBarFilter() {
      const searchTerm = this.$refs.searchBar.value;
      store.dispatch("Team/filterByTerm", searchTerm);
      this.getAllTeams;
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
      store.dispatch("Team/sortByID", order);
    },
    sortByName(order) {
      store.dispatch("Team/sortByName", order);
    },
    sortByCity(order) {
      store.dispatch("Team/sortByCity", order);
    },
    sortbyStadium(order) {
      store.dispatch("Team/sortByStadium", order);
    },
    sortByPoint(order) {
      store.dispatch("Team/sortByPoint", order);
    },
    sortByFoundedDate(order) {
      store.dispatch("Team/sortByFoundedDate", order);
    },

    getEPLStatsFromAPI() {
      store.dispatch("EPLStats/getEPLStats");
    },
  },

  computed: {
    getSeason() {
      const date = new Date().getFullYear().toString().split("");

      return date[2] + (date[3] - 1) + "/" + date[2] + date[3];
    },

    getAllTeams() {
      const allTeams = store.state.Team.allTeams;
      allTeams.sort((a, b) => {
        if (b.teamPosition.teamPoint == a.teamPosition.teamPoint) {
          return (
            b.teamPosition.goalDifferential - a.teamPosition.goalDifferential
          );
        } else {
          return b.teamPosition.teamPoint - a.teamPosition.teamPoint;
        }
      });

      for (let index = 0; index < allTeams.length; index++) {
        allTeams[index].relative_id = index + 1;
      }
      return store.state.Team.allTeams;
    },

    topScorers() {
      return store.state.EPLStats.allStats.topScorers;
    },

    mostAssists() {
      return store.state.EPLStats.allStats.mostAssists;
    },

    mostCleanSheets() {
      return store.state.EPLStats.allStats.mostCleanSheets;
    },

    mostSaves() {
      return store.state.EPLStats.allStats.mostSaves;
    },

    mostYellows() {
      return store.state.EPLStats.allStats.mostYellows;
    },

    mostReds() {
      return store.state.EPLStats.allStats.mostReds;
    },

    mostMinutesPlayed() {
      return store.state.EPLStats.allStats.mostMinutesPlayed;
    },
  },

  beforeMount() {
    this.isTeamLoading = true;
    store.dispatch("Team/setAllTeams");
    store.dispatch("Player/sortByPosition");
    setTimeout(() => {
      this.isTeamLoading = false;
    }, 2000);

    // activate modal if required -> when routed from fixtures page
    if (this.$route.query.modal == 1) {
      this.showModal = true;
      this.$router.replace({ modal: null });
    }

    // get stats
    this.getEPLStatsFromAPI();
  },
};
</script>
<style scoped>
.spacer {
  height: 32px;
}
.no-teams-container {
  display: grid;
  place-items: center;
  height: 450px;
  width: 100%;
}
.stats-cards {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
/* Icons */
.extra-small-icon {
  width: 7px;
  height: fit-content;
  object-fit: contain;
}
.small-icon {
  width: 15px;
  height: fit-content;
  object-fit: contain;
}
.teams-main-container {
  width: 100%;
}
.team-search-bar {
  width: 20%;
  height: 32px;
  margin-left: 80%;
  padding: 0 3px;
  outline: none;
}
.teams-header-container {
  margin-top: var(--spacing-medium);
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  /*  */
  position: relative;
  z-index: 1;
}
.teams-title {
  font-size: var(--text-medium);
}
.teams-add-new {
  font-size: 16px;
  position: absolute;
  right: 0%;
  background: var(--primary-900);
  padding: 5px 22px 5px 16px;
  color: var(--neutral-100);
  display: flex;
}
.teams-add-new > div {
  width: 20px;
  height: 20px;
  background: var(--primary-800);
  border-radius: 50%;
  display: grid;
  place-items: center;
  margin-right: 6px;
}
.teams-sorter-header {
  display: flex;
  width: 100%;
  margin-top: 24px;
}
.teams-id-header {
  width: 5%;
}
.teams-team-header {
  width: 42.5%;
}
.teams-won-header {
  width: 7.5%;
}
.teams-draw-header {
  width: 7.5%;
}
.teams-gd-header,
.teams-pts-header,
.teams-ga-header,
.teams-gf-header,
.teams-lost-header {
  width: 7.5%;
}
* {
  padding: 0;
  margin: 0;
  font-family: "Rajdhani", sans-serif;
  box-sizing: border-box;
  outline: none;
  user-select: none;
  list-style-type: none;
  text-decoration: none;
  transition: all 400ms;
  overflow-x: hidden;
}
/* ===================== */
@import url("https://fonts.googleapis.com/css2?family=Cinzel+Decorative:wght@400;700&display=swap");
body {
  background: rgba(0, 0, 0, 0.1);
  /* background: url(https://image.freepik.com/free-vector/abstract-gradient-shapes-background_79603-156.jpg); */
  backdrop-filter: blur(10px);
}
.main-wrapper {
  background: rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(6px);
}
.user-wrapper b {
  filter: brightness(150%);
}
.video-1,
.video-2 {
  z-index: -999;
  position: fixed;
  width: fit-content;
  height: 100%;
  top: 0;
}
.video-2 {
  visibility: hidden;
}
.light .video-2 {
  visibility: visible;
}
.light .video-1 {
  display: none;
}
.search {
  position: relative;
  width: 40px;
  height: 60px;
  border-radius: 30px;
  transition: var(--transition);
  box-shadow: 0 0 0 5px rgba(183, 204, 235, 0.378);
  overflow: hidden;
}
.search:hover,
.search:active,
.search:focus {
  width: 400px;
}
body.light .search.active {
  width: 350px;
}
.search .icon {
  position: relative;
  top: 0;
  left: 0;
  width: 40px;
  height: 60px;
  border-radius: 50px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}
.search:hover .search-rotate {
  transform: rotate(100deg);
  position: absolute;
}
.search .icon::before {
  content: "";
  position: absolute;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  border: 3px solid var(--new-content);
  transform: translate(-4px, -4px);
}
.search .icon::after {
  content: "";
  position: absolute;
  width: 3px;
  height: 12px;
  background: var(--new-content);
  transform: translate(6px, 6px) rotate(315deg);
}
.search .input {
  position: relative;
  width: 300px;
  height: 60px;
  left: 60px;
  /* top: -100%; */
  transition: var(--transition);
  display: flex;
  justify-content: center;
  align-items: center;
}
.search .input input {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  border: none;
  font: 600 1.2rem rajdhani;
  background: var(--orange);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  outline: none;
  padding-left: 10px;
}
.dis-wrap {
  position: absolute;
  top: 5rem;
  display: flex;
  justify-content: center;
  left: 55%;
  z-index: auto;
  background: #000;
  border-radius: 12px;
  padding: 10px;
  animation: fade 1s ease-in infinite;
}
.dis-warn {
  position: absolute;
  top: 5rem;
  display: flex;
  justify-content: center;
  left: 55%;
  z-index: auto;
  background: #000;
  border-radius: 12px;
  padding: 10px;
}
@keyframes fade {
  50% {
    opacity: 0.2;
  }
}
.display {
  text-transform: uppercase;
  font: 600 2rem rajdhani;
  background: linear-gradient(45deg, #cc03c9, #009dff, #00ffff);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
.light .display {
  filter: brightness(140%);
}
/* ======================= */
.light .search {
  box-shadow: 0 2px 2px 2px #e70558;
}
.light .search .icon::before {
  border: 3px solid #e70558;
}
.light .search .icon::after {
  background: var(--pink);
}
/* ===================== */
.switch {
  position: absolute;
  top: 99px;
  left: calc(50% - 75px);
  max-height: 80px;
  max-width: 160px;
  display: flex;
  justify-content: center;
  align-items: center;
}
#toggle {
  position: relative;
  display: block;
  width: 80px;
  height: 60px;
  border-radius: 50px;
  backdrop-filter: blur(6px);
  box-shadow: inset 0 5px 6px rgb(0 0 0 / 27%), inset 0 3px 6px rgb(0 0 0 / 6%),
    inset 0 -5px 6px rgb(0 0 0 / 21%);
  cursor: pointer;
  transition: var(--transition);
}
#toggle:hover {
  width: 160px;
}
#toggle:after {
  content: "LIGHT";
  position: absolute;
  left: 84px;
  top: 13px;
  color: #ffffff00;
  font-weight: 600;
  font-size: 29px;
}
#toggle:hover:after,
#dashboard:hover,
#kleenpulse:hover {
  text-transform: uppercase;
  background: linear-gradient(-140deg, #fff, #0ff, #ff004c, #ffcc00, #0ff);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-size: 200% 200%;
  animation: anime 6s linear infinite;
}
#toggle .fas.fa-moon,
#toggle .fas.fa-sun {
  position: absolute;
  left: 27px;
  top: 21px;
  z-index: 2;
  font-size: 1.6rem;
}
#toggle .fas.fa-sun {
  opacity: 0;
}
.light #toggle .fas.fa-moon {
  opacity: 0;
}
.light #toggle .fas.fa-sun {
  opacity: 1;
  top: 16px;
  font-size: 1.9rem;
  background: var(--pink);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
#toggle .indicator {
  position: absolute;
  left: 0;
  top: 0;
  width: 80px;
  height: 100%;
  background: #c3c2c2;
  cursor: pointer;
  border-radius: 50%;
  transform: scale(0.9);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2), inset 0 10px 3px var(--indicator);
}
#toggle:hover .indicator {
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2), inset 0 -10px 3px var(--indicator);
}
#toggle .indicator:active,
body.light #toggle .indicator:active {
  transform: scale(0.7);
}
/* #toggle.active .indicator {
    left: calc(160px / 2);
} */
/* DARK MODE STYLING BEGINS HERE! */
body.light #toggle {
  background: #000b11;
  box-shadow: inset 2px 11px 5px rgb(0 0 0), inset 0 4px 13px #d20260,
    inset 0 4px 0px #d20260;
}
body.light #toggle:after {
  content: "DARK";
  position: absolute;
  left: 83px;
  top: 13px;
  font-weight: 600;
  font-size: 29px;
}
body.light #toggle .indicator {
  background: transparent;
  cursor: pointer;
  border-radius: 50%;
  transform: scale(0.9);
  box-shadow: 0 3px 12px rgb(0 0 0), inset 0 4px 4px #d20260,
    inset 0 -2px 4px #d20260;
}
body.light #toggle:hover .indicator {
  box-shadow: 0 3px 12px rgb(0 0 0), inset 0 1px 1px #d20260,
    inset 0 -7px 0px #d20260;
}
body.light .switch {
  background: transparent;
  overflow: hidden;
  display: block;
}
body.light .card-single {
  box-shadow: 0 0 10px #00d9ff;
  border-radius: 10px;
}
body.light .card-single:hover {
  box-shadow: 0 0 0px;
}
body.light .card-single:hover h1 {
  color: var(--content-BG);
}
body.light .card-single div:last-child span {
  color: var(--dark-text);
}
body.light header {
  border-bottom: 1px solid rgba(6, 204, 239, 0.548);
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6);
}
body.light header h2 {
  color: cyan;
}
body.light .sidebar {
  box-shadow: 5px 0 20px rgba(0, 0, 0, 0.7);
  z-index: 999;
}
.light .sidebar li a span {
  font-size: 1.5rem;
  filter: brightness(140%);
  background: var(--orange);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
body.light .sidebar-menu a:hover {
  background: transparent;
  color: #0ff;
  padding-top: 0.7rem;
  padding-bottom: 1rem;
  border-radius: 30px 0 0 30px;
  border: 1px solid #0ff;
}
body.light .card-single:hover {
  background: linear-gradient(45deg, #00616c, #00f7ff);
  filter: brightness(100%);
}
body.light .card-header {
  border-bottom: 1px solid var(--dark-text);
}
body.light thead tr {
  border-top: 1px solid #d20260;
  border-bottom: 1px solid #d20260;
}
body.light td {
  color: #fff;
}
body.light .contact span {
  color: var(--dark-text);
}
body.light .card-header button:hover {
  background: transparent;
  border: 1px solid cyan;
  color: cyan;
}
/* DARK MODE STYLING ENDS HERE! */
#pop-wrap {
  display: none;
  font-size: 4vmin;
  position: fixed;
  width: auto;
  min-width: 20vw;
  height: auto;
  top: 50%;
  left: 50%;
  text-align: center;
  transform: translate(-50%, -50%);
}
#pop-wrap .pop-up {
  background: var(--main-color);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
/* ===========SIDEBAR========== */
.sidebar {
  width: 250px;
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(6px);
  box-shadow: 5px 0 10px rgba(0, 0, 0, 0.3);
  z-index: 100;
  transition: width 300ms;
}
.sidebar-brand {
  height: 90px;
  padding: 1rem 0rem 1rem 2rem;
  /* 	color:#fff; */
}
.sidebar-brand span {
  display: inline-block;
  padding-right: 1rem;
}
.sidebar-brand h2 span:last-child,
.sidebar-brand h2 span:first-child {
  filter: brightness(140%);
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  text-transform: uppercase;
}
.sidebar-menu li {
  width: 100%;
  margin-bottom: 1.7rem;
  padding-left: 1rem;
}
.sidebar-menu a {
  padding-left: 1rem;
  display: block;
  color: var(--off-white);
  text-transform: uppercase;
  font-weight: 500;
  font-size: 1.1rem;
  overflow: hidden;
}
.sidebar-menu a:hover {
  /* background: var(--off-white); */
  /* color: var(--icon-color); */
  padding-top: 0.7rem;
  padding-bottom: 1rem;
  border: 1px solid rgba(255, 255, 255, 0.62);
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(6px);
  border-radius: 30px 0 0 30px;
}
.sidebar-menu a span:first-child {
  font-size: 1.5rem;
  padding-right: 1rem;
  transform: translatey(5px);
}
.sidebar-menu {
  margin-top: 1rem;
}
#nav-toggle:checked + .sidebar {
  width: 70px;
}
#nav-toggle:checked + .sidebar {
  width: 70px;
}
#nav-toggle:checked + .sidebar .sidebar-brand,
#nav-toggle:checked + .sidebar li {
  padding-left: 1rem;
  text-align: center;
}
#nav-toggle:checked + .sidebar li a {
  padding-left: 0rem;
}
#nav-toggle:checked + .sidebar .sidebar-brand h2 span:last-child,
#nav-toggle:checked + .sidebar li a span:last-child {
  display: none;
}
/* ===========SIDEBAR========== */
#nav-toggle:checked ~ .main-content {
  margin-left: 70px;
}
#nav-toggle:checked ~ .main-content header {
  width: calc(100% - 70px);
  left: 70px;
}
.main-content {
  transition: margin-left 300ms;
  margin-left: 250px;
  background: rgba(0, 0, 0, 0.2);
}
/* ====GLASSMORPHISM CHANGE HERE!==== */
header {
  /* 	background:#fff; */
  background: var(--new-BG);
  display: flex;
  justify-content: space-between;
  padding: 1rem 1.5rem;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  position: fixed;
  left: 250px;
  width: calc(100% - 250px);
  top: 0;
  z-index: 100;
  transition: left 300ms;
}
#nav-toggle {
  display: none;
}
/* ====GLASSMORPHISM CHANGE HERE!==== */
header h2 {
  color: #fff;
  text-transform: uppercase;
}
header label span {
  font-size: 1.7rem;
  padding-left: 1rem;
}
.search-wrapper {
  border: 1px solid #ccc;
  border-radius: 30px;
  height: 50px;
  display: flex;
  align-items: center;
  overflow-x: hidden;
}
.search-wrapper:focus,
.search-wrapper:hover {
  border: 1px solid var(--icon-color);
}
.search-wrapper input {
  height: 100%;
  padding: 0.5rem;
  border: none;
  background: transparent;
}
input {
  color: #fff;
  font-size: 15px;
}
.search-wrapper span {
  display: inline-block;
  padding: 0rem 1rem;
  font-size: 1.5rem;
  color: var(--new-content);
}
.user-wrapper {
  display: flex;
  align-items: center;
  padding: 0 10px;
}
.light .user-wrapper {
  border-left: 4px solid #ea0565;
}
.user-wrapper img {
  border-radius: 50%;
  margin-right: 1rem;
}
.user-wrapper div h4 {
  color: #fff;
}
.user-wrapper small {
  display: inline-block;
  color: #e0e0e0;
}
body.light h4 {
  background: var(--orange);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
/* ====GLASSMORPHISM CHANGE HERE!==== */
main {
  padding: 1rem 1.5rem;
  min-height: calc(100vh - 90px);
}
/* ====GLASSMORPHISM CHANGE HERE!==== */
.heading {
  color: #fff;
}
body.light .heading {
  filter: brightness(140%);
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
.cards {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 1.2rem;
  margin-top: 1rem;
  padding: 30px;
  overflow: hidden;
  height: auto;
}
.card-single {
  display: flex;
  justify-content: space-between;
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(16px);
  padding: 1.2rem;
  border-radius: 5px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  filter: brightness(120%);
  transition: all 400ms;
}
.cards .card-single {
  height: 150px;
}
.card-single:hover {
  transform: scale(1.04);
  border-radius: 25px;
}
.card-single div:last-child span {
  font-size: 3rem;
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
.card-single div:first-child span {
  text-transform: uppercase;
  color: #fff;
}
.card-single:hover,
.card:hover,
.light .card {
  background: rgba(0, 0, 0, 0.564);
}
.light .card:hover {
  background: rgba(0, 0, 0, 0.713);
}
.card-single:hover h1,
.card-single:hover div:last-child span {
  filter: brightness(140%);
}
.card-single:hover h1,
.card-single:hover div:last-child span {
  filter: brightness(140%);
}
.recent-grid {
  margin-top: 3.5rem;
  display: grid;
  grid-gap: 2rem;
  grid-template-columns: 65% auto;
}
.card {
  /* 	background:#fff; */
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(16px);
  border-radius: 10px;
}
/* =========COUNTER=========== */
sup,
b {
  background: var(--moon);
  -webkit-text-fill-color: transparent;
}
</style>
