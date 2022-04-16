<template>
  <main>
    <SeasonImportModalComponent
      :showModal="showModal"
      @closeModal="closeModal"
    />
    <h1>Settings</h1>
    <div>
      <router-link :to="{ name: 'forgot-password' }"
        ><button>
          <h3>Reset</h3>
        </button></router-link
      >
    </div>

    <button @click="logOutAdmin">
      <h3>LogOut</h3>
    </button>

    <div>
      <button @click="initiateImport">Import</button>
    </div>
    <div>
      <button @click="exportSeasonData">Export</button>
    </div>
  </main>
</template>

<script>
// Components
import SeasonImportModalComponent from "@/components/SeasonImportModalComponent.vue";
import store from "@/store";

export default {
  components: {
    SeasonImportModalComponent,
  },
  data() {
    return {
      showModal: false,
    };
  },
  methods: {
    closeModal() {
      this.showModal = false;
    },

    initiateImport() {
      this.showModal = true;
    },
    exportSeasonData() {
      store.dispatch("Season/exportSeason");
    },
    logOutAdmin() {
      this.$store.dispatch("logOutAdmin");
    },
  },
};
</script>
