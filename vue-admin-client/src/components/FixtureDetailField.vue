<template>
  <div>
    <dir v-if="!dataLoaded">Loading</dir>
    <dir v-else>
      <div class="main">
        <div class="field">
          <!-- /////////////////////// GOALKEEPERS ///////////////////// -->
          <div
            id="goalkeepers"
            ref="goalkeepers"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'goalkeepers')"
            @drop="lockerPlayerDrop($event, 'goalkeepers')"
            v-if="
              this.fixtureDetailData.lineups[this.activeTeamId].goalkeepers
                .length !== 0
            "
          >
            <div
              draggable="true"
              @dragstart="fieldPlayerDragStart($event, playerId, 'goalkeepers')"
              @dragend="fieldPlayerDragEnd"
              class="field-player"
              :key="playerId"
              v-for="playerId in this.fixtureDetailData.lineups[
                this.activeTeamId
              ].goalkeepers"
            >
              <h1>🤷‍♂️</h1>
              <p>
                {{ this.players[this.activeTeamId][playerId].playerName }}
              </p>
              <h5>
                {{ this.players[this.activeTeamId][playerId].position }}
              </h5>
            </div>
          </div>
          <div
            id="goalkeepers"
            ref="goalkeepers"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'goalkeepers')"
            @drop="lockerPlayerDrop($event, 'goalkeepers')"
            v-else
          >
            <label>GK</label>
          </div>
          <!-- /////////////////////// GOALKEEPERS ///////////////////// -->

          <!-- /////////////////////// DEFENDERS ///////////////////// -->
          <div
            id="defenders"
            ref="defenders"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'defenders')"
            @drop="lockerPlayerDrop($event, 'defenders')"
            v-if="
              this.fixtureDetailData.lineups[this.activeTeamId].defenders
                .length !== 0
            "
          >
            <div
              draggable="true"
              @dragstart="fieldPlayerDragStart($event, playerId, 'defenders')"
              @dragend="fieldPlayerDragEnd"
              class="field-player"
              :key="playerId"
              v-for="playerId in this.fixtureDetailData.lineups[
                this.activeTeamId
              ].defenders"
            >
              <h1>🤷‍♂️</h1>
              <p>
                {{ this.players[this.activeTeamId][playerId].playerName }}
              </p>
              <h5>
                {{ this.players[this.activeTeamId][playerId].position }}
              </h5>
            </div>
          </div>
          <div
            id="defenders"
            ref="defenders"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'defenders')"
            @drop="lockerPlayerDrop($event, 'defenders')"
            v-else
          >
            <label>DEF</label>
          </div>
          <!-- /////////////////////// DEFENDERS ///////////////////// -->

          <!-- /////////////////////// MIDFIELDERS ///////////////////// -->
          <div
            id="midfielders"
            ref="midfielders"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'midfielders')"
            @drop="lockerPlayerDrop($event, 'midfielders')"
            v-if="
              this.fixtureDetailData.lineups[this.activeTeamId].midfielders
                .length !== 0
            "
          >
            <div
              draggable="true"
              @dragstart="fieldPlayerDragStart($event, playerId, 'midfielders')"
              @dragend="fieldPlayerDragEnd"
              class="field-player"
              :key="playerId"
              v-for="playerId in this.fixtureDetailData.lineups[
                this.activeTeamId
              ].midfielders"
            >
              <h1>🤷‍♂️</h1>
              <p>
                {{ this.players[this.activeTeamId][playerId].playerName }}
              </p>
              <h5>
                {{ this.players[this.activeTeamId][playerId].position }}
              </h5>
            </div>
          </div>
          <div
            id="midfielders"
            ref="midfielders"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'midfielders')"
            @drop="lockerPlayerDrop($event, 'midfielders')"
            v-else
          >
            <label>MID</label>
          </div>
          <!-- /////////////////////// MIDFIELDERS ///////////////////// -->

          <!-- /////////////////////// STRIKERS ///////////////////// -->
          <div
            id="strikers"
            ref="strikers"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'strikers')"
            @drop="lockerPlayerDrop($event, 'strikers')"
            v-if="
              this.fixtureDetailData.lineups[this.activeTeamId].strikers
                .length !== 0
            "
          >
            <div
              draggable="true"
              @dragstart="fieldPlayerDragStart($event, playerId, 'strikers')"
              @dragend="fieldPlayerDragEnd"
              class="field-player"
              :key="playerId"
              v-for="playerId in this.fixtureDetailData.lineups[
                this.activeTeamId
              ].strikers"
            >
              <h1>🤷‍♂️</h1>
              <p>
                {{ this.players[this.activeTeamId][playerId].playerName }}
              </p>
              <h5>
                {{ this.players[this.activeTeamId][playerId].position }}
              </h5>
            </div>
          </div>
          <div
            id="strikers"
            ref="strikers"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'strikers')"
            @drop="lockerPlayerDrop($event, 'strikers')"
            v-else
          >
            <label>ATT</label>
          </div>
          <!-- /////////////////////// STRIKERS ///////////////////// -->

          <!-- /////////////////////// BENCH ///////////////////// -->
          <div
            id="bench"
            ref="bench"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'bench')"
            @drop="lockerPlayerDrop($event, 'bench')"
            v-if="
              this.fixtureDetailData.lineups[this.activeTeamId].bench.length !==
              0
            "
          >
            <div
              draggable="true"
              @dragstart="fieldPlayerDragStart($event, playerId, 'bench')"
              @dragend="fieldPlayerDragEnd"
              class="field-player"
              :key="playerId"
              v-for="playerId in this.fixtureDetailData.lineups[
                this.activeTeamId
              ].bench"
            >
              <h1>🤷‍♂️</h1>
              <p>
                {{ this.players[this.activeTeamId][playerId].playerName }}
              </p>
              <h5>
                {{ this.players[this.activeTeamId][playerId].position }}
              </h5>
            </div>
          </div>
          <div
            id="bench"
            ref="bench"
            @dragenter.prevent
            @dragover="lockerPlayerDragOver($event, 'bench')"
            @drop="lockerPlayerDrop($event, 'bench')"
            v-else
          >
            <label>SUBS</label>
          </div>
          <!-- /////////////////////// BENCH ///////////////////// -->
        </div>
        <div
          class="locker-room"
          @dragenter.prevent
          @dragover="fieldPlayerDragOver"
          @drop="fieldPlayerDrop"
        >
          <!-- TODO: Filter out selected players-->
          <div
            draggable="true"
            @dragstart="lockerPlayerDragStart($event, player)"
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
    </dir>
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
    ...mapFields("Fixture", [
      "fixtureDetailsLoaded",
      "fixtureDetailData",
      "players",
    ]),

    dataLoaded() {
      return this.fixtureDetailsLoaded;
    },
  },

  data: () => ({}),

  methods: {
    ...mapActions("Fixture", ["setFixtureDetailDataLineup"]),

    // Draggable Handlers
    lockerPlayerDragStart(e, player) {
      let lockerPlayerDiv = e.target;
      let fieldPlayerDiv = document.createElement("div");

      fieldPlayerDiv.className = "field-player";
      // TODO: ADD Jersey
      fieldPlayerDiv.innerHTML = `<span>🤷‍♂️</span>${lockerPlayerDiv.innerHTML}`;

      // TODO: ADD Drag Image
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";
      e.dataTransfer.setData("text/html", fieldPlayerDiv.outerHTML);
      e.dataTransfer.setData("player/Id", player.playerId);
      e.dataTransfer.setData("player/data", player);
      e.dataTransfer.setData("locker/field", "");

      player.position = player.position.toLowerCase();
      if (player.position === "gk")
        e.dataTransfer.setData("position/goalkeepers", "");
      else if (player.position === "def")
        e.dataTransfer.setData("position/defenders", "");
      else if (player.position === "mid")
        e.dataTransfer.setData("position/midfielders", "");
      else if (player.position === "att")
        e.dataTransfer.setData("position/strikers", "");
      else if (player.position === "bench")
        e.dataTransfer.setData("position/bench", "");
    },
    lockerPlayerDragEnd(e) {
      // e.preventDefault();
      if (e.dataTransfer.dropEffect === "move") e.target.outerHTML = "";
    },

    fieldPlayerDragStart(e, playerId, playerPosition) {
      let fieldPlayerDiv = e.target;
      let lockerPlayerDiv = document.createElement("div");

      lockerPlayerDiv.className = "locker-player";
      lockerPlayerDiv.innerHTML =
        fieldPlayerDiv.childNodes[1].outerHTML +
        fieldPlayerDiv.childNodes[2].outerHTML;

      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";
      e.dataTransfer.setData("text/html", lockerPlayerDiv.outerHTML);
      e.dataTransfer.setData("player/Id", playerId);
      e.dataTransfer.setData("player/position", playerPosition);
      e.dataTransfer.setData("field/locker", "");
    },
    fieldPlayerDragEnd(e) {
      if (e.dataTransfer.dropEffect === "move") e.target.outerHTML = "";
    },

    // Droppable handlers
    lockerPlayerDragOver(e, fieldPosition) {
      const lineup = this.fixtureDetailData.lineups[this.activeTeamId];
      const noOfPlayers =
        lineup.goalkeepers.length +
        lineup.defenders.length +
        lineup.midfielders.length +
        lineup.strikers.length +
        lineup.bench.length;

      // VALIDATION 1: Allow drops only form locker to field
      // VALIDATION 2: Limit players to their position only
      // VALIDATION 3: Limit players per position to 6
      // VALIDATION 4: Limit total no of players to 18
      // TODO: Allow only one for gk
      // TODO: Allow greater than 6 for bench players
      // TODO: Allow only 11 starters
      // console.log(
      //   e.dataTransfer.types.includes("locker/field"),
      //   e.dataTransfer.types.includes(`position/${fieldPosition}`),
      //   this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
      //     .length < 6,
      //   noOfPlayers < 18,
      //   e.dataTransfer
      // );
      if (
        e.dataTransfer.types.includes("locker/field") &&
        e.dataTransfer.types.includes(`position/${fieldPosition}`) &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length < 6 &&
        noOfPlayers < 18
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
        operation: "add",
        teamId: this.activeTeamId,
        incomingPlayer: playerId,
        position,
      });
      e.preventDefault();
    },

    fieldPlayerDragOver(e) {
      if (e.dataTransfer.types.includes("field/locker")) e.preventDefault();
    },
    fieldPlayerDrop(e) {
      let lockerPlayerDiv = e.dataTransfer.getData("text/html");
      let playerId = e.dataTransfer.getData("player/Id");
      let position = e.dataTransfer.getData("player/position");
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";

      let lockerRoomDiv = this.$el.querySelector(".locker-room");
      lockerRoomDiv.innerHTML += lockerPlayerDiv;

      // Save changes
      this.setFixtureDetailDataLineup({
        operation: "remove",
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
h1,
h5,
p {
  margin: 0;
}

dir {
  padding: 0%;
}

.field {
  display: flex;
  flex-direction: column;
  background-color: darkkhaki;
  height: 70vh;
}

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
  margin: 10px 0;
}

#bench {
  flex-wrap: nowrap;
  justify-content: flex-start;
  overflow-x: auto;
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
  z-index: 0;
}

.field-player {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: azure;
  margin: 0 5px;
  z-index: 1;
}

.locker-room {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;
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
  .main {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }

  .field {
    height: 90vh;
    width: 50vw;
  }

  #bench {
    height: 50% !important;
    flex-wrap: wrap;
  }

  .locker-room {
    flex-direction: column;
    overflow-y: auto;
    max-height: 90vh;
  }
}
@media screen and (min-width: 1400px) {
  img {
    height: 150px;
    width: 150px;
  }
}
</style>
