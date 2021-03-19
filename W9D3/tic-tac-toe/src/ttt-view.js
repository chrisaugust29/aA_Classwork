class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.$el.append(this.setupBoard())
    this.bindEvents()
  }

  bindEvents() {

      this.$el.on("click","li", event => {
        const currentTarget = $(event.currentTarget)
        this.makeMove(currentTarget)
      })
  }

  makeMove($square) {
   let pos = $square.attr("pos").split(',').map((el) => parseInt(el))
    this.game.playMove(pos) 

    const currentPlayer = this.game.currentPlayer
    
    $square.addClass(currentPlayer);
    if (this.game.isOver()) {
      // cleanup click handlers.
      this.$el.off("click");
      this.$el.addClass("game-over");
      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");
      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);
      } else {
        $figcaption.html("It's a draw!");
      }
      this.$el.append($figcaption);
    }
  }

  setupBoard() {
   const $ul = $("<ul>")
   $ul.addClass("group")

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li>");
        $li.attr("pos", [rowIdx, colIdx]);
        $ul.append($li);
      }
    }
    return $ul
    

  }

  
}

module.exports = View;
