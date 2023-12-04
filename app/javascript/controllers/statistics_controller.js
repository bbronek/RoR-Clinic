import { Controller } from "stimulus";
import Chart from "chart.js/auto";

export default class extends Controller {
  connect() {
    this.fetchData();
  }

  fetchData() {
    fetch("/statistics/patient_births")
        .then(response => response.json())
        .then(data => this.drawChart(data));
  }

  drawChart(data) {
    const ctx = document.getElementById("birthChart").getContext("2d");
    new Chart(ctx, {
      type: "bar",
      data: {
        labels: Object.keys(data),
        datasets: [{
          label: "Patient Births",
          data: Object.values(data),
          backgroundColor: "rgba(75, 192, 192, 0.2)",
          borderColor: "rgba(75, 192, 192, 1)",
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: { beginAtZero: true }
        }
      }
    });
  }
}
