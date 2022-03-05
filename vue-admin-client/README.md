<!-- prettier-ignore -->
# EFPL Admin Client

## File Naming

- **Uses a flat naming structure where child components carry their parent's name**

  - HelloWorld.vue
  - HelloWorldMsg.vue
  - HelloWorldBtn.vue

- **Unit tests placed right beside the component they're testing**
  - HelloWorld.vue
  - HelloWorld.unit.js

## Configuration Files

- **.prettierc**: Prettier linting settings

  - Semi-colon enabled
  - Single-quote disabled

- **.eslintrc**: ESlint liniting settings
  - Moved unit test location to 'src'
- **jest.config.js**: Jest Unit Tester settings
  - Moved unit test location to 'src'
- **lint-staged.config.js**: Lints staged files

## Project setup

```
npm ci
```

### Compiles and hot-reloads for development

```
npm run serve
```

### Run unit tests

```
npm run test-unit
```

### Run end-to-end tests

```
npm run test-e2e
```

### Lints and fixes files

```
npm run lint
```
