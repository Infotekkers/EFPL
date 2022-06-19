<template>
  <div class="main-modal-container">
    <!-- Close button -->
    <div class="main-modal-close" @click="closeModal">X</div>
    <!-- Close button -->

    <div class="main-modal-content team-modal-content">
      <!-- Logo Area -->
      <div class="team-modal-image-section">
        <!-- Logo Preview -->
        <div class="team-modal-image-preview" ref="preview">
          <div
            class="team-modal-image-remove"
            @click="removeImage"
            v-if="selectedImage != null"
          >
            X
          </div>
        </div>
        <!-- Logo Preview -->

        <!-- Team Logo Selector -->
        <input
          type="file"
          class="input-file"
          ref="imageInput"
          name="teamLogo"
          required
          @change="teamLogoChange($event)"
        />
      </div>
      <!-- Team Logo Selector -->
      <!-- Logo Area -->

      <!-- Team Info Input -->

      <form class="input-form" ref="inputForm">
        <!-- Team name & city & stadium -->
        <div class="container-col">
          <!-- Team Name -->
          <div class="container-col input-container">
            <label for="teamName" class="main-label">{{ $t("Name") }}</label>
            <input
              name="teamName"
              type="text"
              ref="teamName"
              v-model="teamName"
              class="main-text-input"
            />
          </div>
          <!-- Team Name -->

          <!-- Team Name Amh -->
          <div class="container-col input-container">
            <label for="teamName" class="main-label"
              >{{ $t("Name") }} {{ $t("Amharic") }}</label
            >
            <input
              name="teamNameAmh"
              type="text"
              ref="teamNameAmh"
              v-model="teamNameAmh"
              class="main-text-input"
            />
          </div>
          <!-- Team Name Amh -->

          <!-- Team City -->
          <div class="container-col input-container">
            <label for="teamCity" class="main-label">{{ $t("City") }}</label>
            <input
              name="teamCity"
              type="text"
              ref="teamCity"
              v-model="teamCity"
              class="main-text-input"
            />
          </div>
          <!-- Team City -->

          <!-- Team Stadium -->
          <div class="container-col input-container">
            <label for="teamStadium" class="main-label">{{
              $t("Stadium")
            }}</label>
            <input
              name="teamStadium"
              type="text"
              ref="teamStadium"
              v-model="teamStadium"
              class="main-text-input"
            />
          </div>
          <!-- Team Stadium -->
        </div>
        <!-- Team name & city  & stadium  -->

        <!-- Stadium Capacity & Foundation Year -->
        <div class="container-col">
          <!-- Coach -->
          <div class="container-col input-container">
            <label for="teamCoach" class="main-label">{{ $t("Coach") }} </label>
            <input
              name="teamCoach"
              type="text"
              ref="teamCoach"
              v-model="teamCoach"
              class="main-text-input"
            />
          </div>
          <!-- Coach -->

          <!-- Stadium -->
          <div class="container-col input-container">
            <label for="stadiumCapacity" class="main-label"
              >{{ $t("Stadium") }} {{ $t("Capacity") }}
            </label>
            <input
              name="stadiumCapacity"
              type="number"
              min="0"
              ref="stadiumCapacity"
              v-model="stadiumCapacity"
              class="main-text-input"
            />
          </div>
          <!-- Stadium -->

          <!-- Year -->
          <div class="container-col input-container">
            <label for="foundedIn" class="main-label">{{
              $t("Founded")
            }}</label>
            <input
              name="foundedIn"
              class="main-number-input"
              type="number"
              min="1900"
              max="2099"
              step="1"
              ref="foundedIn"
              v-model="foundedIn"
            />
          </div>
          <!-- Year -->

          <!-- Action Buttons -->
          <div class="team-modal-buttons-container">
            <div
              class="main-button team-modal-cancel-button"
              @click="cancelSave"
            >
              {{ $t("Cancel") }}
            </div>
            <div
              class="main-button-primary main-button team-modal-save-button"
              v-on="
                isEditMode == true ? { click: updateTeam } : { click: saveTeam }
              "
            >
              {{ $t("Save") }}
            </div>
          </div>
        </div>
        <!-- Stadium Capacity & Foundation Year -->
      </form>
    </div>
  </div>
</template>

<script>
// utils
import store from "../store/index";

export default {
  name: "TeamModal",
  props: {
    isEditMode: Boolean,
  },
  data() {
    return {
      selectedImage: null,
      allowedExtensions: ["jpg", "png", "jpeg"],
      imageChanged: false,
      teamName: null,
      teamNameAmh: null,
      teamCity: null,
      teamStadium: null,
      stadiumCapacity: null,
      foundedIn: null,
      teamCoach: null,
    };
  },
  methods: {
    closeModal() {
      this.setItem("");
      store.dispatch("Team/setEditTeamId", "");
      this.removeImage();
      this.$emit("closeModal");
    },
    teamLogoChange(e) {
      const files = e.target.files;
      // no file uploaded
      if (files.length == 0) {
        // TODO:Handle
        // console.log("No File");
      } else {
        const extension = files[0].name.split(".");
        // valid format
        if (this.allowedExtensions.includes(extension[extension.length - 1])) {
          this.selectedImage = files[0];
          const preview = this.$refs.preview;

          store.dispatch("Team/setImageChanged", true);
          //   Display on preview
          const reader = new FileReader();

          reader.addEventListener("load", function () {
            preview.style.backgroundImage = `url(${this.result})`;
          });
          reader.readAsDataURL(this.selectedImage);
        }
        // invalid format
        else {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `Invalid image format ${
              extension[extension.length - 1]
            }`,
          });
        }
      }
    },

    removeImage() {
      this.$refs.imageInput.value = "";
      this.$refs.preview.style.backgroundImage = ``;
    },
    cancelSave() {
      this.setItem("");
      store.dispatch("Team/setEditTeamId", "");
      this.removeImage();
      this.$emit("closeModal");
    },
    async saveTeam() {
      const teamName = this.$refs.teamName.value;
      const teamNameAmh = this.$refs.teamNameAmh.value;
      const teamCity = this.$refs.teamCity.value;
      const teamStadium = this.$refs.teamStadium.value;
      const stadiumCapacity = this.$refs.stadiumCapacity.value;
      const foundedIn = this.$refs.foundedIn.value;
      let teamLogo = "";
      if (store.state.Team.imageChanged === true) {
        teamLogo = await this.getBase64();
      }
      const teamCoach = this.$refs.teamCoach.value;

      if (!teamName) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Team Name is required",
        });
      } else if (!teamCity) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Team City is required",
        });
      } else if (!teamStadium) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Team Stadium is required",
        });
      } else if (!this.selectedImage) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Team Logo is required",
        });
      } else {
        const teamData = {
          teamName,
          teamCity,
          teamStadium,
          teamLogo,
          foundedIn,
          stadiumCapacity,
          logoName: this.selectedImage.name,
          teamCoach,
          teamNameAmh,
        };

        store.dispatch("Team/saveTeam", teamData);
        this.removeImage();
        this.setItem("");
      }
    },

    async updateTeam() {
      const teamName = this.$refs.teamName.value;
      const teamNameAmh = this.$refs.teamNameAmh.value;
      const teamCity = this.$refs.teamCity.value;
      const teamStadium = this.$refs.teamStadium.value;
      const teamCoach = this.$refs.teamCoach.value;
      let teamLogo = "";
      if (store.state.Team.imageChanged === true) {
        teamLogo = await this.getBase64();
      }

      const updatedTeam = {
        teamName,
        teamCity,
        teamStadium,
        teamLogo,
        teamCoach,
        teamNameAmh,
        logoName: this.selectedImage ? this.selectedImage.name : "",
      };
      const imageStatus = this.imageChanged;

      store.dispatch("Team/updateTeam", updatedTeam, imageStatus);

      // this.$router.go();
    },

    // Image processor
    getBase64() {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();

        if (reader) {
          reader.readAsDataURL(this.selectedImage);
          reader.onload = () => resolve(reader.result);
          reader.onerror = (error) => reject(error);
        }
      });
    },

    setItem(team) {
      this.teamName = team.teamName;
      this.teamCity = team.teamCity;
      this.teamStadium = team.teamStadium;
      this.stadiumCapacity = team.stadiumCapacity;
      this.foundedIn = team.foundedIn;
      this.teamCoach = team.teamCoach;
      this.teamNameAmh = team.teamNameAmh;
    },
  },
  computed: {
    getImageChanged() {
      return this.imageChanged;
    },
    getTeam() {
      const allTeams = store.state.Team.allTeams;

      if (allTeams.length > 0) {
        const baseURL = process.env.VUE_APP_API_BASE_URL;

        const currentTeam = JSON.parse(
          JSON.stringify(
            allTeams.filter((team) => {
              return team.teamId == store.state.Team.editTeamId;
            })
          )
        );

        const showPreview = this.$refs.preview;
        showPreview.style.backgroundImage = `url(${baseURL}${currentTeam[0].teamLogo})`;
        this.setItem(currentTeam[0]);
        return currentTeam[0];
      } else {
        return "";
      }
    },
  },

  updated() {
    if (this.isEditMode) {
      this.getTeam;
    }
  },
};
</script>

<style scoped>
.team-modal-content {
  position: relative;
}
.team-modal-image-section {
  width: 250px;
  height: 300px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
}
.team-modal-image-preview {
  position: relative;
  width: 120px;
  height: 120px;
  margin-left: auto;
  margin-right: auto;
  background: url("../assets/img/Team_Logo_Placeholder.jpg");
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
  margin-bottom: 24px;
}
.team-modal-image-remove {
  position: absolute;
  right: 5px;
  top: 5px;
}
.input-form {
  margin-left: 20px;
  display: flex;
  justify-content: space-around;
  align-content: flex-start;
  width: 100%;
}
.input-form > .container-col {
  width: 40%;
}

/* General Class */
.container-col {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
.container-row {
  display: flex;
  flex-direction: row;
}
.input-container {
  margin-top: 26px;
}
.team-modal-buttons-container {
  position: absolute;
  bottom: 22px;
  display: flex;
  right: 45px;
}
.team-modal-cancel-button {
  margin-right: 4px;
}
</style>
