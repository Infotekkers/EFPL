<template>
  <div class="team-container">
    <div
      class="team-highlighter"
      :class="
        team.relative_id == 1
          ? 'green-highlight'
          : team.relative_id > 13
          ? 'red-highlight'
          : 'no-color-highlight'
      "
    ></div>
    <div class="team-id-container">
      {{ team.relative_id }}
    </div>
    <div
      class="team-logo-container"
      :style="{
        'background-image': 'url(' + getTeamLogo + ')',
      }"
    ></div>

    <div class="team-name-container">{{ team.teamName }}</div>
    <div class="team-gf-container">
      {{ team.teamPosition.goalsFor }}
    </div>
    <div class="team-ga-container">
      {{ team.teamPosition.goalsAgainst }}
    </div>
    <div class="team-gd-container">
      {{ team.teamPosition.goalDifferential }}
    </div>
    <div class="team-win-container">{{ team.teamPosition.won }}</div>
    <div class="team-draw-container">{{ team.teamPosition.lost }}</div>
    <div class="team-loss-container">{{ team.teamPosition.Draw }}</div>
    <div class="team-point-container">
      {{ team.teamPosition.teamPoint }}
    </div>
  </div>
</template>
<script>
export default {
  name: "DashLeagueTableComponent",
  props: {
    team: Object,
  },
  computed: {
    getTeamLogo() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;
      const team = this.team.teamLogo;
      return baseUrl + team;
    },
  },
};
</script>

<style scoped>
/* Icons */
.extra-small-icon {
  width: 7px;
  height: fit-content;
  object-fit: contain;
}

.small-icon {
  width: 15px;
  height: fit-content;
  object-fit: contain;
}
.team-container {
  width: 100%;
  margin-top: 8px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  min-height: 90px;
  border-bottom: 2px solid var(--neutral-200);
  font-size: 16px;
  color: var(--neutral-900);
}
.team-container:nth-of-type(odd) {
  background: var(--neutral-200);
}
.team-container-colored {
  background: var(--primary-100);
}
.team-id-container {
  width: 3%;
  min-width: 45px;
}
.team-highlighter {
  min-width: 4px;
  height: 90px;
  position: relative;
  top: 0;
  left: 0;
}
.red-highlight {
  background: red;
}
.green-highlight {
  background: lightgreen;
}
.team-logo-container {
  margin-right: 2.5%;
  margin-left: 2.5%;
  height: 50px;
  width: 5%;
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
}

.team-name-container {
  width: 32.5%;
  text-align: start;
}

.team-point-container,
.team-win-container,
.team-loss-container,
.team-draw-container,
.team-gf-container,
.team-ga-container,
.team-gd-container {
  width: 7.5%;
  display: grid;
  place-items: center;
}

.team-stadium-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  width: 18%;
}
.team-capacity-container {
  font-size: var(--spacing-small);
}
.team-year-container {
  display: flex;
  width: 8%;
}
.team-controls-container {
  width: 10%;
  display: flex;
  justify-content: space-between;
  padding: 0 24px;
}
.team-controls-container > div:nth-of-type(1) {
  margin-right: 8px;
}
</style>
