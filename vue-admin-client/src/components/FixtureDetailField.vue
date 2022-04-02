<template>
  <div>
    <div class="main">
      <div class="field">
        <div
          id="gk"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'gk')"
          @drop.prevent="lockerPlayerDrop"
        >
          <label>GK</label>
        </div>
        <div
          id="def"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'def')"
          @drop.prevent="lockerPlayerDrop"
        >
          <label>DEF</label>
        </div>
        <div
          id="mid"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'mid')"
          @drop.prevent="lockerPlayerDrop"
        >
          <label>MID</label>
        </div>
        <div
          id="att"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'att')"
          @drop.prevent="lockerPlayerDrop"
        >
          <label>ATT</label>
        </div>
        <div
          id="bench"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'bench')"
          @drop.prevent="lockerPlayerDrop"
        >
          <label>SUBS</label>
        </div>
      </div>
      <div class="locker-room">
        <div
          draggable="true"
          @dragstart="lockerPlayerDragStart($event, player.position)"
          class="locker-player"
          :key="player.playerId"
          v-for="player in this.players[this.activeTeamId]"
        >
          <p>
            {{ player.playerName }}
          </p>
          <h5>
            {{ player.position }}
          </h5>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapFields } from "vuex-map-fields";

export default {
  props: {
    activeTeamId: String,
  },

  computed: {
    ...mapFields("Fixture", ["fixtureDetailData", "players"]),
  },

  data: () => ({}),

  methods: {
    lockerPlayerDragStart(e, playerPosition) {
      let lockerPlayerDiv = e.target;
      let fieldPlayerDiv = document.createElement("div");

      fieldPlayerDiv.className = "field-player";
      // TODO: ADD Jersey
      fieldPlayerDiv.innerHTML = `<span>🤷‍♂️</span>${lockerPlayerDiv.innerHTML}`;

      // TODO: ADD Drag Image
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";
      e.dataTransfer.setData("text/html", fieldPlayerDiv.outerHTML);
      e.dataTransfer.setData(`position/${playerPosition}`, "");
    },

    lockerPlayerDrop(e) {
      let data = e.dataTransfer.getData("text/html");
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";

      // TODO: Validation
      e.target.innerHTML = data;
    },

    lockerPlayerDragOver(e, fieldPosition) {
      if (e.dataTransfer.types.includes(`position/${fieldPosition}`)) {
        e.preventDefault();
      }
    },
  },
};
</script>

<style scoped>
#gk,
#def,
#mid,
#att,
#bench {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  position: relative;
  height: 25%;
}

#gk,
#def,
#mid,
#att,
#bench label {
  font-size: 6vh;
  letter-spacing: 25px;
  opacity: 0.5;
}
.field {
  display: flex;
  flex-direction: column;
  background-color: darkkhaki;
  height: 70vh;
}

.field-player {
  position: absolute;
}

.locker-room {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: space-evenly;
  overflow-x: auto;
}

.locker-player {
  margin: 5px;
  background-color: whitesmoke;
}

.locker-player p {
  overflow-wrap: break-word;
}

.locker-player h5 {
  margin: 0;
}

@media screen and (max-width: 480px) {
  img {
    height: 70px;
    width: 70px;
  }
}
@media screen and (min-width: 480px) and (max-width: 580px) {
  img {
    height: 90px;
    width: 90px;
  }
}
@media screen and (min-width: 580px) {
  img {
    height: 120px;
    width: 120px;
  }
}
@media screen and (min-width: 900px) {
  .field {
    height: 70vh;
    width: 50vw;
  }

  .locker-room {
    display: inline-flex;
    flex-direction: column;
    flex-wrap: wrap;
    justify-content: space-evenly;
  }

  .main {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
}
@media screen and (min-width: 1400px) {
  img {
    height: 150px;
    width: 150px;
  }
}
</style>
