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
  border: 1px solid black;
}
#main-fixture-detail-team-selector > * {
  margin: 10px;
  border: 1px solid black;
}

.team {
  text-align: center;
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
  background-color: greenyellow;
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
