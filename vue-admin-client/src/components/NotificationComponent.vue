<template>
  <!-- Notification Bar -->

  <section
    class="notification-container"
    v-show="showNotification"
    :class="
      notificationType === 'success'
        ? 'success-bg'
        : notificationType === 'warning'
        ? 'warning-bg'
        : 'error-bg'
    "
  >
    <!-- Icon -->
    <div class="icon-container">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        version="1.1"
        width="256"
        height="256"
        viewBox="0 0 256 256"
        xml:space="preserve"
      >
        <desc>Created with Fabric.js 1.7.22</desc>
        <defs></defs>
        <g transform="translate(128 128) scale(0.72 0.72)" style="">
          <g
            style="
              stroke: none;
              stroke-width: 0;
              stroke-dasharray: none;
              stroke-linecap: butt;
              stroke-linejoin: miter;
              stroke-miterlimit: 10;
              fill: none;
              fill-rule: nonzero;
              opacity: 1;
            "
            transform="translate(-175.05 -175.05000000000004) scale(3.89 3.89)"
          >
            <path
              :class="
                notificationType === 'success'
                  ? 'success-fill'
                  : notificationType === 'warning'
                  ? 'warning-fill'
                  : 'error-fill'
              "
              d="M 85.429 85.078 H 4.571 c -1.832 0 -3.471 -0.947 -4.387 -2.533 c -0.916 -1.586 -0.916 -3.479 0 -5.065 L 40.613 7.455 C 41.529 5.869 43.169 4.922 45 4.922 c 0 0 0 0 0 0 c 1.832 0 3.471 0.947 4.386 2.533 l 40.429 70.025 c 0.916 1.586 0.916 3.479 0.001 5.065 C 88.901 84.131 87.261 85.078 85.429 85.078 z M 45 7.922 c -0.747 0 -1.416 0.386 -1.79 1.033 L 2.782 78.979 c -0.373 0.646 -0.373 1.419 0 2.065 c 0.374 0.647 1.042 1.033 1.789 1.033 h 80.858 c 0.747 0 1.416 -0.387 1.789 -1.033 s 0.373 -1.419 0 -2.065 L 46.789 8.955 C 46.416 8.308 45.747 7.922 45 7.922 L 45 7.922 z M 45 75.325 c -4.105 0 -7.446 -3.34 -7.446 -7.445 s 3.34 -7.445 7.446 -7.445 s 7.445 3.34 7.445 7.445 S 49.106 75.325 45 75.325 z M 45 63.435 c -2.451 0 -4.446 1.994 -4.446 4.445 s 1.995 4.445 4.446 4.445 s 4.445 -1.994 4.445 -4.445 S 47.451 63.435 45 63.435 z M 45 57.146 c -3.794 0 -6.882 -3.087 -6.882 -6.882 V 34.121 c 0 -3.794 3.087 -6.882 6.882 -6.882 c 3.794 0 6.881 3.087 6.881 6.882 v 16.144 C 51.881 54.06 48.794 57.146 45 57.146 z M 45 30.239 c -2.141 0 -3.882 1.741 -3.882 3.882 v 16.144 c 0 2.141 1.741 3.882 3.882 3.882 c 2.14 0 3.881 -1.741 3.881 -3.882 V 34.121 C 48.881 31.98 47.14 30.239 45 30.239 z"
              style="
                stroke: none;
                stroke-width: 1;
                stroke-dasharray: none;
                stroke-linecap: butt;
                stroke-linejoin: miter;
                stroke-miterlimit: 10;
                fill: rgb(0, 0, 0);
                fill-rule: nonzero;
                opacity: 1;
              "
              transform=" matrix(1 0 0 1 0 0) "
              stroke-linecap="round"
            />
          </g>
        </g>
      </svg>
    </div>

    <!-- Text -->
    <div
      :class="
        notificationType === 'success'
          ? 'success-fg'
          : notificationType === 'warning'
          ? 'warning-fg'
          : 'error-fg'
      "
      class="message-container"
    >
      {{ notificationMessage }}
    </div>

    <div
      @click="closeNotification"
      class="close-button"
      :class="
        notificationType === 'success'
          ? 'success-fg'
          : notificationType === 'warning'
          ? 'warning-fg'
          : 'error-fg'
      "
    >
      X
    </div>
  </section>
</template>

<style scoped>
.notification-container {
  min-width: 400px;
  width: 450px;
  min-height: 80px;
  position: fixed;
  z-index: 5;
  top: 80px;
  right: 0px;
  padding: 12px 12px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.icon-container > svg {
  width: 55%;
  height: auto;
}
.icon-container {
  width: 25%;

  display: flex;
  align-items: center;
}
.message-container {
  width: 75%;
  display: flex;
  align-items: center;
  text-align: start;
}
/* Dynamic Classes */
.show {
  display: inline;
}
.hide {
  display: none;
}
.error-bg {
  background: #f8d7da;
}
.warning-bg {
  background: #fff3cd;
}
.success-bg {
  background: var(--success-100);
}
.error-fg {
  color: red;
}
.warning-fg {
  color: black;
}
.success-fg {
  color: var(--success-400);
}

.error-fill {
  fill: red !important;
}
.warning-fill {
  fill: black !important;
}
.success-fill {
  fill: green !important;
}
</style>

<script>
import store from "../store/index";

// Icons
import { successIcon, warningIcon, errorIcon } from "../utils/Icons";
export default {
  name: "NotificationComponent",

  data() {
    return {
      successIcon: successIcon,
      warningIcon: warningIcon,
      errorIcon: errorIcon,
    };
  },

  computed: {
    showNotification() {
      return store.state.Global.showNotification;
    },
    notificationMessage() {
      return store.state.Global.notificationMessage;
    },
    notificationType() {
      return store.state.Global.notificationType;
    },
    notificationDuration() {
      return store.state.Global.notificationDuration;
    },
  },

  methods: {
    closeNotification() {
      store.dispatch("Global/setNotificationInfo", {
        showNotification: false,
      });
    },
  },

  updated() {
    // Auto duration close
    setTimeout(() => {
      this.closeNotification();
    }, this.notificationDuration);
  },
};
</script>
