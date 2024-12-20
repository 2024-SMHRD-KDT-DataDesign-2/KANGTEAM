<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="./resources/payment.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <div id="test-container">
            <!-- 로고 이미지 
            <div id = "logo-image">	      		
      			<img alt="./resources/images/imgTest1.png" src="./resources/images/logo04-02.png">
    		</div>
    		-->
                <div class="payment-details">
                    <h2>Data.At을 이용해주셔서 감사합니다.</h2>
                    <h1>US$ <span id="pay-01"></span>.00</h1>
                    <div class="breakdown">
                        <p style="text-align: left;">구매할 Credit</p>
                        <p style="text-align: right;"><span id="pay-02"></span></p>
                    </div>
                    <div class="breakdown">
                        <p style="text-align: left;">total price</p>
                        <p style="text-align: right;">US$<span id="pay-03"></span>.00</p>
                    </div>
                    <p class="total">지불 총액: <strong>US$<span id="pay-04"></span>.00</strong></p>
                </div>
            </div>
        </div>
        <div class="right-section">
            <form action = "processPayment" method="post" class="payment-form">
                <button class="gpay-button">D Pay</button>
                <div class="divider0">또는 카드 결제</div>
                <input type="email" placeholder="이메일" required>
                <input type="text" placeholder="카드 정보" required>
                <input type="text" placeholder="MM/YY" required>
                <input type="text" placeholder="보안 코드(CVC)" required>
                <input type="text" placeholder="카드 소유자 이름" required>
                <input type="hidden" name="amount" id="amount">
                <select required>
                    <option value="KR">대한민국</option>
                </select>
                <button type="submit">결제</button>
            </form>
            <div>
                <div class="footer-container">
                    <div class="footer">
                        <span id="input-spansize">
                        <span class="powered-by">
                            Powered by <strong>Data.At</strong>
                        </span>
                        <span class="divider"></span>
                        <a href="#" class="footer-link">약관</a>
                        <span class="divider"></span>
                        <a href="#" class="footer-link">개인정보 보호</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script src="./resources/payment_mypage.js"></script>
    <script src="./resources/Payment.js"></script>
   	<script>
   
   	
    console.log(`Payment value22: ${paymentValue}`);
    
 // localStorage에서 'payment'라는 key의 값을 가져옵니다.
    const paymentValue22 = localStorage.getItem('payment');

    // 가져온 값을 확인합니다.
    console.log('Payment Value:', paymentValue22); // 성공!!	
    console.log('Payment Value22:', paymentValue22); // 성공!!	
    console.log(`Payment value22 EL: \${paymentValue22}`); // 실패

    // 값을 숫자로 변환하려면
    const paymentNumber = Number(paymentValue22);
    console.log('Payment Number:', paymentNumber); // 성공!!
    
    console.log('Type of paymentValue22:', typeof paymentValue22);
    console.log('Payment Value22:', paymentValue22);
    console.log(`Payment value22: \${paymentValue22}`);
    
    if (paymentValue22 === null) {
        console.log('paymentValue22 is null');
    } else if (paymentValue22.trim() === '') {
        console.log('paymentValue22 is an empty string');
    } else {
        console.log('Payment value22 is:', paymentValue22);
    }
   	</script> 
   
</body>
</html>
