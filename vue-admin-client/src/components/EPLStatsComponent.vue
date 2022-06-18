<template>
  <div class="player-list" v-if="statArray.length">
    <h3>
      Most
      {{ statType === "minutesPlayed" ? "minutes" : statType.toLowerCase() }}
    </h3>
    <div
      class="player-info"
      v-for="player of statArray"
      v-bind:key="player._id"
    >
      <p>
        {{ player.name }}
      </p>
      <p>
        {{ player[statType] }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    statArray: {
      required: true,
      type: Object,
    },
    statType: {
      required: true,
      type: String,
    },
  },
};
</script>

<style scoped>
.player-list {
  flex-grow: 1;
  flex-basis: 200px;
  max-width: 300px;
  margin: var(--spacing-small) var(--spacing-xsmall);
}
.player-info {
  padding: var(--spacing-xsmall) var(--spacing-small);
  background: var(--neutral-50);
  margin-bottom: var(--spacing-2xsmall);

  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
