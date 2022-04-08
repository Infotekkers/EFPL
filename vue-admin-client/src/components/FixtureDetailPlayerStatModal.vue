<template>
  <div :class="showModal ? 'modal' : 'modal modal-hide'">
    <div class="main">
      <div id="close">
        <button @click="$emit('close')">X</button>
      </div>
      <div class="editor">
        {{ player.name }}
      </div>
      <div class="actions">
        <button @click="$emit('close')">Close</button>
        <button>Save</button>
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

  methods: {
    ...mapActions("Player", ["loadPlayerStats"]),
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
