<template>
  <main class="season-import-modal-container">
    <h1>Teams</h1>
    <div class="season-import-teams">
      <div
        class="season-import-team-selector"
        v-for="legacyTeam in allLegacyTeams"
        :key="legacyTeam.teamId"
      >
        <TeamImportComponent :legacyTeam="legacyTeam" />
      </div>
    </div>

    <div @click="importAll">Save</div>
  </main>
</template>

<script>
import store from "../store/index";
import TeamImportComponent from "@/components/TeamImportComponent.vue";
export default {
  name: "SeasonImportModalComponent",
  props: {
    allLegacyTeams: Array,
    showModal: Boolean,
  },
  components: {
    TeamImportComponent,
  },
  methods: {
    importAll() {
      store.dispatch("Season/importAll");
    },
  },
  computed: {},
};
</script>

<style scoped>
.season-import-modal-container {
  width: 100%;
  height: 100vh;
  background: white;

  position: fixed;

  padding: 50px 32px;
  overflow-y: auto;
}

.season-import-teams {
  width: 80%;
  min-height: 150px;
  background: teal;
  margin: 16px;
  padding: 16px 4px;
}
.season-import-team-selector {
  width: 100%;
  min-height: 100px;
  background: yellow;
  margin-top: 32px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 32px 22px;
}
</style>
