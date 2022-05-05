import en from "./locales/en.json";
import am from "./locales/am.json";

import { createI18n } from "vue-i18n/index";

export default createI18n({
  locale: localStorage.getItem("lang") || "en",
  messages: {
    en: en,
    am: am,
  },
});
