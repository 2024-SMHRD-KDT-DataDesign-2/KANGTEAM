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
                    <h1>US$100.00</h1>
                    <div class="breakdown">
                        <p style="text-align: left;">구매할 Credit</p>
                        <p style="text-align: right;">각 US$1.00</p>
                    </div>
                    <div class="breakdown">
                        <p style="text-align: left;">수량 100</p>
                        <p style="text-align: right;">US$100.00</p>
                    </div>
                    <p class="total">지불 총액: <strong>US$100.00</strong></p>
                </div>
            </div>
        </div>
        <div class="right-section">
            <form class="payment-form">
                <button class="gpay-button">D Pay</button>
                <div class="divider0">또는 카드 결제</div>
                <input type="email" placeholder="이메일" required>
                <input type="text" placeholder="카드 정보" required>
                <input type="text" placeholder="MM/YY" required>
                <input type="text" placeholder="보안 코드(CVC)" required>
                <input type="text" placeholder="카드 소유자 이름" required>
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
                            Powered by <strong>stripe</strong>
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
    <script src="/test_최종프로젝트/js/test5.js"></script>
</body>
</html>
