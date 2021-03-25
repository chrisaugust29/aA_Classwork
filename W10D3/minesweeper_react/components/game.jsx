import React from 'react';
import * as Sweep from '../minesweeper';

import Boardd from './board';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {board: new Sweep.Board(10, 8)}

    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tileObj, boo) {
    if (boo) {
      tileObj.toggleFlag();
    }else{
      tileObj.explore();
    }
    this.setState({ board: this.state.board })
  }

  restartGame() {
    this.setState({ board: new Sweep.Board(10, 8)})
  }

  render() {
    let gameStatus;
    let restartButton;
    if (this.state.board.won()) {
      gameStatus = 'You beat game'; 
      restartButton = <p onClick={this.restartGame}>Restart</p>

    } else if(this.state.board.lost()) {
      gameStatus = 'Youre a Loser';
      restartButton = <p onClick={this.restartGame}>Restart</p>
    }else{
      gameStatus = '';
    }

  
    return (
      <div >
        <div className ='box'>
        <h1>{gameStatus}</h1>
        {restartButton}
        </div>
        <Boardd board={this.state.board.grid} updateGame={this.updateGame}/>
      </div>
    )
  }
}

export default Game;