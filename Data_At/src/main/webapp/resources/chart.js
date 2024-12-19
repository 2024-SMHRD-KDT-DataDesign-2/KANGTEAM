// 화면 시연을 위한 더미 데이터 랜덤으로 넣기 
// 클래스 80개
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
	    datasets:[ 
	    {
	        type: 'bar',
	        label: 'Bar Dataset',
	        data: [20, 40, 10, 30, 80, 70, 30, 90]
	    } 
	    ],
	    labels:  ['apple', 'melon', 'banana', 'pear','dragonfruit','grape','orange','peach']
		},
		options:{
			scales: {
			    x: {
			      ticks: {
			        font: {
			          size: 20,
			          family: "'Montserrat', Arial, sans-serif" // 변경된 폰트 패밀리
			        }
			      }
			    },
			    y: {
			      ticks: {
			        font: {
			          size: 20,
			            family: "'Montserrat', Arial, sans-serif" // 변경된 폰트 패밀리
			        }
			      }
			    }
			}
		}
    });
    
 let myChart2 = new Chart(myCt2, {
    type: 'doughnut',
    data: {
        datasets: [
            {
                label: 'Doughnut Dataset',
                data: [20, 40, 10, 30, 80, 70, 30, 90],
                backgroundColor: [
                    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', 
                    '#9966FF', '#FF9F40', '#E7E9ED', '#71B37C'
                ]
            }
        ],
        labels: ['apple', 'melon', 'banana', 'pear','dragonfruit','grape','orange','peach']
    },
    options: {
        responsive: false, // Set to false if you want a fixed size
        plugins: {
            legend: {
                display: true, // Show legend
                position: 'top',
                labels: {
                    font: {
                        size: 20,
                        family: "'Montserrat', Arial, sans-serif" // 변경된 폰트 패밀리
                    },
                    color: '#333'
                }
            }
        }
    },
    plugins: [
        {
            id: 'custom-labels',
            afterDraw: (chart) => {
                const { ctx, data } = chart;
                const dataset = data.datasets[0];
                const total = dataset.data.reduce((acc, val) => acc + val, 0); // 전체 합 계산

                dataset.data.forEach((value, index) => {
                    const meta = chart.getDatasetMeta(0).data[index];
                    const position = meta.tooltipPosition();

                    // 퍼센트 계산
                    const percent = ((value / total) * 100).toFixed(1) + '%';

                    // 텍스트 스타일 설정
                    ctx.fillStyle = '#fff'; // 텍스트 색상
                    ctx.font = 'bold 30px "Montserrat", Arial, sans-serif'; // 폰트 설정
                    ctx.textAlign = 'center';

                    // 데이터 라벨 표시 (퍼센트)
                    ctx.fillText(percent, position.x, position.y - 10); // 퍼센트 표시
                    ctx.fillText(data.labels[index], position.x, position.y + 10); // 데이터 레이블 표시
                });
            }
        }
    ]
});