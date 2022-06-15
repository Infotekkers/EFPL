<template>
  <div v-if="!dataLoaded">Loading</div>
  <div v-else>
    <div id="main-fixture-detail-locker">
      <div id="locker-label">{{ $t("Reserves") }}</div>
      <div
        class="locker-room"
        @dragenter.prevent
        @dragover="fieldPlayerDragOver"
        @drop="fieldPlayerDrop"
      >
        <div
          draggable="true"
          @dragstart="lockerPlayerDragStart($event, player)"
          @dragend.prevent
          class="locker-player"
          :key="player.playerId"
          v-for="player in this.locker[this.activeTeamId]"
        >
          <p>
            {{ player.playerName }}
          </p>
          <h5>
            {{ player.position.toUpperCase() }}
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
    activeTeamId: Number,
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

  data: () => ({}),

  methods: {
    ...mapActions("Fixture", [
      "setFixtureDetailDataLineup",
      "addPlayerToLocker",
      "deletePlayerFromLocker",
    ]),
    log(e) {
      console.log(e);
    },

    //   Dragganle Handlers
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
    },

    // Droppable Handlers
    fieldPlayerDragOver(e) {
      if (e.dataTransfer.types.includes("field/locker")) e.preventDefault();
    },
    fieldPlayerDrop(e) {
      let playerId = e.dataTransfer.getData("player/Id");
      let position = e.dataTransfer.getData("player/position");
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";

      this.addPlayerToLocker({
        teamId: this.activeTeamId,
        playerId,
      });

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
*::-webkit-scrollbar {
  display: none;
}

* {
  -ms-overflow-style: none; /* IE and Edge */
  scrollbar-width: none; /* Firefox */
}

#main-fixture-detail-locker {
  display: flex;
  flex-direction: row;
}

.locker-room {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;
  overflow-x: auto;
  margin: var(--spacing-xsmall);
}

#locker-label {
  writing-mode: vertical-lr;
  text-orientation: upright;
  text-align: center;
}

.locker-player {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: var(--spacing-2xsmall);
  background-color: var(--primary-100);
  border-radius: 2px;
}

.locker-player p {
  overflow-wrap: break-word;
}

.locker-player h5 {
  margin: var(--spacing-2xsmall);
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
  #main-fixture-detail-locker {
    flex-direction: column;
  }

  .locker-room {
    flex-direction: column;
    overflow-y: auto;
    height: 90vh;
    max-height: 90vh;
    width: 300px;
  }

  #locker-label {
    writing-mode: horizontal-tb;
    text-orientation: upright;
  }

  .locker-player {
    display: flex;
    flex-direction: row;
    padding: var(--spacing-xsmall);
  }
}
@media screen and (min-width: 1400px) {
  img {
    height: 150px;
    width: 150px;
  }
}
</style>
