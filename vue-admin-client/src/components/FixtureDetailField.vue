<template>
  <div>
    <div class="main">
      <div class="field">
        <div
          id="goalkeepers"
          ref="goalkeepers"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'goalkeepers')"
          @drop="lockerPlayerDrop($event, 'goalkeepers')"
        >
          <label>GK</label>
        </div>
        <div
          id="defenders"
          ref="defenders"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'defenders')"
          @drop="lockerPlayerDrop($event, 'defenders')"
        >
          <label>DEF</label>
        </div>
        <div
          id="midfielders"
          ref="midfielders"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'midfielders')"
          @drop="lockerPlayerDrop($event, 'midfielders')"
        >
          <label>MID</label>
        </div>
        <div
          id="strikers"
          ref="strikers"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'strikers')"
          @drop="lockerPlayerDrop($event, 'strikers')"
        >
          <label>ATT</label>
        </div>
        <div
          id="bench"
          ref="bench"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'bench')"
          @drop="lockerPlayerDrop($event, 'bench')"
        >
          <label>SUBS</label>
        </div>
      </div>
      <div class="locker-room">
        <div
          draggable="true"
          @dragstart="
            lockerPlayerDragStart($event, player.position, player.playerId)
          "
          @dragend="lockerPlayerDragEnd"
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
import { mapActions } from "vuex";

export default {
  props: {
    activeTeamId: String,
  },

  computed: {
    ...mapFields("Fixture", ["fixtureDetailData", "players"]),
  },

  data: () => ({}),

  methods: {
    ...mapActions("Fixture", ["setFixtureDetailDataLineup"]),

    // Draggable Handlers
    lockerPlayerDragStart(e, playerPosition, playerId) {
      let lockerPlayerDiv = e.target;
      let fieldPlayerDiv = document.createElement("div");

      fieldPlayerDiv.className = "field-player";
      // TODO: ADD Jersey
      fieldPlayerDiv.innerHTML = `<span>🤷‍♂️</span>${lockerPlayerDiv.innerHTML}`;

      // TODO: ADD Drag Image
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";
      e.dataTransfer.setData("text/html", fieldPlayerDiv.outerHTML);
      e.dataTransfer.setData("player/Id", playerId);

      playerPosition = playerPosition.toLowerCase();
      if (playerPosition === "gk")
        e.dataTransfer.setData("position/goalkeepers", "");
      else if (playerPosition === "def")
        e.dataTransfer.setData("position/defenders", "");
      else if (playerPosition === "mid")
        e.dataTransfer.setData("position/midfielders", "");
      else if (playerPosition === "att")
        e.dataTransfer.setData("position/strikers", "");
      else if (playerPosition === "bench")
        e.dataTransfer.setData("position/bench", "");
    },
    lockerPlayerDragEnd(e) {
      if (e.dataTransfer.dropEffect === "move") e.target.outerHTML = "";
    },

    // Droppable handlers
    lockerPlayerDragOver(e, fieldPosition) {
      // VALIDATION: Limit players per position to 6
      if (
        e.dataTransfer.types.includes(`position/${fieldPosition}`) &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length < 6
      )
        e.preventDefault();
    },
    lockerPlayerDrop(e, position) {
      let data = e.dataTransfer.getData("text/html");
      let playerId = e.dataTransfer.getData("player/Id");
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";

      let positionalDiv = this.$el.querySelector(`#${position}`);
      positionalDiv.innerHTML += data;

      this.setFixtureDetailDataLineup({
        teamId: this.activeTeamId,
        incomingPlayer: playerId,
        position,
      });
      e.preventDefault();
    },
  },
};
</script>

<style scoped>
#goalkeepers,
#defenders,
#midfielders,
#strikers,
#bench {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  position: relative;
  height: 25%;
}

#goalkeepers label,
#defenders label,
#midfielders label,
#strikers label,
#bench label {
  font-size: 6vh;
  letter-spacing: 25px;
  opacity: 0.5;
  position: absolute;
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
