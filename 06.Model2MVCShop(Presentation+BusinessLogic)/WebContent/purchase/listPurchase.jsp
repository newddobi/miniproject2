<%@page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetPurchaseList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	function fncDeletePurchase(tranNo){
		if(confirm("���� ����Ͻðڽ��ϱ�?") == true){
			document.detailForm.action='/deletePurchase.do';
			document.getElementById("tranNo").value = tranNo;
			document.detailForm.submit();
		}else{
			return;
		}
	}
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">
<input type="hidden" id="tranNo" name="tranNo" value="">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td>
			<select name="pageCondition" class="ct_input_g" style="width:80px">
				<option value="" ${ ! empty search.pageSize && search.pageSize.equals("") ? "selected" : "" }>�Խù�����</option>
				<option value="4" ${ ! empty search.pageSize && search.pageSize==4 ? "selected" : "" }>4</option>
				<option value="5" ${ ! empty search.pageSize && search.pageSize==5 ? "selected" : "" }>5</option>
				<option value="6" ${ ! empty search.pageSize && search.pageSize==6 ? "selected" : "" }>6</option>
				<option value="7" ${ ! empty search.pageSize && search.pageSize==7 ? "selected" : "" }>7</option>
				<option value="8" ${ ! empty search.pageSize && search.pageSize==8 ? "selected" : "" }>8</option>
				<option value="9" ${ ! empty search.pageSize && search.pageSize==9 ? "selected" : "" }>9</option>
				<option value="10" ${ ! empty search.pageSize && search.pageSize==10 ? "selected" : "" }>10</option>
			</select>
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetPurchaseList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0"/>
		<c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${i+1}" />
			<tr class="ct_list_pop">
				<td align="center">
					<a href="/getPurchase.do?tranNo=${purchase.tranNo}">${ i }</a>
				</td>
				<td></td>			
				<td align="left">
					<a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
				</td>
				<td></td>
				<td align="left">${purchase.receiverName}</td>
				<td></td>
				<td align="left">${purchase.purchaseProd.prodName}</td>
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test="${purchase.tranCode eq '3' }">
							���� ���ſϷ� �����Դϴ�.
						</c:when>
						<c:when test="${purchase.tranCode eq '2' }">
							���� ����� �Դϴ�.
						</c:when>
						<c:when test="${purchase.tranCode eq '1' }">
							���� ��ۿϷ� �����Դϴ�.
						</c:when>
					</c:choose>
				</td>
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test="${purchase.tranCode eq '3' }">
							<a href="javascript:fncDeletePurchase(${purchase.tranNo});">�������</a>							
						</c:when>
						<c:when test="${purchase.tranCode eq '2'}">
							<a href="/updateTranCode.do?prodNo=${purchase.purchaseProd.prodNo}&tranCode=${purchase.tranCode}">���ǵ���</a>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>	
		</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>

			<jsp:include page="../common/pageNavigator.jsp">
				<jsp:param name="what" value="Purchase"/>
			</jsp:include>	
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>