const compareCache = (value, cache) => {
  let result = false;
  for (let i = 0; i < cache.length; i++) {
    if (JSON.stringify(value) == JSON.stringify(cache[i])) {
      result = true;
      break;
    }
  }

  return result;
};

export { compareCache };
