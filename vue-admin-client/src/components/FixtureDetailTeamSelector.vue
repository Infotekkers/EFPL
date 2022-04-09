<template>
  <div id="main-fixture-detail-team-selector">
    <button @click="$emit('changeActiveTeam', this.homeTeamId)">
      {{ homeTeamName }}
    </button>
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
  },
};
</script>

<style lang="scss" scoped>
#main-fixture-detail-team-selector {
  display: flex;
  flex-direction: row;
  justify-content: center;
}
#main-fixture-detail-team-selector > * {
  margin: 10px;
}

@media screen and (min-width: 900px) {
  #main-fixture-detail-team-selector {
    display: flex;
    flex-direction: column;
  }
}
</style>
