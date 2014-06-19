function postCard(blurb) {
  this.message = blurb;
}

postCard.prototype.message = function() {
  return this.message;
};