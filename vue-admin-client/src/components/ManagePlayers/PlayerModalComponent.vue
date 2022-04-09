<template>
  <div class="player-modal-main-container">
    <!-- Close button -->
    <div class="player-modal-close" @click="$emit('closeModal')">X</div>
    <!-- Close button -->
    <div class="player-modal-content">
      <!-- Logo Area -->
      <div class="player-model-image-section">
        <!-- Logo Preview -->
        <div class="player-modal-image-preview" ref="preview">
          <div
            class="player-modal-image-remove"
            @click="removImage"
            v-if="selectedImage != null"
          >
            X
          </div>
        </div>
        <!-- Logo Preview -->

        <!-- Player Image Selector -->
        <input
          type="file"
          class="input-file"
          ref="imageInput"
          @change="playerImageChange($event)"
        />
      </div>
      <!-- Player Image Selector -->
      <!-- Logo Area -->

      <!-- Player Info Input -->
      <form class="input-form" ref="inputForm">
        <!-- Player name & city & stadium -->
        <div class="container-col">
          <!-- Player Name -->
          <div class="container-col input-container">
            <label for="">Name</label>
            <input
              type="text"
              ref="playerName"
              :value="isEditMode ? getPlayer.playerName : ''"
            />
          </div>
          <!-- Player Name -->

          <!-- Player City -->
          <div class="container-col input-container">
            <label for="">Team</label>

            <select name="PlayerTeam" ref="eplTeamId">
              <option
                v-for="team in getTeams"
                :key="team.teamName"
                :value="team.teamName"
                :selected="
                  isEditMode ? getPlayer.teamName == team.teamName : ''
                "
              >
                {{ team.teamName }}
              </option>
            </select>
            <!-- <input
              type="text"
              ref="eplTeamId"
              :value="isEditMode ? getPlayer.eplTeamId : ''"
            /> -->
          </div>
          <!-- Player City -->

          <!-- Player Stadium -->
          <div class="container-col input-container">
            <label for="">Position</label>
            <select name="PlayerPosition" ref="position" id="">
              <option
                value="GK"
                :selected="isEditMode ? getPlayer.position == 'GK' : ''"
              >
                Goalkeeper
              </option>
              <option
                value="DEF"
                :selected="isEditMode ? getPlayer.position == 'DEF' : ''"
              >
                Defender
              </option>
              <option
                value="MID"
                :selected="isEditMode ? getPlayer.position == 'MID' : ''"
              >
                Midfielder
              </option>
              <option
                value="ATT"
                :selected="isEditMode ? getPlayer.position == 'ATT' : ''"
              >
                Attacker
              </option>
            </select>
            <!-- <input
              type="text"
              ref="position"
              :value="isEditMode ? getPlayer.position : ''"
            /> -->
          </div>
          <!-- Player Stadium -->
        </div>
        <!-- Player name & city  & stadium  -->

        <!-- Stadium Capacity & Foundation Year -->
        <div class="container-col">
          <!-- Stadium -->
          <div class="container-col input-container">
            <label for="">Price </label>
            <input
              type="text"
              ref="currentPrice"
              :value="isEditMode ? getPlayer.currentPrice : ''"
            />
          </div>
          <!-- Stadium -->

          <!-- Year -->
          <!-- TODO:MAKE Dropdown -->
          <div class="container-col input-container">
            <label for="">Injury Status</label>
            <input
              type="text"
              ref="injuryStatus"
              :value="isEditMode ? getPlayer.injuryStatus : ''"
            />
          </div>
          <!-- Year -->

          <!-- Year -->
          <div class="container-col input-container">
            <label for="">Injury Message</label>
            <input
              type="text"
              ref="injuryMessage"
              :value="isEditMode ? getPlayer.injuryMessage : ''"
            />
          </div>
          <!-- Year -->

          <div class="player-modal-buttons-container">
            <div class="player-modal-cancel-button" @click="cancelSave">
              Cancel
            </div>
            <div
              class="player-modal-save-button"
              v-on="
                isEditMode == true
                  ? { click: updatePlayer }
                  : { click: savePlayer }
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
<script>
import store from "../../store/index";
export default {
  name: "PlayerModal",
  props: {
    isEditMode: Boolean,
  },
  data() {
    return {
      selectedImage: null,
      allowedExtensions: ["jpg", "png", "svg", "jpeg"],
      imageChanged: false,
      // selectedTeam: ,
    };
  },
  methods: {
    playerImageChange(e) {
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

          store.dispatch("Player/setImageChanged", true);
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
      if (this.isEditMode == false) {
        this.removeImage();
        this.$refs.inputForm.reset();
      }
      this.$emit("closeModal");
    },
    async savePlayer() {
      const playerName = this.$refs.playerName.value;
      const eplTeamId = this.$refs.eplTeamId.value;
      const position = this.$refs.position.value;
      const currentPrice = this.$refs.currentPrice.value;
      const injuryStatus = this.$refs.injuryStatus.value;
      const injuryMessage = this.$refs.injuryMessage.value;
      const playerImage = await this.getBase64();

      if (!playerName) {
        console.log("Player Name is required");
      } else if (!eplTeamId) {
        console.log("Player Team is required.");
      } else if (!position) {
        console.log("position");
      } else if (!currentPrice) {
        console.log("price");
      } else if (!injuryStatus) {
        console.log("status");
      } else if (!injuryMessage) {
        console.log("Messgae");
      } else if (!this.selectedImage) {
        console.log("Image");
      } else {
        //   TODO: Optimize image
        // https://www.youtube.com/watch?v=bXf_UdyDzSA
        const playerData = {
          playerName,
          eplTeamId,
          position,
          currentPrice,
          injuryStatus,
          injuryMessage,
          playerImage,
          logoName: this.selectedImage.name,
        };
        store.dispatch("Player/savePlayer", playerData);
        this.removeImage();
        this.$refs.inputForm.reset();
      }
    },
    async updatePlayer() {
      const playerName = this.$refs.playerName.value;
      const eplTeamId = this.$refs.eplTeamId.value;
      const position = this.$refs.position.value;
      const currentPrice = this.$refs.currentPrice.value;
      const injuryStatus = this.$refs.injuryStatus.value;
      const injuryMessage = this.$refs.injuryMessage.value;
      let playerImage = "";
      if (store.state.Player.imageChanged === true) {
        playerImage = await this.getBase64();
      }
      const updatedPlayer = {
        playerName,
        eplTeamId,
        position,
        playerImage,
        currentPrice,
        injuryStatus,
        injuryMessage,
        logoName: this.selectedImage ? this.selectedImage.name : "",
      };
      const imageStatus = this.imageChanged;
      store.dispatch("Player/updatePlayer", updatedPlayer, imageStatus);
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
    // TODO:USE TEAM Store or MERGE
    getTeams() {
      return store.state.Player.allTeams;
    },
    getImageChanged() {
      return this.imageChanged;
    },
    getPlayer() {
      const allPlayers = store.state.Player.allPlayers;

      const baseURL = process.env.VUE_APP_API_BASE_URL;

      const currentPlayer = JSON.parse(
        JSON.stringify(
          allPlayers.filter((player) => {
            return player.playerId == store.state.Player.editPlayerId;
          })
        )
      );

      const showPreview = this.$refs.preview;
      console.log(showPreview);
      showPreview.style.backgroundImage = `url(${baseURL}${currentPlayer[0].playerImage})`;
      console.log(currentPlayer[0]);
      return currentPlayer[0];
    },
  },
};
</script>
<style scoped>
.player-modal-main-container {
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
.player-modal-close {
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
.player-modal-content {
  width: 55%;
  min-height: 300px;
  background: var(--neutral-100);
  display: flex;
  align-items: flex-start;
  padding: 30px 16px;
  position: relative;
}

.player-modal-image-section {
  width: 250px;
  height: 300px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
}

.player-modal-image-preview {
  position: relative;
  width: 120px;
  height: 120px;
  margin-left: auto;
  margin-right: auto;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  margin-bottom: 24px;
}
.player-modal-image-remove {
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

.player-modal-buttons-container {
  position: absolute;
  bottom: 22px;
  display: flex;
  right: 45px;
}

.player-modal-cancel-button,
.player-modal-save-button {
  padding: 5px 22px;
  cursor: pointer;
}
.player-modal-save-button {
  background: var(--primary-900);
  color: var(--neutral-100);
  font-size: 15px;
}
.player-modal-cancel-button {
  margin-right: 4px;
}
</style>
