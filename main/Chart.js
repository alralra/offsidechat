import Data from "./Data.json";
const data = {
  labels: ["Red", "Green"],
  datasets: [
    {
      data: [700, 300],
      needleValue: 60,
      backgroundColor: ["red", "#FFCE56", "lightgreen"],
      hoverBackgroundColor: ["red", "#FFCE56", "lightgreen"]
    }
  ],
  options: {
    layout: {
      padding: {
        bottom: 2
      }
    },
    rotation: 1 * Math.PI,
    circumference: 1 * Math.PI,
    legend: {
      display: false
    },
    tooltip: {
      enabled: false
    },
    cutoutPercentage: 85
  }
};

export default class DonutChart extends Component {
  render() {
    return (
      <div>
        <h2>Sample</h2>
        <Doughnut height="100px" data={data} options={data.options} />
      </div>
    );
  }

  componentDidMount() {
    Chart.pluginService.register({
      afterDraw: (chart) => {
        var needleValue = chart.chart.config.data.datasets[0].needleValue;
        var dataTotal = chart.chart.config.data.datasets[0].data.reduce(
          (a, b) => a + b,
          0
        );
        var angle = Math.PI + (1 / dataTotal) * needleValue * Math.PI;
        var ctx = chart.chart.ctx;
        var cw = chart.chart.canvas.offsetWidth;
        var ch = chart.chart.canvas.offsetHeight;
        var cx = cw / 2;
        var cy = ch - 6;

        ctx.translate(cx, cy);
        ctx.rotate(angle);
        ctx.beginPath();
        ctx.moveTo(0, -3);
        ctx.lineTo(ch - 10, 0);
        ctx.lineTo(0, 3);
        ctx.fillStyle = "rgb(0, 0, 0)";
        ctx.fill();
        ctx.rotate(-angle);
        ctx.translate(-cx, -cy);
        ctx.beginPath();
        ctx.arc(cx, cy, 5, 0, Math.PI * 2);
        ctx.fill();
      }
    });
  }
}