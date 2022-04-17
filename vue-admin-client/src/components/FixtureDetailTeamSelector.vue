<template>
  <div id="main-fixture-detail-team-selector">
    <div class="status">
      {{ status }}
    </div>
    <div
      class="team home-team"
      :class="activeTeamId === homeTeamId ? 'selected' : ''"
      @click="$emit('changeActiveTeam', this.homeTeamId)"
    >
      {{ homeTeamName }}
      <div class="team-logo home-team-logo"></div>
    </div>
    <div class="score" v-if="status !== 'scheduled'">{{ score }}</div>
    <div
      class="team away-team"
      :class="activeTeamId === awayTeamId ? 'selected' : ''"
      @click="$emit('changeActiveTeam', this.awayTeamId)"
    >
      <div class="team-logo away-team-logo"></div>
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
  border-radius: 100%;
}

.home-team-logo {
  background-color: red;
}

.away-team-logo {
  background-color: blue;
}

.selected {
  background-color: var(--primary-100);
  box-shadow: inset 0 1px 2px var(--primary-400);
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
