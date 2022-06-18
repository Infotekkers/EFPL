<template>
  <div class="pagenotfound">
    <div>
      <h1 class="fourofourtitle">404</h1>
    </div>
    <h1>{{ $t("Page Not Found") }}</h1>
    <p class="not-found-text">{{ $t("Not Found Text") }}</p>
  </div>
</template>

<style scoped>
@import "../assets/design-system.css";

.pagenotfound {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 90vw;
  max-width: 600px;

  /* padding: var(--spacing-xlarge); */
}
.fourofourtitle {
  top: 50%;
  left: 50%;
  margin: 0;
  --transform-translate-x: -50%;
  color: rgb(153, 140, 140);
  font-family: Georgia, Cambria, "Times New Roman", Times, serif;
  font-size: 8rem;
  line-height: 1;
  font-weight: 900;
}
h1 {
  font-size: var(--text-large);
  font-weight: 500;
  color: var(--neutral-600);
  margin-bottom: var(--spacing-base);
}
@media screen and (max-width: 768px) {
  .pagenotfound {
    width: 100%;
  }
}
</style>
