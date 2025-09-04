<%--
  ~    eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) 2017  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~            Further, all user interfaces, including but not limited to citizen facing interfaces,
  ~            Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
  ~            derived works should carry eGovernments Foundation logo on the top right corner.
  ~
  ~            For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
  ~            For any further queries on attribution, including queries on brand guidelines,
  ~            please contact contact@egovernments.org
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  ~
  --%>

<%@ include file="/includes/taglibs.jsp"%>
<%@ page language="java"%>

<html>

<title>Bank to Bank Transfer</title>
<style>
body {
	font-family: Arial, sans-serif;
	font-size: 14px;
}

.top-line {
	text-align: center;
	margin-bottom: 6px;
}

.voucher-title {
	text-align: center;
	font-weight: 700;
	margin: 0 0 6px;
	font-size: 16px;
}

.meta-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 6px;
}

.meta-row span {
	white-space: nowrap;
}

table.voucher {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

table.voucher th {
	border: 1px solid #000;
	text-align: center;
	padding: 6px;
}

.num-row {
	text-align: center;
}

.detail-row {
	text-align: left;
}

table.voucher td {
	border: 1px solid #000;
	padding: 6px;
}

table.voucher th {
	background: #f2e1b2; /* light green like the image */
	font-weight: 700;
}

.num-row td {
	font-weight: 600;
}

.detail-row td {
	height: 130px;
} /* creates the large blank area */
.left-total {
	text-align: left;
	padding-left: 10px;
	font-weight: 700;
}

.table-contain {
	margin: 20px;
}

.note {
	font-size: 14px;
	margin-top: 5px;
}
</style>

<body>
	<span class="mandatory1">
		<div id="Errors">
			<s:actionerror />
			<s:fielderror />
		</div>
	</span>
	<div id="main">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary" data-collapsed="0">
					<div class="panel-heading" style="margin-bottom: 10px;">
						<div class="panel-title text-center">
							<span style="color: white; font-size: 21px">Contra Voucher</span>
						</div>
					</div>
					<span style="color: green; font-size: 16px"><s:actionmessage /></span>
					<!--  Journal Voucher Start   -->
					<div class="table-contain">
						<div class="top-line">${city} Name of the Municipality</div>
						<div class="voucher-title">Contra Voucher</div>

						<div class="meta-row">
							<span>Date: ${date}</span> <span>Contra Voucher Number :
								${vouchernumber} </span>
						</div>

						<!-- Single bordered table for header, body, total, and sign/date rows -->
						<table class="voucher">

							<!-- Header -->
							<thead>
								<tr>
									<th>Code of Account</th>
									<th>Account Description</th>
									<th>Debit Amount (₹)</th>
									<th>Credit Amount (₹)</th>
								</tr>
								<!-- numbers 1–4 row -->
								<tr class="num-row">
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
								</tr>
							</thead>

							<tbody>
								<!-- Large blank entry area (single tall row like the image) -->
								<c:set var="totalDebit" value="0" />
								<c:set var="totalCredit" value="0" />
								<c:forEach var="ledger"
									items="${glcode}">
									<tr>
										<td>${ledger.glcode}</td>
										<td>${ledger.description}</td>
										<td>${ledger.debitAmount}</td>
										<td>${ledger.creditAmount}</td>
									</tr>
									 <!-- Add running totals -->
								    <c:set var="totalDebit" value="${totalDebit + ledger.debitAmount}" />
								    <c:set var="totalCredit" value="${totalCredit + ledger.creditAmount}" />
								</c:forEach>
								<!-- Total row -->
								<tr>
									<td colspan="2" style="font-weight:bold;text-align:center;">Total</td>
									
									<td><b>${totalDebit}</b></td>
    								<td><b>${totalCredit}</b></td>
								</tr>

								<!-- Signatures row -->
								<tr>
									<td>Prepared By</td>
									<td>Verified By</td>
									<td>Approved By</td>
									<td>Posted By</td>
								</tr>
								<tr>
									<td>Date</td>
									<td>Date</td>
									<td>Date</td>
									<td>Date</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  Contra Voucher ending   -->
				
				</div>
				<div class="text-center">
					<input type="button" name="button2" id="button2" value="Close"
						class="btn btn-default"
						onclick="window.parent.postMessage('close','*');window.close();">
				</div>
			</div>
		</div>
	</div>



</body>
</html>