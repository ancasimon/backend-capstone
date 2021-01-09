import React, { PureComponent } from 'react';
import {
  ResponsiveContainer, PieChart, Pie, Legend, Tooltip,
} from 'recharts';
import { Link } from 'react-router-dom';

import gamesData from '../../../helpers/data/gamesData';

class Example extends PureComponent {
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
    // <PieChart width={400} height={400}>
    //   <Pie dataKey="value" isAnimationActive={false} data={data01} cx={200} cy={200} outerRadius={80} fill="#286086" label={(entry) => entry.name} />
    //   <Pie dataKey="value" data={data02} cx={500} cy={200} innerRadius={40} outerRadius={80} fill="#82ca9d" />
    //   <Tooltip />
    // </PieChart>

      <div style={{ width: '100%', height: 300 }}>
      <ResponsiveContainer>
        <PieChart>
          <Pie dataKey="value" data={data} fill="#286086" label={(entry) => entry.name} />
        </PieChart>
      </ResponsiveContainer>
      </div>

    );
  }
}

export default Example;
