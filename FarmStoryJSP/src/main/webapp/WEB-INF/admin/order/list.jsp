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
        <%@ include file="../_header.jsp"%>
        <main>
        <%@ include file="../_aside.jsp"%>
        <section class="orderlist">
            <section>
                <h3>주문목록</h3>
                <article>
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="all"></th>
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>판매가격</th>
                                <th>수량</th>
                                <th>배송비</th>
                                <th>합계</th>
                                <th>주문자</th>
                                <th>주문일</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1011</td>
                                <td>사과500g</td>
                                <td class="price">4,000</td>
                                <td>2</td>
                                <td class="price">3,000</td>
                                <td class="price">11,000</td>
                                <td>김유신</td>
                                <td>2023-01-01<br>13:06:14</td>
                                <td><a href="#">[상세확인]</a></td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <article>
                    <h3>
                        <a href="#">선택삭제</a>
                    </h3>
                    <p>
                        <a href="#"> &lt; </a>
                        <b>[1]</b>
                        <a href="#">[2]</a>
                        <a href="#">[3]</a>
                        <a href="#">[4]</a>
                        <a href="#">[5]</a>
                        <a href="#"> &gt; </a>

                    </p>
                </article>
            </section>
        </section>
        </main>
    </div>
    <%@ include file="../_footer.jsp"%>
</body>
<script>
        const now = document.querySelector('a#orderlist[href]');
        if (now) {
            now.classList.add("now");
        }
</script>
</html>




