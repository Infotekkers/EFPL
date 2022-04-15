<template>
  <main>
    <SeasonImportModalComponent
      :allLegacyTeams="getAllLegacyTeams"
      :showModal="true"
    />

    <div class="season-settings-container">
      <h1>Season</h1>

      <div class="button-container">
        <div @click="initiateImport">Import</div>
        <div @click="exportSeasonData">Export</div>
      </div>
    </div>
  </main>
</template>

<script>
import store from "../store/index";

// Components
import SeasonImportModalComponent from "@/components/SeasonImportModalComponent.vue";
export default {
  name: "SeasonSettingsComponent",
  props: {},
  components: {
    SeasonImportModalComponent,
  },
  methods: {
    exportSeasonData() {
      store.dispatch("Season/exportBackUp");
    },
  },
  computed: {
    getAllLegacyTeams() {
      return store.state.Season.allLegacyTeams;
    },
  },
  data() {
    return {};
  },

  beforeMount() {
    store.dispatch("Season/setAllLegacyTeams");
  },
};
</script>

<style scoped>
.season-settings-container {
  margin-left: auto;
  width: 80%;
  min-height: 100vh;
  background-color: teal;

  padding-top: 80px;
}
.button-container {
  display: flex;
}
.button-container > div {
  margin-left: 32px;
  margin-top: 32px;
  padding: 5px 22px;
  border: 1px solid black;
}
</style>
