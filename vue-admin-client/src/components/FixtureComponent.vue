<template>
  <div class="fixture" @click="goToDetailPage">
    <div v-if="fixture" :class="index % 2 == 0 ? 'grey' : 'white'">
      <span class="homeTeam">{{ fixture.homeTeam }}</span>
      <span class="gameTime">{{ formatTime }}</span>
      <span class="awayTeam"> {{ fixture.awayTeam }}</span>
    </div>
  </div>
</template>

<style scoped>
.fixture {
  margin-top: 36px;
}
.grey {
  background: grey;
}

.white {
  background: white;
}
.date-info {
  text-align: center;
  margin-bottom: 4px;
}
.homeTeam,
.awayTeam {
  font-size: 24px;
}

.gameTime {
  margin: 0 24px;
}
</style>

<script>
import router from "../router/index";
export default {
  name: "FixtureComponent",
  props: {
    fixture: Object,
    index: Number,
  },

  computed: {
    formatTime() {
      const value = new Date(this.fixture.schedule);
      let hour =
        value.getHours() < 9 ? `0${value.getHours()}` : value.getHours();
      let minute =
        value.getMinutes() < 9 ? `0${value.getMinutes()}` : value.getMinutes();

      return `${hour}:${minute}`;
    },
  },

  methods: {
    goToDetailPage() {
      router.push({
        path: "/fixture/detail",
        query: { id: this.fixture.matchId },
      });
    },
  },
};
</script>
