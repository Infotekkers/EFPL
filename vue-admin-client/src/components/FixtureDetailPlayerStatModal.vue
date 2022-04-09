<template>
  <div :class="showModal ? 'modal' : 'modal modal-hide'">
    <div class="main">
      <div id="close">
        <button @click="$emit('closeModal')">X</button>
      </div>
      <div class="editor">
        {{ player.name }}
        <div class="editor-field">
          <div id="goals">
            <span class="editor-field-label">Goals</span>
            <button @click="updateStats('goals', '-')">-</button>
            {{ player.stats.goals }}
            <button @click="updateStats('goals', '+')">+</button>
          </div>
          <div id="assists">
            <span class="editor-field-label">Assists</span>
            <button @click="updateStats('assists', '-')">-</button>
            {{ player.stats.assists }}
            <button @click="updateStats('assists', '+')">+</button>
          </div>
          <div id="yellows">
            <span class="editor-field-label">Yellows</span>
            <button @click="updateStats('yellows', '-')">-</button>
            {{ player.stats.yellows }}
            <button @click="updateStats('yellows', '+')">+</button>
          </div>
          <div id="reds">
            <span class="editor-field-label">Red</span>
            <button @click="updateStats('reds', '-')">-</button>
            {{ player.stats.reds }}
            <button @click="updateStats('reds', '+')">+</button>
          </div>
          <div id="penalitiesMissed">
            <span class="editor-field-label">Penalities Missed</span>
            <button @click="updateStats('penalitiesMissed', '-')">-</button>
            {{ player.stats.penalitiesMissed }}
            <button @click="updateStats('penalitiesMissed', '+')">+</button>
          </div>
          <div id="penalitiesSaved">
            <span class="editor-field-label">Penalities Saved</span>
            <button @click="updateStats('penalitiesSaved', '-')">-</button>
            {{ player.stats.penalitiesSaved }}
            <button @click="updateStats('penalitiesSaved', '+')">+</button>
          </div>
          <div id="saves">
            <span class="editor-field-label">Saves</span>
            <button @click="updateStats('saves', '-')">-</button>
            {{ player.stats.saves }}
            <button @click="updateStats('saves', '+')">+</button>
          </div>
          <div id="ownGoal">
            <span class="editor-field-label">Own Goal</span>
            <button @click="updateStats('ownGoal', '-')">-</button>
            {{ player.stats.ownGoal }}
            <button @click="updateStats('ownGoal', '+')">+</button>
          </div>
        </div>
      </div>
      <div class="actions">
        <button @click="$emit('closeModal')">Close</button>
        <button @click="saveStats">Save</button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";

export default {
  props: {
    showModal: Boolean,
    playerId: Number,
    gameweek: Number,
    activeTeamId: Number,
  },

  mounted() {
    this.loadPlayerStats(this.playerId);
  },

  computed: {
    ...mapFields("Player", ["stats", "names"]),
    player() {
      return {
        name: this.names[this.playerId],
        stats: this.stats[this.playerId][this.gameweek],
      };
    },
  },

  data: () => ({
    score: 0,
  }),

  methods: {
    ...mapActions("Player", [
      "loadPlayerStats",
      "updatePlayerStats",
      "savePlayerStats",
    ]),

    updateStats(statType, operationType) {
      if (statType === "goals") {
        if (operationType === "+") this.score += 1;
        else if (operationType === "-") this.score -= 1;
      }

      this.updatePlayerStats({
        playerId: this.playerId,
        gameweek: this.gameweek,
        statType,
        operationType,
      });
    },

    saveStats() {
      this.savePlayerStats({
        playerId: this.playerId,
        gameweek: this.gameweek,
      });

      this.$emit("scoreChanged", this.score);
    },
  },
};
</script>

<style scoped>
.modal {
  position: absolute;
  top: 0;
  left: 0;
  backdrop-filter: blur(5px);
  height: 100vh;
  width: 100vw;
  z-index: 10;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.modal-hide {
  display: none;
}

.main {
  background-color: whitesmoke;
  padding: 20px;
}
</style>
