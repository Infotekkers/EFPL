<template>
  <div>
    <!-- Show players if lineups have been setup before -->
    <div class="field" v-if="this.fixtureDetailData.lineups[this.activeTeamId]">
      <div id="gk">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
            .goalkeepers"
        >
          {{ playerId }}
        </div>
      </div>
      <div id="def">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
            .defenders"
        >
          {{ playerId }}
        </div>
      </div>
      <div id="mid">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
            .midfielders"
        >
          {{ playerId }}
        </div>
      </div>
      <div id="att">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
            .strikers"
        >
          {{ playerId }}
        </div>
      </div>
    </div>

    <!-- Show placeholder if lineups are not setup -->
    <div
      class="field"
      v-if="
        typeof this.fixtureDetailData.lineups[this.activeTeamId] === 'undefined'
      "
    >
      <div id="gk">
        <div class="player">
          <img src="@/assets/jerseys/placeholdershirt.png" />
        </div>
      </div>
      <div id="def">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in parseInt(
            this.fixtureDetailData.formations[this.activeTeamId].split('-')[0]
          )"
        >
          <img src="@/assets/jerseys/placeholdershirt.png" />
        </div>
      </div>
      <div id="mid">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in parseInt(
            this.fixtureDetailData.formations[this.activeTeamId].split('-')[1]
          )"
        >
          <img src="@/assets/jerseys/placeholdershirt.png" />
        </div>
      </div>
      <div id="att">
        <div
          class="player"
          :key="playerId"
          v-for="playerId in parseInt(
            this.fixtureDetailData.formations[this.activeTeamId].split('-')[2]
          )"
        >
          <img src="@/assets/jerseys/placeholdershirt.png" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapFields } from "vuex-map-fields";

export default {
  props: {
    activeTeamId: String,
  },

  computed: {
    ...mapFields("Fixture", ["fixtureDetailData"]),
  },
};
</script>

<style scoped>
#gk,
#def,
#mid,
#att {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
}

@media screen and (max-width: 480px) {
  img {
    height: 70px;
    width: 70px;
  }
}
@media screen and (min-width: 480px) and (max-width: 580px) {
  img {
    height: 90px;
    width: 90px;
  }
}
@media screen and (min-width: 580px) {
  img {
    height: 120px;
    width: 120px;
  }
}
@media screen and (min-width: 1400px) {
  img {
    height: 150px;
    width: 150px;
  }
}
</style>
