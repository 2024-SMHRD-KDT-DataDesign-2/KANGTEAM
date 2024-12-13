<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
</style>

</head>
<body>

   <div>
      <!-- 파일 업로드시 사용해야하는 속성 ! enctype 
                1. 파일 업로드시 form 태그에서 꼭 필요한 속성
                2. post 방식일때만 사용이 가능 -->
      <form action="upload" method="post" enctype="multipart/form-data">
         <table id="list">
            <tr>
               <td>파일 선택</td>
               <td><input type="file" name="imgfile" multiple
                  style="float: right;"></td>
            </tr>
            <tr>
               <td><input type="submit" value="작성하기"></td>
            </tr>
         </table>
      </form>


   </div>
   <script type="text/javascript">
      document
            .addEventListener(
                  'DOMContentLoaded',
                  function() {
                     const myPageIcon = document
                           .querySelector('.mypage-icon');
                     const myPageDropdown = document
                           .querySelector('.mypage-dropdown');

                     myPageIcon
                           .addEventListener(
                                 'click',
                                 function() {
                                    myPageDropdown.style.display = myPageDropdown.style.display === 'flex' ? 'none'
                                          : 'flex';
                                 });

                     window.addEventListener('click', function(event) {
                        if (!myPageIcon.contains(event.target)
                              && !myPageDropdown
                                    .contains(event.target)) {
                           myPageDropdown.style.display = 'none';
                        }
                     });
                  });
   </script>
</body>
</html>

