<template>
  <main>
    <SeasonImportModalComponent
      :showModal="showModal"
      @closeModal="closeModal"
    />
    <h1>{{ $t("Settings") }}</h1>
    <div>
      <router-link :to="{ name: 'forgot-password' }"
        ><button>
          <h3>{{ $t("Reset") }}</h3>
        </button></router-link
      >
    </div>

    <div>
      <button @click="logOutAdmin">
        <h3>{{ $t("Logout") }}</h3>
      </button>
    </div>
    <div class="languageSelect">
      <label
        ><h2>{{ $t("Select language") }} :</h2></label
      >

      <select v-model="lang" @change="changeLang($event)">
        <option value="en">{{ $t("English") }}</option>

        <option value="am">{{ $t("Amharic") }}</option>
      </select>
    </div>

    <div>
      <button @click="initiateImport">{{ $t("Import") }}</button>
    </div>
    <div>
      <button @click="exportSeasonData">{{ $t("Export") }}</button>
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
    const lang = localStorage.getItem("lang") || "am";
    return {
      lang: lang,
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
    changeLang(event) {
      localStorage.setItem("lang", event.target.value);
      window.location.reload();
    },
  },
};
</script>

<style scoped></style>
