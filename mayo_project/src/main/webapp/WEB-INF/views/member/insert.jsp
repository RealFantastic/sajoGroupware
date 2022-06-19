<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/emp_enroll.css" rel="stylesheet">   
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 다음 우편주소api  -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
    
</head>
<jsp:include page="/WEB-INF/views/template_header.jsp"/>
<body id="j_background">
    <div>
        <form id="emp_enroll"
        	 action="<%=request.getContextPath()%>/member/enroll"
			 method="post" enctype="multipart/form-data">
            <section>
            <div id="j_container">
            <p id="j_title"><h1><strong>회원가입</strong></h1></p>
             <div id="j_container1">
                    <div id="j_cp_number" class="j_e">
                        <label>사업자 번호 : </label>
                        <input type="text" id="cp_number" name="cp_number" required >
                        <!--TODO : 사업자 번호 조회 방식 추후 수정 -->
                        <button type="button" id="cp_number_btn" onclick = "checkNum()">조회</button>
                        <br><font id="check_result" size ="2"></font>
                    </div>             
                    <div id="j_name" class="j_e">
                        <label>이름 : </label>
                        <input type="text" id="emp_name" name="emp_name">
                    </div>
                    <div id="j_emp_number" class="j_e">
                        <label>주민 번호 : </label>
                        <input type="text" id="rrn" name="rrn">
                        <button type="button">조회</button>
                    </div>
                    <div class="j_e" id="j_dept">
                        <label>부서 : </label>
                        <select id="dept_no" name="dept_no" required="required">
                            <option value="">선택</option>
                            <option value="10">인사팀</option>
                            <option value="20">영업팀</option>
                            <option value="30">총무팀</option>
                        </select>
                    </div>
                    <div class="j_e" id="j_job">
                        <label>직위 : </label>
	                    <select>
	                    	<option value="">선택</option>
	                    	<option value="1">사원</option>
	                    	<option value="2">대리</option>
	                    	<option value="3">과장</option>
	                    </select>
                    </div>
                    <div id="j_emp_no" class="j_e">
                        <label for="emp_no">아이디(사원번호) : </label>
                        <input type="text" id="emp_no" name="emp_no">
                        <button type="button">조회</button>
                    </div>
                    <div id="j_pwd" class="j_e">
                        <label>비밀번호 : </label>
                        <input type="password" id="password" name="password">
                    </div>
                    <div id="j_pwd_chk" class="j_e">
                        <label for="password">비밀번호 재확인 : </label>
                        <input type="password" id="password_chk">
                    </div>

                    <div class="j_e">
                        <label for="hire_date">입사일 : </label>
                        <input type="date" id="hire_date" name="hire_date" />
                    </div>
                    <div>
                        <div id="j_email" class="j_e">
                            <label>이메일 : </label>
                            <div>
                            <input type="text" id="email_id" name="email_id" >
                            <span>@</span>
                            <input type="text" id="domain" name="domain" />
                            <select id="domain_list">
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="direct">직접입력</option>
                              </select>
                            </div>
                        </div>
    
                        <div id="email_check" class="j_e">
                            <label>인증번호 : </label>
                            <input type="text" id="email_check_no">
                            <button type="button" id="email_check_btn">인증</button>
                        </div>
                    </div>

                </div>
                <div id="j_line" class="j_e">
                </div>
                <div id="j_container2">

                    <div>
                        <div class="j_e">
                            <label style="font-size: larger;">주소</label>
                        </div>
                        <div class="j_e">
                            <div>
                                <label>우편번호 : </label>
                                <input type="text" id="sample6_postcode" placeholder="우편번호" value="emp_postcode">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            </div>
                            <div>
                                <label>주소 : </label>
                                <input type="text" id="sample6_address" placeholder="주소" value="address"><br>                        
                            </div>
                            <div>
                                <label for="sample6_detailAddress">상세주소 : </label>
                                <input type="text" id="sample6_detailAddress" placeholder="상세주소" value="detail_address">
                          	    <input type="text" id="sample6_extraAddress" placeholder="참고항목" 
                            style="width: 100px;">
                            </div>
                        </div>
                    </div>
                    <div id="j_emp_phone" class="j_e">
                        <label for="phone">전화번호 : </label>
                        <input type="text" id="phone" name="phone">
                    </div>
                    <div class="j_e" id="j_sign_file">
                        <label for="sign_file">서명파일 : </label>
                        <input type="file" id="sign_file" name="sign_file">
                    </div>



                    <div id="clause">
                        <ul>
                            <li>
                                <hr id="j_cline">
                            </li>
                        <li>
                            <label><a>이용약관 동의</a>(필수)</label>
                            <input type="checkbox" class="clause" id="clause1" name="clause1" required="required">
                        </li>
                        <li>
                            <label><a>개인 정보 수집및 이용 동의</a>(필수)</label>
                            <input type="checkbox" class="clause" id="clause2" name="clause2" required="required">
                        </li>
                        <li>
                            <label><a>마케팅 정보 활용 및 광고성 정보 수신 동의</a>(선택)</label>
                            <input type="checkbox" class="clause" id="clause3" name="clause3">
                        </li>
                        <li>
                            <br>
                            <label><a><strong>모두 동의 하기</strong></a></label>
                            <input type="checkbox" class="clause" id="clauseAll" name="clauseAll">                                
                        </li>
                    </ul>
                </div>
                <div id="j_btn">
                    <button type="reset" class="btn_yellow">뒤로가기</button>
                    <button type="submit" class="btn_green">가입</button>
                </div>
            </div>
            </div>
            </section>
        </form>
        <footer>
            <p class="mb-1" id="j_footer">&copy; 2022 참치 마요 주식회사 - 대표자 참지 않아 박정환</p>
        </footer>
    </div>

    <!-- 이메일 직접입력 -->
    <script>
        $(function (){

        //직접입력 인풋박스 기존에는 숨어있다가
        $("#domain").hide();
        $("#domain_list").change(function() {
            console.log("변했음.");
            //  직접입력을 누를 때 나타남
            if($(this).val()=="direct") {
                $("#domain").show();
                
            }  else {
                $("#domain").hide();
            }
            }) 
        });
   
    </script>
    <!-- 약관 모두 동의 -->
    <script>
        $(document).ready( function() {
          $( "#clauseAll" ).click( function() {
            $( '.clause' ).prop( 'checked', this.checked );
          } );
        } );
      </script>
</body>
</html>