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
      <img
        class="team-logo"
        :src="getPlayerTeamImage(player.teamLogo)"
        alt=""
      />
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
  methods: {
    getPlayerTeamImage(logoPath) {
      const baseURL = process.env.VUE_APP_API_BASE_URL;
      return baseURL + logoPath;
    },
  },
};
</script>

<style scoped>
h3 {
  margin-bottom: var(--spacing-small);
}
.player-list {
  flex-grow: 1;
  flex-basis: 300px;
  max-width: 400px;
  margin: var(--spacing-small) var(--spacing-xsmall);
}
.player-info {
  padding: var(--spacing-xsmall) var(--spacing-small);
  background: var(--neutral-50);
  margin-bottom: var(--spacing-2xsmall);

  display: flex;
  align-items: center;
}

.player-info * {
  margin: 0 var(--spacing-2xsmall);
}

.player-info p:last-child {
  margin-left: auto;
}

.team-logo {
  display: block;
  width: var(--spacing-medium);
}
</style>
