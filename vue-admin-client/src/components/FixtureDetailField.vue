<template>
  <div v-if="!dataLoaded">Loading</div>
  <div v-else>
    <div id="main-fixture-detail-field">
      <PlayerStatModal
        :showModal="showModal"
        :playerId="currentPlayerId"
        :gameweek="showingGameWeek"
        @closeModal="closeStatsModal"
        v-if="showModal"
      />
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
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'goalkeepers')"
            @dragend.prevent
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .goalkeepers"
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
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
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'defenders')"
            @dragend.prevent
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .defenders"
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
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
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'midfielders')"
            @dragend.prevent
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .midfielders"
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
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
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'strikers')"
            @dragend.prevent
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .strikers"
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
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
            this.fixtureDetailData.lineups[this.activeTeamId].bench.length !== 0
          "
        >
          <div
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'bench')"
            @dragend.prevent
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .bench"
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
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
          <label id="bench-label">SUBS</label>
        </div>
        <!-- /////////////////////// BENCH ///////////////////// -->
        <div class="actions">
          <button @click="saveLineup">Save</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";
import PlayerStatModal from "../components/FixtureDetailPlayerStatModal.vue";

export default {
  props: {
    activeTeamId: Number,
  },

  components: {
    PlayerStatModal,
  },

  computed: {
    ...mapFields("Fixture", [
      "fixtureDetailsLoaded",
      "fixtureDetailData",
      "fixtureDetailId",
      "players",
      "locker",
      "showingGameWeek",
    ]),

    dataLoaded() {
      return this.fixtureDetailsLoaded;
    },
  },

  data: () => ({
    showModal: false,
    currentPlayerId: "",
  }),

  methods: {
    ...mapActions("Fixture", [
      "setFixtureDetailDataLineup",
      "addPlayerToLocker",
      "deletePlayerFromLocker",
      "saveFixtureLineup",
    ]),

    // Modal Handlers
    openStatsModal(playerId) {
      this.currentPlayerId = playerId;
      this.showModal = true;
    },
    closeStatsModal() {
      this.showModal = false;
    },

    // Draggable Handlers
    fieldPlayerDragStart(e, playerId, playerPosition) {
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";
      e.dataTransfer.setData("player/Id", playerId);
      e.dataTransfer.setData("player/position", playerPosition);
      e.dataTransfer.setData("field/locker", "");
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
      const noOfStarters =
        lineup.goalkeepers.length +
        lineup.defenders.length +
        lineup.midfielders.length +
        lineup.strikers.length;
      const goalkeeperExists = Boolean(lineup.goalkeepers.length);

      /* 

        * VALIDATION 1 : For Main Field
        VALIDATION 1.1: Allow drops only form locker to field
        VALIDATION 1.2: Limit players to their position only
        VALIDATION 1.3: Limit players per position to 6
        VALIDATION 1.4: Limit total no of players to 18
        VALIDATION 1.5: Limit no of starters to 11
        VALIDATION 1.6: Allow goalkeepers drop only if there is not a goalkeeper in place already

        * VALIDATION 2: For Bench
        VALIDATION 2.1: Apply this rule only for the bench position 
        VALIDATION 2.2: Allow drops only form locker to field
        VALIDATION 2.3: Limit players per position to 7
        VALIDATION 2.4: Limit total no of players to 18
      
      */

      if (
        e.dataTransfer.types.includes("locker/field") &&
        e.dataTransfer.types.includes(`position/${fieldPosition}`) &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length < 6 &&
        noOfPlayers < 18 &&
        noOfStarters < 11 &&
        !(
          goalkeeperExists &&
          e.dataTransfer.types.includes(`position/goalkeepers`)
        )
      )
        e.preventDefault();
      else if (
        fieldPosition === "bench" &&
        e.dataTransfer.types.includes("locker/field") &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length < 7 &&
        noOfPlayers < 18
      )
        e.preventDefault();
    },
    lockerPlayerDrop(e, position) {
      let playerId = e.dataTransfer.getData("player/Id");
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";

      this.deletePlayerFromLocker({
        teamId: this.activeTeamId,
        playerId,
      });

      // Save changes
      this.setFixtureDetailDataLineup({
        operation: "add",
        teamId: this.activeTeamId,
        incomingPlayer: playerId,
        position,
      });

      e.preventDefault();
    },

    // API Callers
    saveLineup() {
      // TODO: Check if there are 18 players
      this.saveFixtureLineup();
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

.field {
  display: flex;
  flex-direction: column;
  background-color: var(--primary-100);
  height: 80vh;
}

#goalkeepers,
#defenders,
#midfielders,
#strikers,
#bench {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  overflow-x: auto;
  justify-content: center;
  align-items: center;
  position: relative;
  height: 20%; /* Neccessary for the labels*/
  padding: 10px 0;
  border: 2px solid var(--primary-400);
}

#bench {
  justify-content: flex-start;
  background-color: var(--neutral-800);
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

#bench-label {
  left: 15vw;
}

.field-player {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: var(--primary-500);
  margin: 0 5px;
  z-index: 1;
}

.actions {
  align-self: flex-end;
}

@media screen and (max-width: 480px) {
  img {
    height: 70px;
    width: 70px;
  }

  #bench-label {
    left: 22vw;
  }
}
@media screen and (min-width: 480px) and (max-width: 580px) {
  img {
    height: 90px;
    width: 90px;
  }

  #bench-label {
    left: 25vw;
  }
}
@media screen and (min-width: 580px) {
  img {
    height: 120px;
    width: 120px;
  }

  #bench-label {
    left: 33vw;
  }
}
@media screen and (min-width: 900px) {
  #main-fixture-detail-field {
    display: flex;
    flex-direction: row;
    justify-content: center;
    max-width: 600px;
  }

  .field {
    height: 90vh;
    width: 50vw;
  }

  #bench {
    height: 50% !important;
    flex-wrap: wrap;
  }

  #bench-label {
    left: 15vw;
  }
}
@media screen and (min-width: 1400px) {
  img {
    height: 150px;
    width: 150px;
  }
}
</style>
