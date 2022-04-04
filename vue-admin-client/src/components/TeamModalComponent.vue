<template>
  <div class="team-modal-main-container">
    <!-- Close button -->
    <div class="team-modal-close" @click="closeModal">X</div>
    <!-- Close button -->

    <div class="team-modal-content">
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
            <label for="">Name</label>
            <input type="text" ref="teamName" v-model="teamName" />
          </div>
          <!-- Team Name -->

          <!-- Team City -->
          <div class="container-col input-container">
            <label for="">City</label>
            <input type="text" ref="teamCity" v-model="teamCity" />
          </div>
          <!-- Team City -->

          <!-- Team Stadium -->
          <div class="container-col input-container">
            <label for="">Stadium</label>
            <input type="text" ref="teamStadium" v-model="teamStadium" />
          </div>
          <!-- Team Stadium -->
        </div>
        <!-- Team name & city  & stadium  -->

        <!-- Stadium Capacity & Foundation Year -->
        <div class="container-col">
          <!-- Stadium -->
          <div class="container-col input-container">
            <label for="">Stadium Capacity </label>
            <input
              type="text"
              ref="stadiumCapacity"
              v-model="stadiumCapacity"
            />
          </div>
          <!-- Stadium -->

          <!-- Year -->
          <div class="container-col input-container">
            <label for="">Founded</label>
            <input
              class="input-number"
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
            <div class="team-modal-cancel-button" @click="cancelSave">
              Cancel
            </div>
            <div
              class="team-modal-save-button"
              v-on="
                isEditMode == true ? { click: updateTeam } : { click: saveTeam }
              "
            >
              Save
            </div>
          </div>
        </div>
        <!-- Stadium Capacity & Foundation Year -->
      </form>
    </div>
  </div>
</template>

<style scoped>
.team-modal-main-container {
  height: 100vh;
  width: 100%;
  display: grid;
  place-items: center;
  position: fixed;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.65);
  z-index: 2;
  overflow: hidden;
  color: var(--neutral-900);
}
.team-modal-close {
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
.team-modal-content {
  width: 55%;
  min-height: 300px;
  background: var(--neutral-100);
  display: flex;
  align-items: flex-start;
  padding: 30px 16px;
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
  background-size: cover;
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

input {
  outline: none;
  height: 30px;
  width: 130%;
  border: none;
  padding: 0 3.5px;
}
label {
  margin-bottom: 5px;
  font-size: 15px;
  color: var(--neutral-800);
}
.input-number {
  width: 195%;
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

.team-modal-cancel-button,
.team-modal-save-button {
  padding: 5px 22px;
  cursor: pointer;
}
.team-modal-save-button {
  background: var(--primary-900);
  color: var(--neutral-100);
  font-size: 15px;
}
.team-modal-cancel-button {
  margin-right: 4px;
}
</style>

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
      allowedExtensions: ["jpg", "png", "svg", "jpeg"],
      imageChanged: false,
      teamName: null,
      teamCity: null,
      teamStadium: null,
      stadiumCapacity: null,
      foundedIn: null,
    };
  },
  methods: {
    closeModal() {
      this.setItem("");
      this.removeImage();
      this.$emit("closeModal");
    },
    teamLogoChange(e) {
      const files = e.target.files;
      // no file uploaded
      if (files.length == 0) {
        console.log("No File");
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
      this.removeImage();
      this.$emit("closeModal");
    },
    async saveTeam() {
      const teamName = this.$refs.teamName.value;
      const teamCity = this.$refs.teamCity.value;
      const teamStadium = this.$refs.teamStadium.value;
      const stadiumCapacity = this.$refs.stadiumCapacity.value;
      const foundedIn = this.$refs.foundedIn.value;
      const teamLogo = await this.getBase64();

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
        //   TODO: Optimize image
        // https://www.youtube.com/watch?v=bXf_UdyDzSA
        const teamData = {
          teamName,
          teamCity,
          teamStadium,
          teamLogo,
          foundedIn,
          stadiumCapacity,
          logoName: this.selectedImage.name,
        };
        store.dispatch("Team/saveTeam", teamData);
        this.removeImage();
        this.setItem("");
      }
    },

    async updateTeam() {
      const teamName = this.$refs.teamName.value;
      const teamCity = this.$refs.teamCity.value;
      const teamStadium = this.$refs.teamStadium.value;
      let teamLogo = "";
      if (store.state.Team.imageChanged === true) {
        teamLogo = await this.getBase64();
      }

      const updatedTeam = {
        teamName,
        teamCity,
        teamStadium,
        teamLogo,
        logoName: this.selectedImage ? this.selectedImage.name : "",
      };
      const imageStatus = this.imageChanged;
      store.dispatch("Team/updateTeam", updatedTeam, imageStatus);
    },

    // Image processor
    getBase64() {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(this.selectedImage);
        reader.onload = () => resolve(reader.result);
        reader.onerror = (error) => reject(error);
      });
    },

    setItem(team) {
      console.log(team);
      this.teamName = team.teamName;
      this.teamCity = team.teamCity;
      this.teamStadium = team.teamStadium;
      this.stadiumCapacity = team.stadiumCapacity;
      this.foundedIn = team.foundedIn;
    },
  },
  computed: {
    getImageChanged() {
      return this.imageChanged;
    },
    getTeam() {
      const allTeams = store.state.Team.allTeams;

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
      // console.log(currentTeam);
      this.setItem(currentTeam[0]);
      return currentTeam[0];
    },
  },

  updated() {
    if (this.isEditMode) {
      this.getTeam;
    }

    console.log(this.isEditMode);
  },
};
</script>
