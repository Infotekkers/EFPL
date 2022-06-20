<template>
  <div class="main-modal-container">
    <!-- Close button -->
    <div class="main-modal-close" @click="$emit('closeModal')">X</div>
    <!-- Close button -->

    <!-- Content -->
    <div v-if="getTeams.length > 0" class="main-modal-content">
      <!-- Logo Area -->
      <div class="player-model-image-section">
        <!-- Logo Preview -->
        <div class="player-modal-image-preview" ref="preview">
          <div
            class="player-modal-image-remove"
            @click="removeImage"
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
            <label for="playerName" class="main-label">{{ $t("Name") }}</label>
            <input
              name="playerName"
              type="text"
              ref="playerName"
              required
              v-model="playerName"
              class="main-text-input"
            />
          </div>
          <!-- Player Name -->

          <!-- Player Name -->
          <div class="container-col input-container">
            <label for="playerName" class="main-label"
              >{{ $t("Name") }} {{ $t("Amharic") }}</label
            >
            <input
              name="playerNameAmh"
              type="text"
              ref="playerNameAmh"
              required
              v-model="playerNameAmh"
              class="main-text-input"
            />
          </div>
          <!-- Player Name -->

          <!-- Player Team -->
          <div class="container-col input-container">
            <label for="PlayerTeam" class="main-label">{{ $t("Team") }}</label>

            <select
              name="PlayerTeam"
              ref="playerTeam"
              class="main-select-input"
            >
              <option
                v-for="team in getTeams"
                :key="team.teamName"
                :v-model="playerTeam"
              >
                {{ team.teamName }}
              </option>
            </select>
          </div>
          <!-- Player Team -->

          <!-- Player Stadium -->
          <div class="container-col input-container">
            <label for="PlayerPosition" class="main-label">{{
              $t("Position")
            }}</label>
            <select
              name="PlayerPosition"
              ref="playerPosition"
              class="main-select-input"
            >
              <option
                value="GK"
                :selected="isEditMode ? getPlayer.position == 'GK' : ''"
              >
                {{ $t("GoalKeepers") }}
              </option>
              <option
                value="DEF"
                :selected="isEditMode ? getPlayer.position == 'DEF' : ''"
              >
                {{ $t("Defenders") }}
              </option>
              <option
                value="MID"
                :selected="isEditMode ? getPlayer.position == 'MID' : ''"
              >
                {{ $t("Midfielders") }}
              </option>
              <option
                value="ATT"
                :selected="isEditMode ? getPlayer.position == 'ATT' : ''"
              >
                {{ $t("Attackers") }}
              </option>
            </select>
          </div>
          <!-- Player Stadium -->
        </div>
        <!-- Player name & city  & stadium  -->

        <!-- Stadium Capacity & Foundation Year -->
        <div class="container-col">
          <!-- Current Price -->
          <div class="container-col input-container">
            <label for="currentPrice" class="main-label"
              >{{ $t("Price") }}
            </label>
            <input
              name="currentPrice"
              type="number"
              ref="playerPrice"
              required
              max="16"
              min="3"
              :value="isEditMode ? getPlayer.currentPrice : ''"
              class="main-text-input"
              :disabled="isEditMode && getLiveMatch == true"
            />
            <button @click="getSuggestedPrice">AI</button>
          </div>
          <!-- Current Price -->

          <!-- Injury Status -->
          <div class="container-col input-container">
            <label for="injuryStatus" class="main-label"
              >{{ $t("Injury") }} {{ $t("Status") }}</label
            >
            <select
              name="injuryStatus"
              class="main-select-input"
              ref="injuryStatus"
            >
              <option value="" :selected="isEditMode ? injuryStatus == '' : ''">
                Available
              </option>
              <option
                value="0"
                :selected="isEditMode ? injuryStatus == '0' : ''"
              >
                0%
              </option>
              <option
                value="25"
                :selected="isEditMode ? injuryStatus == '25' : ''"
              >
                25%
              </option>
              <option
                value="50"
                :selected="isEditMode ? injuryStatus == '50' : ''"
              >
                50%
              </option>
              <option
                value="75"
                :selected="isEditMode ? injuryStatus == '75' : ''"
              >
                75%
              </option>
            </select>
          </div>
          <!-- Injury Status -->

          <!-- Year -->
          <div class="container-col input-container">
            <label for="injuryMessage" class="main-label"
              >{{ $t("Injury") }} {{ $t("Message") }}</label
            >
            <input
              name="injuryMessage"
              type="text"
              ref="injuryMessage"
              :value="isEditMode ? injuryMessage : ''"
              class="main-text-input"
            />
          </div>
          <!-- Year -->

          <div class="player-modal-buttons-container">
            <div
              class="main-button player-modal-cancel-button"
              @click="cancelSave"
            >
              {{ $t("Cancel") }}
            </div>
            <div
              class="main-button-primary"
              v-on="
                isEditMode == true
                  ? { click: updatePlayer }
                  : { click: savePlayer }
              "
            >
              {{ $t("Save") }}
            </div>
          </div>
        </div>
        <!-- Stadium Capacity & Foundation Year -->
      </form>
    </div>
    <!-- Content -->

    <div v-else class="main-modal-content player-modal-no-teams">
      <div>{{ $t("No") }} {{ $t("Teams") }}</div>

      <div class="main-button-primary no-teams-add-button" @click="addNewTeam">
        <div>
          <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
        </div>
        {{ $t("Add") }}
      </div>
    </div>
  </div>
</template>

<script>
// TODO:FIX Form - make by v-model
import store from "../store/index";
import router from "../router/index";

// Icons
import { addIcon } from "@/utils/Icons";
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

      // models
      playerName: null,
      playerTeam: null,
      playerPosition: null,
      playerPrice: null,
      injuryStatus: null,
      injuryMessage: null,

      // Icons
      addIcon: addIcon,
    };
  },
  methods: {
    playerImageChange(e) {
      const files = e.target.files;
      // no file uploaded
      if (files.length == 0) {
        // console.log("No File");
      } else {
        const extension = files[0].name.split(".");

        // valid format
        if (this.allowedExtensions.includes(extension[extension.length - 1])) {
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
    addNewTeam() {
      // pass modal 1 to activate modal auto
      router.push({
        path: "/admin/teams",
        query: { modal: 1 },
      });
    },

    async savePlayer() {
      const playerName = this.$refs.playerName.value;
      const eplTeamId = this.$refs.playerTeam.value;
      const position = this.$refs.playerPosition.value;
      const currentPrice = this.$refs.playerPrice.value;
      const injuryStatus = this.$refs.injuryStatus.value;
      const injuryMessage = this.$refs.injuryMessage.value;
      const playerNameAmh = this.$refs.playerNameAmh.value;

      let playerImage = "";

      if (store.state.Player.imageChanged === true) {
        playerImage = await this.getBase64();
      }

      if (!playerName) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Player Name is required",
        });
      }
      //  else if (!eplTeamId) {
      //   store.dispatch("Global/setNotificationInfo", {
      //     showNotification: true,
      //     notificationType: "error",
      //     notificationMessage: "Team is required",
      //   });
      // } else if (!position) {
      //   store.dispatch("Global/setNotificationInfo", {
      //     showNotification: true,
      //     notificationType: "error",
      //     notificationMessage: "Position is required",
      //   });
      // }
      else if (!currentPrice) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Current Price is required",
        });
      }
      // else if (!injuryStatus) {
      //   store.dispatch("Global/setNotificationInfo", {
      //     showNotification: true,
      //     notificationType: "error",
      //     notificationMessage: "Injury Information is required",
      //   });
      // }

      // regexp player name & length
      else if (
        !/^[a-zA-Z,-,. ]*$/.test(playerName) ||
        playerName.length < 4 ||
        playerName.length > 56
      ) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Invalid Player Name",
        });
      }
      // player name amh
      else if (playerNameAmh.length < 4 || playerNameAmh.length > 56) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Invalid Player Name Amharic",
        });
      }
      // invalid price
      else if (
        currentPrice < 3.5 ||
        currentPrice > 30 ||
        !/^[0-9]*$/.test(currentPrice)
      ) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Invalid Player Price",
        });
      }
      // injury condition
      else if (
        injuryMessage.includes("@") ||
        injuryMessage.includes("<") ||
        injuryMessage.includes(">") ||
        injuryMessage.includes("$")
      ) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Invalid Injury Message",
        });
      }
      // final condition
      else {
        const playerData = {
          playerName,
          eplTeamId,
          position,
          currentPrice,
          injuryStatus,
          injuryMessage,
          playerImage,
          playerNameAmh,
        };

        if (this.selectedImage) {
          playerData.logoName = this.selectedImage.name
            ? this.selectedImage.name
            : "";
        }

        store.dispatch("Player/savePlayer", playerData);
        this.removeImage();
        this.$refs.inputForm.reset();
      }
    },
    async updatePlayer() {
      const playerName = this.$refs.playerName.value;
      const eplTeamId = this.$refs.playerTeam.value;
      const position = this.$refs.playerPosition.value;
      const currentPrice = this.$refs.playerPrice.value;
      const injuryStatus = this.$refs.injuryStatus.value;
      const injuryMessage = this.$refs.injuryMessage.value;
      const playerNameAmh = this.$refs.playerNameAmh.value;
      const availability = {
        injuryStatus: injuryStatus,
        injuryMessage: injuryMessage,
      };

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
        availability,
        logoName: this.selectedImage ? this.selectedImage.name : "",
        playerNameAmh,
      };
      const imageStatus = this.imageChanged;
      store.dispatch("Player/updatePlayer", updatedPlayer, imageStatus);
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
    setItem(player) {
      this.playerName = player.playerName;
      this.playerNameAmh = player.playerNameAmh;
      this.playerTeam = player.eplTeamId;
      this.playerPosition = player.position;
      this.playerPrice = player.currentPrice;
      this.injuryStatus = player.availability
        ? player.availability.injuryStatus
        : "Available";
      this.injuryMessage = player.availability
        ? player.availability.injuryMessage
        : "";
    },

    getSuggestedPrice() {
      const playerName = this.$refs.playerName.value;
      store.dispatch("Player/getSuggestedPrice", playerName);
    },
  },
  computed: {
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
      showPreview.style.backgroundImage = `url(${baseURL}${currentPlayer[0].playerImage})`;
      this.setItem(currentPlayer[0]);
      console.log(currentPlayer[0].availability);
      return currentPlayer[0];
    },

    getLiveMatch() {
      return store.state.Player.liveMatch;
    },
  },

  updated() {
    if (this.isEditMode) {
      this.getPlayer;
    }
  },
};
</script>
<style scoped>
.player-modal-image-section {
  /* display: none; */
  /* background: red; */
  width: 250px;
  height: 300px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
}
.player-model-image-section {
  display: none;
  background: red;
  height: 300px;
  /* display: flex; */
  flex-direction: column;
  justify-content: center;
  position: relative;
}

.player-modal-image-preview {
  /* display: none; */
  position: relative;
  width: 120px;
  height: 120px;
  margin-left: auto;
  margin-right: auto;
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
  margin-bottom: 24px;
  background: url("../assets/img/Player_Image_Placeholder_120x120.jpg");
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
  bottom: 16px;
  display: flex;
  right: 45px;
}

.player-modal-cancel-button {
  margin-right: 4px;
}
.player-modal-no-teams {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.no-teams-add-button {
  display: flex;
  margin-top: 32px;
}
.no-teams-add-button > div {
  width: 20px;
  height: 20px;
  background: var(--primary-800);
  border-radius: 50%;
  display: grid;
  place-items: center;
  margin-right: 6px;
}
</style>
