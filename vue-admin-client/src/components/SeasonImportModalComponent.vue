<template>
  <main class="season-import-modal-container" v-if="showModal">
    <!-- Close Button -->
    <div class="season-modal-close" @click="closeModal">X</div>
    <!-- Close Button -->

    <h1>Teams</h1>
    <TeamImportComponent
      v-for="legacyTeam in getAllLegacyTeams"
      :key="legacyTeam.teamId"
      :legacyTeam="legacyTeam"
    />

    <div class="season-modal-save-button" @click="startImport">Save</div>
  </main>
</template>

<script>
// Components
import TeamImportComponent from "@/components/TeamImportComponent.vue";
import store from "@/store";

export default {
  name: "SeasonImportModal",
  components: {
    TeamImportComponent,
  },
  props: {
    showModal: Boolean,
  },
  methods: {
    closeModal() {
      this.$emit("closeModal");
    },

    startImport() {
      store.dispatch("Season/initiateImport");
    },
  },
  computed: {
    getAllLegacyTeams() {
      return store.state.Season.allLegacyTeams;
    },
  },

  beforeMount() {
    store.dispatch("Season/getAllLegacyTeams");
  },
};
</script>

<style scoped>
.season-import-modal-container {
  width: 100%;
  min-height: 100vh;
  position: absolute;
  top: 0;
  left: 0;
  background: teal;

  overflow-y: auto;
  padding: 60px 0;
}
.season-modal-close {
  position: absolute;
  top: 40px;
  right: 32px;
  width: 30px;
  height: 30px;
  background: var(--neutral-100);
  color: var(--primary-900);
  font-size: 20px;
  display: grid;
  place-items: center;
  border-radius: 50%;
  font-weight: bold;
  cursor: pointer;
}
.team-import-container {
  margin: 36px 20px;
  width: 85%;
  background: yellow;
}
.team-import-content {
  min-height: 70px;
  width: 100%;
  display: flex;
  align-items: center;
  padding: 10px 16px;
  /*  */
  background: tomato;
}
.season-modal-save-button {
  border: 1px solid black;
  width: fit-content;
  margin-left: 32px;
  padding: 5px 22px;
}
</style>
