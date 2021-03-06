<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**  
   * @Class Name : specRegist.jsp
   * @Description : 폐기물 및 규격 관리 등록 화면
   * @Modification Information  
   * @
   * @  수정일      수정자              수정내용
   * @ ---------   ---------   -------------------------------
   * @ 2017.05.22   미키    최초생성
   * 
   * @author 미키
   * @since 2017.05.22
   * @version 1.0
   * @see
   * 
   *  Copyright (C) by 미키 All right reserved.
   */
%>
<link rel="stylesheet" href="/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" href="/assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="/assets/css/bootstrap.css">
<link rel="stylesheet" href="/assets/css/neon-core.css">
<link rel="stylesheet" href="/assets/css/neon-theme.css">
<link rel="stylesheet" href="/assets/css/neon-forms.css">
<link rel="stylesheet" href="/assets/css/custom.css">

<style>
	.short {
	width:150px;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	/* border:1px solid red; */
	}
</style>
<script type="text/javaScript" language="javascript" defer="defer">
	function validateSpecRegist(event) {
		if( !$("#sortCd").val() ) {
			alert("종류를 선택해 주세요.");
			$("#sortCd").focus();
			return false;
		}		
		if( !$("#item").val() ) {
			alert("품목을 입력해 주세요.");
			$("#item").focus();
			return false;
		}
		if( !$("#price").val() ) {
			alert("부과금액을 입력해 주세요.");
			$("#price").focus();
			return false;
		}	
		$('#registBtn').attr('disabled', true);
		return true;
	}
	function listBtn() {
		document.specRegistForm.action = "<c:url value='/spc/selectSpecList.do'/>";
	   	document.specRegistForm.submit();	
	}
</script>
			
<ol class="breadcrumb bc-3" >
	<li><i class="entypo-folder"></i> 대형폐기물 처리</li>
	<li>폐기물 및 규격 관리</li>
	<li class="active"><a href="/spc/selectSpecList.do"><strong>폐기물 및 규격 관리</strong></a></li>
</ol>
<h2><strong>폐기물 및 규격 관리</strong></h2>
<br />
<form name="specRegistForm" id="specRegistForm" method="post" action="/spc/addSpecApply.do" onsubmit="return validateSpecRegist(this)">

<div class="panel panel-info" data-collapsed="0">
	<div class="panel-heading">
		<div class="panel-title">
			<i class="entypo-newspaper"></i> <strong>폐기물 규격 등록</strong>
		</div>
		<div class="panel-options">
			<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="form-horizontal form-groups-bordered">
			<div class="form-group">
				<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 종류</label>
				<div class="col-sm-5" style="width:200px; padding-right: 0px">
					<select class="form-control" id="sortCd" name="sortCd">
						<option value="">종류선택</option>
						<option value="1">가전제품</option>
						<!-- <option value="2">냉난방기</option>
						<option value="3">주방용품</option> -->
						<option value="4">가구류</option>
						<!-- <option value="5">학습사무기기</option> -->
						<option value="6">생활용품</option>
						<option value="7">기타</option>
						<option value="8">면제품목</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 품목</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" data-mask="" placeholder="" id="item" name="item" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="text-align:left">규격</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" data-mask="" placeholder="" id="spec" name="spec" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 부과금액</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" placeholder="원" id="price" name="price" style="text-align:right"/>
				</div>
				<!-- <label class="col-sm-3 control-label" style="text-align:left; font-weight:normal; padding-left:0px">원</label> -->
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="text-align:left">사용여부</label>
				<div class="col-sm-5">
					<div class="radio radio-replace" >
						<input type="radio" id="rd-1" name="useYn" value="1" checked>
						<label>사용</label>
					</div>
					<div class="radio radio-replace">
						<input type="radio" id="rd-2" name="useYn" value="2">
						<label>미사용</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="padding-top:10px; padding-bottom:10px; text-align:center">
	<button type="submit" id="registBtn" name="registBtn" class="btn btn-blue" style="width:80px">등록</button>
	<a href="#n" onclick="listBtn(); return false;"><button type="submit" class="btn btn-default" style="width:80px">취소</button></a>
</div>

</form>
	
<!-- Imported styles on this page -->
<link rel="stylesheet" href="/assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="/assets/js/select2/select2.css">
<link rel="stylesheet" href="/assets/js/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="/assets/js/icheck/skins/minimal/_all.css">
<link rel="stylesheet" href="/assets/js/icheck/skins/square/_all.css">
<link rel="stylesheet" href="/assets/js/icheck/skins/flat/_all.css">
<link rel="stylesheet" href="/assets/js/icheck/skins/futurico/futurico.css">
<link rel="stylesheet" href="/assets/js/icheck/skins/polaris/polaris.css">

<script src="/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>

<!-- Imported scripts on this page -->
<script src="/assets/js/select2/select2.min.js"></script>
<script src="/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="/assets/js/typeahead.min.js"></script>
<script src="/assets/js/bootstrap-datepicker.js"></script>
<script src="/assets/js/bootstrap-timepicker.min.js"></script>
<script src="/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="/assets/js/moment.min.js"></script>
<script src="/assets/js/daterangepicker/daterangepicker.js"></script>
<script src="/assets/js/jquery.multi-select.js"></script>
<script src="/assets/js/icheck/icheck.min.js"></script>

