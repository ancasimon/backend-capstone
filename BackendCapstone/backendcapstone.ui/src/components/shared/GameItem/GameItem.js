import React from 'react';
import { Link } from 'react-router-dom';
import {
  Card,
  Button,
  CardHeader,
  CardFooter,
  CardBody,
  CardTitle,
  CardText,
} from 'reactstrap';

import AgeItem from '../AgeItem/AgeItem';
import InstrumentItem from '../InstrumentItem/InstrumentItem';

import gameItemShape from '../../../helpers/propz/gameItemShape';

import './GameItem.scss';

class GameItem extends React.Component {
  static propTypes = {
    gameItem: gameItemShape.gameItemShape,
  }

  render() {
    const { gameItem } = this.props;
    const singleGameLink = `/games/${gameItem.id}`;

    const displayInstruments = () => gameItem.instrumentsForGame.map((instrument) => (
      <InstrumentItem key={instrument.id} instrument={instrument} />
    ));

    const displayAges = () => gameItem.agesForGame.map((age) => (
      <AgeItem key={age.id} age={age} />
    ));

    return (
      <div className="col-md-4 gameCard">
        <Card>
        <CardHeader className="gameCardHeader">
          <div className="gameIcon"><i class={gameItem.gameIconHtml}></i></div>
          <div className="gameCardHeaderTitle">{gameItem.name}</div>
        </CardHeader>
        <CardBody>
          <CardTitle tag="h5"></CardTitle>
          <CardText>
            <p><span className="label">Instruments:</span>    {displayInstruments()}</p>
            <p><span className="label">Prework Level:</span>    {gameItem.preworkLevelName}</p>
            <p><span className="label">Ages:</span>    {displayAges()}</p>
          </CardText>
        </CardBody>
        <CardFooter className="cardFooter">
          <Link to='/games/{gameItem.id}' className="iconButtons doubleSize"><i class="fas fa-binoculars"></i></Link>
        </CardFooter>
      </Card>

      </div>
    );
  }
}

export default GameItem;
