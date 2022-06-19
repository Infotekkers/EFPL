<template>
  <div class="change-pass">
    <form @submit.prevent="handleSubmit">
      <h3>{{ $t("Reset Your Password") }}</h3>
      <div>
        <label> {{ $t("Old") }} {{ $t("Password") }} </label>
        <div class="old-password">
          <input
            v-model="passSet.old_password"
            required
            placeholder="Input Your Old Password"
            :type="showOldPassword ? 'text' : 'password'"
          />
          <button
            class="toggle-password"
            @click.prevent="showOldPassword = !showOldPassword"
          >
            <img
              :src="passwordVisibleIcon.path"
              :alt="passwordVisibleIcon.alt"
              v-if="showOldPassword"
            />
            <img
              :src="hiddenPasswordIcon.path"
              :alt="hiddenPasswordIcon.alt"
              v-else
            />
          </button>
        </div>
      </div>
      <div>
        <label> {{ $t("new") }} {{ $t("Password") }} </label>
        <div class="new-password">
          <input
            v-model="passSet.new_password"
            required
            placeholder="Password"
            :type="showPassword ? 'text' : 'password'"
          />
          <button
            class="toggle-password"
            @click.prevent="showPassword = !showPassword"
          >
            <img
              :src="passwordVisibleIcon.path"
              :alt="passwordVisibleIcon.alt"
              v-if="showPassword"
            />
            <img
              :src="hiddenPasswordIcon.path"
              :alt="hiddenPasswordIcon.alt"
              v-else
            />
          </button>
        </div>
      </div>
      <div>
        <div class="confirm-pass">
          <label> {{ $t("Password") }} {{ $t("Confirm") }}</label>
          <input
            v-model="password_confirm"
            required
            placeholder="Cofirm password"
            :type="showConfirmPassword ? 'text' : 'password'"
          />
          <button
            class="toggle-password"
            @click.prevent="showConfirmPassword = !showConfirmPassword"
          >
            <img
              :src="passwordVisibleIcon.path"
              :alt="passwordVisibleIcon.alt"
              v-if="showConfirmPassword"
            />
            <img
              :src="hiddenPasswordIcon.path"
              :alt="hiddenPasswordIcon.alt"
              v-else
            />
          </button>
        </div>
      </div>

      <button>{{ $t("submit") }}</button>
    </form>

    <div>{{ error }}</div>
  </div>
</template>

<script>
import { passwordVisibleIcon, hiddenPasswordIcon } from "@/utils/Icons";
import store from "../store";
export default {
  name: "ResetPasswordComponent",
  data() {
    return {
      error: "",
      showOldPassword: false,
      showPassword: false,
      showConfirmPassword: false,

      passSet: {
        old_password: "",
        new_password: "",
      },
      password_confirm: "",
      regExp: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
      isLoading: false,

      // icons
      passwordVisibleIcon: passwordVisibleIcon,
      hiddenPasswordIcon: hiddenPasswordIcon,
    };
  },
  methods: {
    async handleSubmit() {
      if (
        this.regExp.test(this.passSet.old_password) === true &&
        this.regExp.test(this.passSet.new_password) === true &&
        this.regExp.test(this.password_confirm) === true
      ) {
        if (this.passSet.new_password === this.passSet.old_password) {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage:
              "New Password Can't Be The Same As Old Password",
          });
        } else if (!(this.passSet.new_password === this.password_confirm)) {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `Passwords Don't Match `,
          });
        } else {
          this.$store.dispatch("changePassword", this.passSet);
        }
      } else {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage:
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number",
        });
      }
    },
  },
};
</script>
<style scoped>
.change-pass {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 50%;
}
form {
  text-align: left;
  padding: var(--spacing-large);
  border: 1px solid;
  border-radius: 10px;
}
label {
  color: var(--neutral-900);
  display: inline-block;
  margin: var(--spacing-regular) 0 var(--spacing-base);
  font-size: var(--text-small);
  font-weight: bold;
  text-transform: uppercase;
}
input {
  display: block;
  padding: var(--spacing-small) var(--spacing-xsmall);
  width: 100%;
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid var(--neutral-600);
  color: var(--neutral-600);
}
button {
  background: var(--success-200);
  color: var(--neutral-50);
  border: 0;
  padding: var(--spacing-small) var(--spacing-regular);
  margin-top: var(--spacing-regular);
  border-radius: 20px;
  cursor: pointer;
  width: 30%;
}

.toggle-password img {
  width: 25px;
}

.submit {
  text-align: center;
}
.old-password {
  position: relative;
}

.old-password > button {
  position: absolute;
  top: 50%;
  right: var(--spacing-base);
  transform: translateY(-50%);

  background: none;
  color: var(--success-400);
  padding: 0;
  margin: 0;
}
.new-password {
  position: relative;
}

.new-password > button {
  position: absolute;
  top: 50%;
  right: var(--spacing-base);
  transform: translateY(-50%);

  background: none;
  color: var(--success-400);
  padding: 0;
  margin: 0;
}
.confirm-pass {
  position: relative;
}

.confirm-pass > button {
  position: absolute;
  top: 80%;
  right: var(--spacing-base);
  transform: translateY(-50%);

  background: none;
  color: var(--success-400);
  padding: 0;
  margin: 0;
}
@media screen and (max-width: 768px) {
  .reset-pass {
    width: 100%;
  }
  form {
    border: none;
  }
}
</style>
