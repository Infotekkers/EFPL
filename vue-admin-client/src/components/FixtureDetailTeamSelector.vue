<template>
  <div id="main-fixture-detail-team-selector">
    {{ status }}
    <button @click="$emit('changeActiveTeam', this.homeTeamId)">
      {{ homeTeamName }}
    </button>
    <div v-if="status !== 'scheduled'">{{ score }}</div>
    <button @click="$emit('changeActiveTeam', this.awayTeamId)">
      {{ awayTeamName }}
    </button>
  </div>
</template>

<script>
export default {
  props: {
    homeTeamId: Number,
    awayTeamId: Number,
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

@media screen and (min-width: 900px) {
  #main-fixture-detail-team-selector {
    display: flex;
    flex-direction: column;
  }
}
</style>
