const dataClasses = []; // data_class 값을 저장할 리스트
const imgCounts = [];   // img_cnt 값을 저장할 리스트

  $(document).ready(function () {
	const img_id = $("#img_id").val() ;

	$.ajax({
		url : "chartJson",
		type : "POST",
		data : {"img_id" : img_id},
		success : function(response){
			console.log("chart : ", response)
			let data = response;
			
			// for 반복문 사용
			for (let i = 0; i < data.length; i++) {
			    dataClasses.push(data[i].data_class);
			    imgCounts.push(data[i].img_cnt);
			}
			
		},
		error : function() {
			alert("chart 불러오기 실패") ;
		}
	}) ;
})    
console.log("dataClasses : " + dataClasses); // ["laptop", "dog", "cat"]
console.log("imgCounts : " + imgCounts);   // [65, 9, 3]

  
  
  let myCt1 = document.getElementById('myChart1');
  let myCt2 = document.getElementById('myChart2');

   let myChart1 = new Chart(myCt1, {    
	   data: {
	    datasets:[ 
	    {
	        type: 'bar',
	        label: 'Bar Dataset',
	        data: imgCounts
	    } 
	    ],
	    labels:  dataClasses
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
                data: imgCounts
                
            }
        ],
        labels: dataClasses
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

