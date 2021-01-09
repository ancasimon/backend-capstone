import React, { PureComponent } from 'react';
import {
  ResponsiveContainer, PieChart, Pie, Legend, Tooltip,
} from 'recharts';
import { Link } from 'react-router-dom';

import gamesData from '../../../helpers/data/gamesData';

class PieChartPopularGames extends PureComponent {
  state = {
    data: [],
  }

  getMostPopularGames = () => {
    gamesData.getMostPopularGames()
      .then((mostPopularGamesResponse) => {
        this.setState({ data: mostPopularGamesResponse });
      })
      .catch((error) => console.error('Could not get most popular games.', error));
  }

  componentDidMount() {
    this.getMostPopularGames();
  }

  render() {
    const { data } = this.state;

    return (
      <div style={{ width: '150%', height: 275 }} class="PieChartPopularGames">
      <ResponsiveContainer>
        <PieChart>
          <Pie dataKey="value" data={data} fill="green" label={(entry) => entry.name} />
        </PieChart>
      </ResponsiveContainer>
      </div>

    );
  }
}

export default PieChartPopularGames;
