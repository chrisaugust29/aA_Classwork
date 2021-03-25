import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.updateGame(this.props.tile, e.altKey);
  }

  render() {
    let piece;
    if (this.props.tile.explored) { // revealed tiles
      if (this.props.tile.bombed) {piece = '\u{1f4a9}';} // bomb here
      else {
        if (this.props.tile.adjacentBombCount() === 0) {piece = ' ';} // no bomb here, no bombs around
        else {piece=`${this.props.tile.adjacentBombCount()}`;} // no bomb here, some bombs around
      }
    } else { // face down tiles
      if (this.props.tile.flagged) {piece = '\u{1F3F4}'} // flag here
      else {piece = '\u{26aa}'} // unchecked
    }
    
    return (
     <p onClick={this.handleClick}>{piece}</p>
    )
  }
}

export default Tile;