<template>
  <div>Hello {{name}}!</div>
</template>

<script>
export default {
  props: ['name']
}
</script>

<style scoped>
div {
  color: tomato;
}
</style>
