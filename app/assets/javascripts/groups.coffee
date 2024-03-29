# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.draw_graph = ->
  ctx = document.getElementById("myChart").getContext('2d')
  barNum = 7
  labels = new Array(barNum)
  bgColors = new Array(barNum)
  bdColors = new Array(barNum)
  for i in [0...barNum]
    labels[i] = 'data' + i
    bgColors[i] = 'rgba(75, 192, 192, 0.2)'
    bdColors[i] = 'rgba(75, 192, 192, 1)'
  myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: gon.labels
      datasets: [{
        label: '# 達成度比較',
        data: gon.datas,
        backgroundColor: bgColors,
        borderColor: bdColors,
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            suggestedMax: 100,
            beginAtZero:true
          }
        }]
      }
    }
  })