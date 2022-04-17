<template>
  <main class="season-import-modal-container" v-if="showModal">
    <!-- Close Button -->
    <div class="season-modal-close" @click="closeModal">X</div>
    <!-- Close Button -->

    <!-- Loading -->
    <div v-if="isLoading" class="loading-container">Loading..</div>
    <!-- Loading -->

    <div v-else class="season-modal-container">
      <!-- Teams Section -->
      <div v-if="getAllLegacyTeams.length > 0">
        <h1>Teams</h1>
        <TeamImportComponent
          v-for="legacyTeam in getAllLegacyTeams"
          :key="legacyTeam.teamId"
          :legacyTeam="legacyTeam"
        />

        <!-- Save Button -->
        <div class="season-modal-button-container">
          <div class="season-modal-cancel-button" @click="closeModal">
            Cancel
          </div>
          <div class="season-modal-save-button" @click="startImport">Save</div>
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
    }, 3000);
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
  background: rgba(0, 0, 0, 0.65);

  overflow-y: auto;
  padding: 80px 32px;
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
h1 {
  margin-top: 32px;
}
.loading-container {
  margin-left: auto;
  margin-right: auto;
  width: 75%;
  min-height: 300px;
  margin-top: 45px;

  background: white;

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

  background: white;

  display: flex;
  align-items: center;
  justify-content: center;
}
.season-modal-button-container {
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.season-modal-save-button {
  margin-left: 8px;
  width: fit-content;
  padding: 5px 22px;
  background: var(--primary-900);
  color: var(--neutral-100);
  font-size: 15px;
}
.season-modal-save-button,
.season-modal-cancel-button {
  margin-top: 36px;

  padding: 5px 22px;
  cursor: pointer;
}
</style>
