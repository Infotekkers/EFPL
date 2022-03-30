<template>
  <div class="container">
    <TeamModal
      v-show="showModal"
      @closeModal="closeModal"
      :isEditMode="isEditMode"
    />
    <!-- Header -->
    <div class="header">
      <!-- Title -->
      <div class="title">EFPL - {{ getSeason }} Teams</div>

      <!-- Add Button -->
      <div class="add" @click="activateModal">Add New</div>
    </div>
    <!-- Header -->

    <!-- Sorter Header -->
    <div class="sorterHeader">
      <div @click="sortByID">ID</div>
      <div @click="sortByName">Logo</div>
      <div @click="sortByName">Team Name</div>
      <div @click="sortByCity">City</div>
      <div @click="sortbyStadium">Stadium</div>
    </div>
    <!-- Sorter Header -->
    <div class="teams-container" v-if="getAllTeams.length > 0">
      <TeamComponent
        v-for="team in getAllTeams"
        :key="team.teamId"
        :team="team"
        @activateModalEdit="activateModalEdit"
      />
    </div>
  </div>
</template>

<style scoped>
.container {
  margin-top: 100px;
}
.header {
  display: flex;
  /* align-items: center; */
  justify-content: space-evenly;
}
.add {
  border: 1px solid black;
  padding: 3px 22px;
}
.sorterHeader {
  justify-content: space-between;
  margin: 60px;
  display: flex;
  background: grey;
  font-size: 20px;
  font-weight: bold;
}
.teams-container {
  text-align: start;
  margin: 60px;
  margin-top: 20px;
}
</style>

<script>
// Utils
import store from "../store/index";

// Components
import TeamComponent from "@/components/TeamComponent";
import TeamModal from "@/components/TeamModal";
export default {
  name: "TeamsComponent",
  components: {
    TeamComponent,
    TeamModal,
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
      console.log("EDit");
      this.isEditMode = true;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    sortByID() {
      console.log("Sorting By ID");
      store.dispatch("Team/sortByID");
    },
    sortByName() {
      console.log("Sorting By Name");
      store.dispatch("Team/sortByName");
    },
    sortByCity() {
      console.log("City");
      store.dispatch("Team/sortByCity");
    },
    sortbyStadium() {
      console.log("Sorting by Stadium");
      store.dispatch("Team/sortByStadium");
    },
  },

  computed: {
    getSeason() {
      const date = new Date().getFullYear().toString().split("");

      return date[2] + (date[3] - 1) + "/" + date[2] + date[3];
    },

    getAllTeams() {
      return store.state.Team.allTeams;
    },
  },

  beforeMount() {
    store.dispatch("Team/setAllTeams");
  },
};
</script>
