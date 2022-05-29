<template>
  <div id="main-fixture-detail-team-selector">
    <div class="status">
      {{ status.toUpperCase() }}
    </div>
    <div
      class="team home-team"
      :class="activeTeamId === homeTeamId ? 'selected' : ''"
      @click="$emit('changeActiveTeam', this.homeTeamId)"
    >
      {{ homeTeamName }}
      <div
        class="team-logo home-team-logo"
        :style="{
          'background-image': 'url(' + homeTeamLogo + ')',
        }"
      ></div>
    </div>
    <div class="score" v-if="status !== 'scheduled'">{{ score }}</div>
    <div
      class="team away-team"
      :class="activeTeamId === awayTeamId ? 'selected' : ''"
      @click="$emit('changeActiveTeam', this.awayTeamId)"
    >
      <div
        class="team-logo away-team-logo"
        :style="{
          'background-image': 'url(' + awayTeamLogo + ')',
        }"
      ></div>
      {{ awayTeamName }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    homeTeamId: Number,
    awayTeamId: Number,
    activeTeamId: Number,
    homeTeamName: String,
    awayTeamName: String,
    homeTeamLogo: String,
    awayTeamLogo: String,
    score: String,
    status: String,
  },
};
</script>

<style lang="scss" scoped>
#main-fixture-detail-team-selector {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin: var(--spacing-regular);
}
#main-fixture-detail-team-selector > * {
  margin: var(--spacing-xsmall);
}

.team {
  text-align: center;
  padding: var(--spacing-small);
  border-radius: 2px;
}

.team * {
  margin: var(--spacing-xsmall);
}

.team-logo {
  height: 100px;
  width: 100px;
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  margin: var(--spacing-xsmall) auto;
}

.selected {
  background-color: var(--primary-200);
  box-shadow: inset 0 1px 2px var(--primary-600);
}

.score {
  text-align: center;
}

@media screen and (min-width: 900px) {
  #main-fixture-detail-team-selector {
    display: flex;
    flex-direction: column;
  }
}
</style>
