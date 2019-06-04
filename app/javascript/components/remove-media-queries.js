const removeMediaQueries = () => {
  console.log("TRIGGERED : removeMediaQueries");
  const trigger = document.getElementById("media-query-trigger");
  trigger.parentElement.removeChild(trigger);
};

export { removeMediaQueries }



