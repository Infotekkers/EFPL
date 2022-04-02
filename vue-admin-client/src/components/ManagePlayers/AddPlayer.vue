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
        playerName: "",
        eplTeamId: "",
        position: "",
        currentPrice: "",
        availablity: {
          injuryStatus: "",
          injuryMessage: "",
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
