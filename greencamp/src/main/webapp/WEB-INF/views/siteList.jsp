<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="siteList" items="${siteList }">
	<form action="orderCamp.pi" name="moveOrderCamp" method="get">
		<table id="resveCampTable">
			<tbody>
				<tr class="list0 col1 ht center" id="resveCampListTR">
					<td width="200px" class="ln_r ln_l ln_t ln_b"><input
						type="submit" id="resveSubmit" value=""
						style="background-image: url('${siteList.siteimg }');"></td>
					<td id="resveCampList" class="ln_t ln_b" align="left"><span
						id="resveCampSpan"> ${siteList.sitenm } </span> <img
						src="./img/n_manual_btn6.png" align="absmiddle" alt=""> <br>
						<br> <span style="font-size: 12px; color: #AFAFAF;">
							기준인원: ${siteList.crtr_nope }명 </span> <br> <span
						style="font-size: 12px; color: #AFAFAF;"> 최대인원:
							${siteList.max_nope }명 </span></td>
					<td class="ln_t ln_b" width="30%" align="center"><span
						style="font-size: 16px; color: #330000; font-weight: bold;">
							${siteList.pc }원 </span></td>
					<td><input type="hidden" name="sitenm"
						value="${siteList.sitenm }"> <input type="hidden"
						name="crtr_nope" value="${siteList.crtr_nope }"> <input
						type="hidden" name="max_nope" value="${siteList.max_nope }">
						<input type="hidden" name="siteimg" value="${siteList.siteimg }">
						<input type="hidden" id="pc" name="pc" value="${siteList.pc }">
						<input type="hidden" name="camp_dc" value="${camp_dc }"> <input
						type="hidden" name="camp_no" value="${camp_no }"> <input
						type="hidden" name="camp_name" value="${camp_name }"> <input
						type="hidden" name="startDe" id="startDe${siteList.site_no }" value=""> <input
						type="hidden" name="endDe" id="endDe${siteList.site_no }" value=""> <input
						type="hidden" name="sukbakDe" id="sukbakDe${siteList.site_no }" value="">
						</td>
				</tr>
			</tbody>
		</table>

	</form>
</c:forEach>