<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator</title>
    <link rel="stylesheet" href="/FarmStoryJSP/css/admin.css">
</head>
<body>
    <div id="wrap">
        <%@ include file="./_header.jsp"%>
        <main>
            <%@ include file="./_aside.jsp"%>
            <section>
                <h3>관리자 메인</h3>
                <article>
                    <h3>
                        <a href="./product/list.do">상품현황</a>
                        <a href="./product/list.do" class="more">더보기</a>
                    </h3>
                    <table>
                        <thead>
                            <tr>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>구분</th>
                                <th>가격</th>
                                <th>재고</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1011</td>
                                <td>사과500g</td>
                                <td>과일</td>
                                <td class="price">4,000</td>
                                <td>100</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td>1011</td>
                                <td>사과500g</td>
                                <td>과일</td>
                                <td class="price">4,000</td>
                                <td>100</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td>1011</td>
                                <td>사과500g</td>
                                <td>과일</td>
                                <td class="price">4,000</td>
                                <td>100</td>
                                <td>2023-01-01</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <article>
                    <h3>
                        <a href="./order/list.do">주문현황</a>
                        <a href="./order/list.do" class="more">더보기</a>
                    </h3>
                    <table>
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>판매가격</th>
                                <th>수량</th>
                                <th>배송비</th>
                                <th>합계</th>
                                <th>주문자</th>
                                <th>주문일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1011</td>
                                <td>사과 500g</td>
                                <td class="price">4,000</td>
                                <td class="stock">2</td>
                                <td class="price">3,000</td>
                                <td class="price">8,000</td>
                                <td>홍길동</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td>1011</td>
                                <td>사과 500g</td>
                                <td class="price">4,000</td>
                                <td class="stock">2</td>
                                <td class="price">3,000</td>
                                <td class="price">8,000</td>
                                <td>홍길동</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td>1011</td>
                                <td>사과 500g</td>
                                <td class="price">4,000</td>
                                <td class="stock">2</td>
                                <td class="price">3,000</td>
                                <td class="price">8,000</td>
                                <td>홍길동</td>
                                <td>2023-01-01</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <article>
                    <h3>
                        <a href="./user/list.do">회원현황</a>
                        <a href="./user/list.do" class="more">더보기</a>
                    </h3>
                    <table>
                        <thead>
                            <tr>
                                <th>회원아이디</th>
                                <th>이름</th>
                                <th>닉네임</th>
                                <th>휴대폰</th>
                                <th>이메일</th>
                                <th>등급</th>
                                <th>회원가입일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>a101</td>
                                <td>김유신</td>
                                <td>유신123</td>
                                <td>010-1234-1001</td>
                                <td>yusin123@naver.com</td>
                                <td>2</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td>a101</td>
                                <td>김유신</td>
                                <td>유신123</td>
                                <td>010-1234-1001</td>
                                <td>yusin123@naver.com</td>
                                <td>2</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td>a101</td>
                                <td>김유신</td>
                                <td>유신123</td>
                                <td>010-1234-1001</td>
                                <td>yusin123@naver.com</td>
                                <td>2</td>
                                <td>2023-01-01</td>
                            </tr>
                        </tbody>
                    </table>
                
                </article>
            </section>
        </main>
    </div>
    <%@ include file="./_footer.jsp"%>
</body>
</html>




