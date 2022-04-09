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
    homeTeamId: Number,
    awayTeamId: Number,
    homeTeamName: String,
    awayTeamName: String,
  },
};
</script>

<style lang="scss" scoped></style>
