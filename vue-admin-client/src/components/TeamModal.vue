<template>
  <div class="containerr">
    <div class="close" @click="$emit('closeModal')">X</div>

    <div class="content">
      <div class="image-section">
        <div class="preview" ref="preview">
          <div class="preview-close" @click="removeImage">X</div>
        </div>

        <input
          type="file"
          class="input-file"
          ref="imageInput"
          @change="teamLogoChange($event)"
        />
      </div>

      <form class="input-form" ref="inputForm">
        <div class="container-col">
          <label for="">Team Name :</label>
          <input
            type="text"
            ref="teamName"
            :value="isEditMode ? getTeam.teamName : ''"
          />
        </div>
        <div class="container-col">
          <label for="">Team City :</label>
          <input
            type="text"
            ref="teamCity"
            :value="isEditMode ? getTeam.teamCity : ''"
          />
        </div>
        <div class="container-col">
          <label for="">Team Stadium :</label>
          <input
            type="text"
            ref="teamStadium"
            :value="isEditMode ? getTeam.teamStadium : ''"
          />
        </div>
      </form>

      <div class="buttons">
        <div class="cancel" @click="cancelSave">Cancel</div>
        <div
          class="save"
          v-on="isEditMode ? { click: updateTeam } : { click: saveTeam }"
        >
          Save
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.container-col {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin-top: 32px;
}
.containerr {
  height: 100vh;
  width: 100%;
  display: grid;
  place-items: center;
  position: absolute;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.65);
}
.close {
  position: absolute;
  top: 100px;
  right: 32px;
}
.content {
  width: 60%;
  min-height: 300px;
  background: teal;
  display: flex;
  align-items: flex-end;
}
.image-section {
  width: 250px;
  height: 300px;
  background: red;
  display: flex;
  flex-direction: column;
}
.preview {
  position: relative;
  width: 250px;
  height: 250px;
  background: yellow;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
.show-preview {
  background: teal;
}
.preview-close {
  position: absolute;
  right: 5px;
  top: 5px;
}
.input-file {
  margin-top: 12px;
}
.input-form {
  margin-left: 16px;
}
input[type="text"] {
  outline: none;
  height: 32px;
}
.buttons {
  display: flex;
  width: 40%;
  justify-content: flex-end;
  background: yellow;
}
.cancel,
.save {
  border: 1px solid black;
  padding: 3px 22px;
}
.save {
  margin-left: 25px;
  background: green;
}
.cancel {
  background: red;
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
    };
  },
  methods: {
    teamLogoChange(e) {
      const files = e.target.files;
      // no file uploaded
      if (files.length == 0) {
        console.log("No File");
      } else {
        const extension = files[0].name.split(".");

        // valid format
        if (this.allowedExtensions.includes(extension[extension.length - 1])) {
          console.log(files[0]);
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
          console.log("Naah");
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
      this.removeImage();
      this.$refs.inputForm.reset();
      this.$emit("closeModal");
    },
    async saveTeam() {
      const teamName = this.$refs.teamName.value;
      const teamCity = this.$refs.teamCity.value;
      const teamStadium = this.$refs.teamStadium.value;
      const teamLogo = await this.getBase64();

      if (!teamName) {
        console.log("Team Name is required");
      } else if (!teamCity) {
        console.log("Team City is required.");
      } else if (!teamStadium) {
        console.log("Stadium");
      } else if (!this.selectedImage) {
        console.log("Image");
      } else {
        //   TODO: Optimize image
        // https://www.youtube.com/watch?v=bXf_UdyDzSA
        const teamData = {
          teamName,
          teamCity,
          teamStadium,
          teamLogo,
          logoName: this.selectedImage.name,
        };
        store.dispatch("Team/saveTeam", teamData);
        this.removeImage();
        this.$refs.inputForm.reset();
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
      console.log(showPreview);
      showPreview.style.backgroundImage = `url(${baseURL}${currentTeam[0].teamLogo})`;
      console.log(currentTeam[0]);
      return currentTeam[0];
    },
  },
};
</script>
