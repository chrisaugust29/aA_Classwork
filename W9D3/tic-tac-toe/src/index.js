const View = require('./ttt-view');
const Game = require('./game');

  $(() => {
    const box = $('.ttt');
    const game = new Game();
    new View(game, box);
  });
