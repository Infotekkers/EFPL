<template>
  <div>
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
    homeTeamId: String,
    awayTeamId: String,
    homeTeamName: String,
    awayTeamName: String,
  },
};
</script>

<style lang="scss" scoped></style>
