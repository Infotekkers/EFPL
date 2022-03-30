<template>
  <div class="container">
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
          <input type="text" ref="teamName" />
        </div>
        <div class="container-col">
          <label for="">Team City :</label>
          <input type="text" ref="teamCity" />
        </div>
        <div class="container-col">
          <label for="">Team Stadium :</label>
          <input type="text" ref="teamStadium" />
        </div>
      </form>

      <div class="buttons">
        <div class="cancel" @click="cancelSave">Cancel</div>
        <div class="save" @click="saveTeam">Save</div>
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
.container {
  height: 100vh;
  width: 100%;
  display: grid;
  place-items: center;
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
  data() {
    return {
      selectedImage: null,
      allowedExtensions: ["jpg", "png", "svg", "jpeg"],
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
      }
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
};
</script>
