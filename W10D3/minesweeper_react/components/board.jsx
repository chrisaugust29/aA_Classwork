import React from 'react';
import Tile from './tile';

class Boardd extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {

    const tiles = this.props.board.map((row, index) => {
      return(
        <div className='row' key={index}>
          {
            row.map((tile, idx) => {
              return (
                <Tile tile={tile} updateGame={this.props.updateGame} key={idx}/>
              )
            })
          }
        </div>
      )
    });

    return(
      <div className="board-box">
        {tiles}
      </div>
    )
  }
}

export default Boardd;