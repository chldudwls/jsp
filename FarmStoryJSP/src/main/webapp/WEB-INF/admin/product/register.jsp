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
        	<section class="prodReg">
	            <section>
	                <h3>상품등록</h3>
	                <article>
	                    <form action="#">
	                        <table>
	                            <tbody>
	                                <tr>
	                                    <td>상품명</td>
	                                    <td><input type="text" name="prodName"></td>
	                                </tr>
	                                <tr>
	                                    <td>종류</td>
	                                    <td><select>
	                                            <option>종류</option>
	                                    </select></td>
	                                </tr>
	                                <tr>
	                                    <td>가격</td>
	                                    <td><input type="number" name="prodPrice"></td>
	                                </tr>
	                                <tr>
	                                    <td>포인트</td>
	                                    <td><input type="number" name="point">&nbsp;포인트는 가격의 1%</td>
	                                </tr>
	                                <tr>
	                                    <td>할인</td>
	                                    <td>
	                                        <select name="discount">
	                                            <option>없음</option>
	                                            <option selected>5%</option>
	                                            <option>10%</option>
	                                            <option>15%</option>
	                                            <option>20%</option>
	                                        </select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>배송비</td>
	                                    <td>
	                                        <label><input type="radio" name="fee" value="2000" checked> 2,000원</label>&nbsp;
	                                        <label><input type="radio" name="fee" value="3000"> 3,000원</label>&nbsp;
	                                        <label><input type="radio" name="fee" value="5000"> 5,000원</label>&nbsp;
	                                        <label><input type="radio" name="fee" value="0"> 무료</label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>재고</td>
	                                    <td><input type="number" name="stock"></td>
	                                </tr>
	                                <tr>
	                                    <td>상품이미지</td>
	                                    <td>
	                                        <p>상품목록 이미지(약 120 x 120)</p>
	                                        <input type="file" name="listImg">
	                                        <p>기본정보 이미지(약 240 x 240)</p>
	                                        <input type="file" name="infoImg">
	                                        <p>상품설명 이미지(약 750 x auto)</p>
	                                        <input type="file" name="detailImg">
	                                    
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>기타</td>
	                                    <td><textarea name="etc"></textarea></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                        <h3>
	                            <a href="./list.html">취소</a> &nbsp;
	                            <input type="submit" value="상품등록"></input>
	                        </h3>
	                    </form>
	                </article>
	            </section>
        	</section>
        </main>
    </div>
        <%@ include file="../_footer.jsp"%>
</body>
<script>
        const now = document.querySelector('a#prodreg[href]');
        if (now) {
            now.classList.add("now");
        }
</script>
</html>