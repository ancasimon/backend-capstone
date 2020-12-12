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
            <h6><span className="label">Instruments:</span>    {displayInstruments()}</h6>
            <h6><span className="label">Prework Level:</span>    {gameItem.preworkLevelName}</h6>
            <h6><span className="label">Ages:</span>    {displayAges()}</h6>
          </CardText>
        </CardBody>
        <CardFooter className="cardFooter">
          <Link to={singleGameLink} className="iconButtons doubleSize"><i class="fas fa-binoculars"></i></Link>
        </CardFooter>
      </Card>

      </div>
    );
  }
}

export default GameItem;
