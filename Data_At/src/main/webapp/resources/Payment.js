/**
 * 
 */
const price = localStorage.getItem("payment");
const points = Number(price)*20; // string 타입에서 number 타입으로 바꿔주기
console.log(`points : ${points}`); 

console.log(`price is ${price}`); // 성공!


document.getElementById('pay-01').innerText = price;
document.getElementById('pay-02').innerText = points;
document.getElementById('pay-03').innerText = price;
document.getElementById('pay-04').innerText = price;

$("#amount").val(points) ;