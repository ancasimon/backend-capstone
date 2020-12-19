import React from 'react';
import { Link } from 'react-router-dom';
import { Table } from 'reactstrap';

import GameContributedItem from '../GameContributedItem/GameContributedItem';

import gamesData from '../../../helpers/data/gamesData';

import './MyContributions.scss';

class MyContributions extends React.Component {
  state = {
    userContributions: [],
  }

  getUserContributions = () => {
    gamesData.getGamesContributedByAuthedUser()
      .then((userContributionsResponse) => {
        this.setState({ userContributions: userContributionsResponse });
      })
      .catch((error) => console.error('Unable to get the games you submitted.', error));
  }

  componentDidMount() {
    this.getUserContributions();
  }

  render() {
    const addGameLink = '/games/new';
    const { userContributions } = this.state;

    const buildGamesList = () => userContributions.map((game) => (
      <GameContributedItem key={game.id} game={game} />
    ));

    const buildContributionsSection = () => {
      if (userContributions.length > 0) {
        return (
          <div>
              <h2 className="pageTitle">My Contributions</h2>
              <Table>
                <thead>
                  <tr>
                    <th>Game</th>
                    <th className="d-none d-md-table-cell">Still in use?</th>

                    <th className="d-none d-md-table-cell">Keywords</th>
                    <th>View</th>
                  </tr>
                </thead>
                { buildGamesList() }
              </Table>
          </div>
        );
      }
      return (
        <div>
          <h4>Are there any games you use frequently that are not part of our database but should be? <Link to={addGameLink}>Please add them here!</Link></h4>
        </div>
      );
    };

    return (
      <div className="MyContributions">
        { buildContributionsSection() }
      </div>
    );
  }
}
export default MyContributions;
