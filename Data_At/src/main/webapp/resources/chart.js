 
const data_list = [];
const data_index = [];

// 데이터 생성
for (let index = 0; index < 80; index++) {
    data_list.push(Math.floor(Math.random() * 80) + 1);
}

for (let i = 0; i < 80; i++) {
    data_index.push(i + 1);
}

console.log(data_list);
console.log(data_index);

// Chart.js 차트 생성
let myCt3 = document.getElementById('myChart3').getContext('2d');

let myChart3 = new Chart(myCt3, {
    type: 'bar',
    data: {
        labels: data_index,
        datasets: [
            {
                label: 'Dataset',
                data: data_list,
                backgroundColor: 'rgba(54, 162, 235, 0.8)', // 막대 색상
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }
        ]
    },
    options: {
    	indexAxis: 'y',
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
      
  
  
  let myCt1 = document.getElementById('myChart1');
  let myCt2 = document.getElementById('myChart2');

   let myChart1 = new Chart(myCt1, {    
	   data: {
	    datasets: [
	    {
	        type: 'bar',
	        label: 'Bar Dataset',
	        data: [20, 40, 10, 30, 80, 70, 30, 90]
	    }, {
	        type: 'line',
	        label: 'Line Dataset',
	        data: [20, 40, 10, 30, 80, 70, 30, 90]
	    }
	    ],
	    labels: ['cat', 'dog', 'human', 'laptop','bird','car','food','tree']
		},
		options:{
			scales: {
			    x: {
			      ticks: {
			        font: {
			          size: 20
			        }
			      }
			    },
			    y: {
			      ticks: {
			        font: {
			          size: 20
			        }
			      }
			    }
			}
		}
    });
    
    let myChart2 = new Chart(myCt2, {    
	   data: {
	    datasets: [
	    {
	        type: 'doughnut',
	        label: 'doughnut Dataset',
	        data: [20, 40, 10, 30, 80, 70, 30, 90]
	    }
	    ],
	    labels: ['cat', 'dog', 'human', 'laptop','bird','car','food','tree']
		},
		options:{
			scales: {
			    x: {
			      ticks: {
			        font: {
			          size: 20
			        }
			      }
			    },
			    y: {
			      ticks: {
			        font: {
			          size: 20
			        }
			      }
			    }
			}
		}
    });