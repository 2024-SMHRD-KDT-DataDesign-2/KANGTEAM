$(document).ready(function () {
    const img_id = $("#img_id").val();

    $.ajax({
        url: "chartJson",
        type: "POST",
        data: { "img_id": img_id },
        success: function (response) {
            console.log("chart : ", response);

            // JSON 형식으로 변환
            let data2JSON = JSON.parse(response);

            // 데이터 분리
            const dataClasses = data2JSON.map(item => item.data_class);
            const imgCounts = data2JSON.map(item => item.img_cnt);

            console.log("dataClasses : ", dataClasses);
            console.log("imgCounts : ", imgCounts);

            // 차트 생성
            createCharts(dataClasses, imgCounts);
        },
        error: function () {
            alert("chart 불러오기 실패");
        }
    });
});

function createCharts(dataClasses, imgCounts) {
    let myCt1 = document.getElementById('myChart1');
    let myCt2 = document.getElementById('myChart2');

    let myChart1 = new Chart(myCt1, {
        data: {
            datasets: [
                {
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: imgCounts
                }
            ],
            labels: dataClasses
        },
        options: {
            scales: {
                x: {
                    ticks: {
                        font: {
                            size: 20,
                            family: "'Montserrat', Arial, sans-serif"
                        }
                    }
                },
                y: {
                    ticks: {
                        font: {
                            size: 20,
                            family: "'Montserrat', Arial, sans-serif"
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
	                data: imgCounts,
	                backgroundColor: [
	                    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0',
	                    '#9966FF', '#FF9F40', '#E7E9ED', '#71B37C'
	                ]
	            }
	        ],
	        labels: dataClasses
	    },
	    options: {
	        responsive: false,
	        plugins: {
	            legend: {
	                display: true,
	                position: 'top',
	                labels: {
	                    font: {
	                        size: 20,
	                        family: "'Montserrat', Arial, sans-serif"
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
	                    ctx.fillText(percent, position.x, position.y);
	                });
	            }
	        }
	    ]
	});
}
