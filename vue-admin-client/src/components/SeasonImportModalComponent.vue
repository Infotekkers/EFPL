<template>
  <main
    class="main-modal-container season-import-modal-container"
    v-if="showModal"
  >
    <!-- Close Button -->
    <div class="main-modal-close" @click="closeModal">X</div>
    <!-- Close Button -->

    <!-- Loading -->
    <div v-if="isLoading" class="loading-container">Loading..</div>
    <!-- Loading -->

    <div v-else class="season-modal-container">
      <!-- Teams Section -->
      <div v-if="getAllLegacyTeams.length > 0">
        <h1 class="season-import-modal-title">Teams</h1>
        <TeamImportComponent
          v-for="legacyTeam in getAllLegacyTeams"
          :key="legacyTeam.teamId"
          :legacyTeam="legacyTeam"
        />

        <!-- Save Button -->
        <div class="season-modal-button-container">
          <div
            class="main-button-secondary season-modal-cancel-button"
            @click="closeModal"
          >
            Cancel
          </div>
          <div
            class="main-button-primary season-modal-save-button"
            @click="startImport"
          >
            Save
          </div>
        </div>
        <!-- Save Button -->
      </div>
      <!-- Teams Section -->

      <!-- No teams -->
      <div v-else class="loading-container">No Teams to import</div>
      <!-- No teams -->
    </div>
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
  data() {
    return {
      isLoading: false,
    };
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
      this.$router.go();
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

  mounted() {
    setTimeout(() => {
      this.isLoading = false;
    }, 2000);
  },
};
</script>

<style scoped>
.season-import-modal-container {
  background: rgba(0, 0, 0, 0.65);
  overflow-y: auto;
  padding: 80px 32px;
}

.season-import-modal-title {
  margin-top: 32px;
}
.loading-container {
  margin-left: auto;
  margin-right: auto;
  width: 75%;
  min-height: 300px;
  margin-top: 45px;
  background: var(--neutral-100);
  display: flex;
  align-items: center;
  justify-content: center;
}
.season-modal-container {
  margin-left: auto;
  margin-right: auto;
  width: 75%;
  min-height: 300px;
  margin-top: 45px;
  padding: 0 0 50px 0;
  background: var(--neutral-100);
  display: flex;
  align-items: center;
  justify-content: center;
}
.season-modal-button-container {
  display: flex;
  align-items: center;
  justify-content: flex-end;
}

.season-modal-save-button,
.season-modal-cancel-button {
  margin-top: 36px;
}
</style>
