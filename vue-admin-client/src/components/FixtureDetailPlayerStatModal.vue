<template>
  <div :class="showModal ? 'modal' : 'modal modal-hide'">
    <div id="close">
      <button @click="$emit('closeModal')">X</button>
    </div>
    <div class="main">
      <div class="editor">
        <h2>
          {{ player.name }}
        </h2>
        <h4>{{ player.stats.minutesPlayed }} mins</h4>
        <div class="editor-field">
          <div id="goals">
            <span class="editor-field-label">{{ $t("Goals") }}</span>
            <button @click="updateStats('goals', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.goals }}
            </span>
            <button @click="updateStats('goals', '+')">+</button>
          </div>
          <div id="assists">
            <span class="editor-field-label">{{ $t("Assists") }}</span>
            <button @click="updateStats('assists', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.assists }}
            </span>
            <button @click="updateStats('assists', '+')">+</button>
          </div>
          <div id="yellows">
            <span class="editor-field-label">{{ $t("Yellows") }}</span>
            <button @click="updateStats('yellows', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.yellows }}
            </span>
            <button @click="updateStats('yellows', '+')">+</button>
          </div>
          <div id="reds">
            <span class="editor-field-label">{{ $t("Red") }}</span>
            <button @click="updateStats('reds', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.reds }}
            </span>
            <button @click="updateStats('reds', '+')">+</button>
          </div>
          <div id="penalitiesMissed">
            <span class="editor-field-label">{{
              $t("Penalities Missed")
            }}</span>
            <button @click="updateStats('penalitiesMissed', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.penalitiesMissed }}
            </span>
            <button @click="updateStats('penalitiesMissed', '+')">+</button>
          </div>
          <div id="penalitiesSaved">
            <span class="editor-field-label">{{ $t("Penalities Saved") }}</span>
            <button @click="updateStats('penalitiesSaved', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.penalitiesSaved }}
            </span>
            <button @click="updateStats('penalitiesSaved', '+')">+</button>
          </div>
          <div id="saves">
            <span class="editor-field-label">{{ $t("Saves") }}</span>
            <button @click="updateStats('saves', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.saves }}
            </span>
            <button @click="updateStats('saves', '+')">+</button>
          </div>
          <div id="ownGoal">
            <span class="editor-field-label">{{ $t("Own Goal") }}</span>
            <button @click="updateStats('ownGoal', '-')">-</button>
            <span class="stat-value">
              {{ player.stats.ownGoal }}
            </span>
            <button @click="updateStats('ownGoal', '+')">+</button>
          </div>
        </div>
      </div>
      <div class="actions">
        <button class="action-secondary" @click="$emit('closeModal')">
          {{ $t("Close") }}
        </button>
        <button class="action-primary" @click="saveStats">
          {{ $t("Save") }}
        </button>
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
    ...mapFields("PlayerStats", ["stats", "names"]),
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
    ...mapActions("PlayerStats", [
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

#close {
  position: absolute;
  top: 10px;
  right: 20px;
}

#close button {
  padding: 20px;
  border: 0;
  border-radius: 100%;
  aspect-ratio: 3/2;
  background-color: var(--neutral-200);
  font-size: var(--text-base);
  color: var(--primary-900);
  box-shadow: 0 1px 1px grey;
  cursor: pointer;
}

.main {
  background-color: whitesmoke;
  padding: 20px;
  box-shadow: 0 10px 10px var(--neutral-600);
}

.editor h2 {
  font-size: var(--text-regular);
  font-weight: 700;
  margin: 10px;
}

.editor-field > div {
  display: grid;
  grid-template-columns: 5fr repeat(3, 1fr);
  padding: 10px;
}

.editor-field > div:nth-child(2n) {
  background-color: var(--neutral-200);
}

.editor-field > div:nth-child(2n + 1) {
  background-color: var(--neutral-300);
}

.editor-field span {
  text-align: left;
  margin-right: 5px;
}

.editor-field button {
  font-size: var(--text-regular);
  font-weight: 900;
  padding: 0;
  margin: 0;
  border: 0;
}

.editor-field button:first-of-type {
  color: red;
}
.editor-field button:last-of-type {
  color: green;
}

.stat-value {
  align-self: center;
  text-align: center !important;
  margin: 0 !important;
  background-color: var(--neutral-100);
}

.action-primary {
  border: 0;
  width: 200px;
  height: 50px;
  color: white;
  cursor: pointer;
  font-size: var(--text-base);
  background: #07385e; /* Primary-900 */
  box-shadow: 0px 2px 0px #38bdf8;
  border-radius: 2px;
  margin: 10px 10px 0 5px;
}

.action-primary:hover {
  border: 0;
  width: 200px;
  height: 50px;
  color: #07385e;
  font-size: var(--text-base);
  background: #b5f0ff; /* Primary-200 */
  box-shadow: 0px 2px 0px #38bdf8;
  border-radius: 2px;
}

.action-secondary {
  width: 200px;
  height: 50px;
  border: 2px solid #cad3e1;
  box-sizing: border-box;
  filter: drop-shadow(0px 2px 0px #b2c0d3);
  border-radius: 2px;
  color: var(--primary-900);
  font-size: var(--text-base);
  margin: 10px 5px 0 10px;
}

.action-secondary:hover {
  width: 200px;
  height: 50px;
  background: #ebf2fa;
  border: 2px solid #cad3e1;
  box-sizing: border-box;
  box-shadow: 0px 2px 0px #cad3e1;
  border-radius: 2px;
  cursor: pointer;
}
</style>
