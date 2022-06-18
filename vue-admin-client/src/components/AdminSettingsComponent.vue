<template>
  <main>
    <SeasonImportModalComponent
      :showModal="showModal"
      @closeModal="closeModal"
    />

    <ConfirmModalComponent
      :showConfirmModal="showConfirmModal"
      modalMessage="This action will delete the teams , fixtures and players from the current season. Are you sure you want to continue ?"
      :boldWords="[
        'teams',
        'players',
        'fixtures',
        'current',
        'season',
        'sure',
        'continue',
      ]"
      :saveAction="exportSeasonDataModal"
      @closeModal="closeConfirmModal"
    />
    <h1>{{ $t("Settings") }}</h1>
    <!-- account settings -->
    <button class="collapseAcc" @click="toggleAcc()">
      <span>{{ $t("Manage Account") }}</span>
    </button>
    <div v-if="accMenu" class="accMenu">
      <div>
        <router-link :to="{ name: 'change-password' }"
          ><button class="accLink-1">
            <h3>{{ $t("Change Password") }}</h3>
          </button></router-link
        >
      </div>

      <div>
        <button class="accLink-2" @click="logOutAdmin">
          <h3>{{ $t("Logout") }}</h3>
        </button>
      </div>
    </div>

    <!-- language settings -->
    <div>
      <button class="collapseLang" @click="toggleLang()">
        <span>{{ $t("Select language") }}</span>
      </button>
    </div>
    <div v-if="langMenu" class="languageSelect">
      <select v-model="lang" @change="changeLang($event)" class="lang-selector">
        <option value="en">{{ $t("English") }}</option>

        <option value="am">{{ $t("Amharic") }}</option>
      </select>
    </div>

    <!-- contact page  -->
    <div class="contact-page">
      <router-link :to="{ name: 'contact' }"
        ><button class="contactButton">
          {{ $t("Contact Us") }}
        </button></router-link
      >
    </div>
    <!-- import export  -->
    <button class="collapseSeason" @click="toggleSeason()">
      <span>{{ $t("Import") }} / {{ $t("Export") }}</span>
    </button>
    <div v-if="seasonMenu" class="seasonSetting">
      <div>
        <button @click="initiateImport" class="import">
          {{ $t("Import") }}
        </button>
      </div>
      <div>
        <button @click="exportSeasonData" class="export">
          {{ $t("Export") }}
        </button>
      </div>
    </div>
  </main>
</template>

<script>
// utils
import store from "@/store";

// Components
import SeasonImportModalComponent from "@/components/SeasonImportModalComponent.vue";
import ConfirmModalComponent from "@/components/ConfirmModalComponent.vue";

export default {
  components: {
    SeasonImportModalComponent,
    ConfirmModalComponent,
  },
  data() {
    const lang = localStorage.getItem("lang") || "am";
    return {
      lang: lang,
      showModal: false,
      accMenu: false,
      langMenu: false,
      seasonMenu: false,

      //
      showConfirmModal: false,
    };
  },
  methods: {
    closeConfirmModal() {
      this.showConfirmModal = false;
    },
    toggleAcc() {
      this.accMenu = !this.accMenu;
    },
    toggleLang() {
      this.langMenu = !this.langMenu;
    },
    toggleSeason() {
      this.seasonMenu = !this.seasonMenu;
    },

    closeModal() {
      this.showModal = false;
    },

    initiateImport() {
      this.showModal = true;
    },
    async exportSeasonData() {
      // get season data
      await store.dispatch("Season/getSeasonStatus");

      const isSeasonComplete = store.state.Season.isSeasonComplete;

      if (isSeasonComplete) {
        this.showConfirmModal = true;
      } else {
        store.dispatch("Season/exportSeason", "partial");
      }
    },

    exportSeasonDataModal() {
      store.dispatch("Season/exportSeason", "complete");

      this.closeModal();
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

<style scoped>
@import "../assets/design-system.css";

.collapseAcc,
.collapseLang,
.contactButton,
.collapseSeason {
  width: 80%;
  height: 60px;
  border: 1px solid transparent;
  border-radius: 10px;
  background: var(--neutral-400);
  color: var(--neutral-900);
  font-size: var(--text-medium);
  margin: var(--spacing-regular);
}
.collapseAcc:hover,
.collapseLang:hover,
.contactButton:hover,
.collapseSeason:hover,
.accLink-1:hover,
.accLink-2:hover,
.import:hover,
.export:hover {
  background: var(--neutral-900);
  color: var(--neutral-50);
}
.accMenu,
.languageSelect,
.seasonSetting {
  margin-top: -20px;
  height: 60px;
}

.accLink-1,
.accLink-2,
.import,
.export {
  width: 80%;
  height: 30px;
  background-color: var(--neutral-50);
  border: none;
}

.lang-selector {
  width: 80%;
  height: 30px;
  border: none;
}
@media screen and (max-width: 768px) {
  .collapseAcc,
  .collapseLang,
  .contactButton,
  .collapseSeason {
    width: 100%;
  }
}
</style>
