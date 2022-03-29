<template>
  <div class="container">
    <form @submit.prevent="addPlayer">
      <div class="row" id="multiCollapseExample1">
        <div class="col">
          <div class="collapse multi-collapse">
            <div class="card card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.playerName"
                      placeholder="Player Name"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.eplTeamId"
                      placeholder="Team"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.position"
                      placeholder="Player Position"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.currentPrice"
                      placeholder="Price"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>
              <hr />
              <h2>Availablity</h2>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.injuryStatus"
                      placeholder="injuryStatus"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.injuryMessage"
                      placeholder="Injury Detail"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row" id="multiCollapseExample2">
        <h2>Score</h2>
        <div class="col">
          <div class="collapse multi-collapse">
            <div class="card card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.gameweekId"
                      placeholder="Gameweek"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.price"
                      placeholder="Price"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.fantasyScore"
                      placeholder="Fantasy Score"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.minutesPlayed"
                      placeholder="Minutes Played"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.goals"
                      placeholder="Goals"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.assist"
                      placeholder="Assists"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.cleanSheet"
                      placeholder="CleanSheets"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.ownGoal"
                      placeholder="Own Goal"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.yellows"
                      placeholder="Yellow Cards"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.reds"
                      placeholder="Red Card"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.penalitiesMissed"
                      placeholder="Penalities Missed"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.minutesPlayed"
                      placeholder="Penalities Saved"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.transfersIn"
                      placeholder="Transfers In"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.transfersOut"
                      placeholder="Transfers Out"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.saves"
                      placeholder="Saves"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.form"
                      placeholder="Player Form"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row" id="multiCollapseExample3">
        <h2>History</h2>
        <div class="col">
          <div class="collapse multi-collapse">
            <div class="card card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.startingPrice"
                      placeholder="Starting Price"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.endingPrice"
                      placeholder="Ending Price"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalFantasyScore"
                      placeholder="Total Fantasy Score"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalMinutesPlayed"
                      placeholder=" Total Minutes Played"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalGoals"
                      placeholder="Total Goals"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalAssists"
                      placeholder="Total Assists"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalCleanSheets"
                      placeholder="Total CleanSheets"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalOwnGoal"
                      placeholder="Total Own Goal"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalYellows"
                      placeholder="Total Yellow Cards"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalReds"
                      placeholder="Total Red Card"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalPenalitiesMissed"
                      placeholder="Total Penalities Missed"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalPenalitiesSaved"
                      placeholder="Total Penalities Saved"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalTransfersIn"
                      placeholder="Total Transfers In"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalTransfersOut"
                      placeholder="Total Transfers Out"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalSaves"
                      placeholder="Total Saves"
                    />
                  </div>
                </div>
                <!--  col-md-6   -->

                <div class="col-md-6">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form.totalform"
                      placeholder="Total Plyer Form "
                    />
                  </div>
                </div>
                <!--  col-md-6   -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</template>

<script>
import store from "../../store/index";
export default {
  data() {
    return {
      form: {
        playerName: null,
        eplTeamId: null,
        position: null,
        currentPrice: null,
        score: {
          gameweekId: null,
          price: null,
          fantasyScore: null,
          minutesPlayed: null,
          goals: null,
          assist: null,
          cleanSheet: null,
          yellows: null,
          reds: null,
          penalitiesMissed: null,
          penalitiesSaved: null,
          saves: null,
          ownGoal: null,
          transfersIn: null,
          transfersOut: null,
          form: null,
        },
        history: {
          startingPrice: null,
          endingPrice: null,
          totalFantasyScore: null,
          totalMinutesPlayed: null,
          totalGoals: null,
          totalAssists: null,
          totalCleanSheets: null,
          totalYellows: null,
          totalReds: null,
          totalPenalitiesMissed: null,
          totalPenalitiesSaved: null,
          totalSaves: null,
          totalOwnGoal: null,
          totalTransfersIn: null,
          totalTransfersOut: null,
          totalform: null,
        },
        availablity: {
          injuryStatus: null,
          injuryMessage: null,
        },
      },
    };
  },
  methods: {
    addPlayer() {
      store.dispatch("Player/addPlayer", this.form);
    },
  },
};
</script>

<style scoped>
input {
  border: 2px solid #eeeeee;
  height: 46px;
  margin: 10px 0 0 0;
  padding: 1%;
  font-size: 1.2em;
  line-height: 1.5em;
  color: #333333;
  letter-spacing: 0.01em;
  font-style: normal;
  font-weight: 300;
  font-family: source-sans-pro;
}
</style>
