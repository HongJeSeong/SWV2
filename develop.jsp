<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .table-head{
    border-top: 1px solid #000000;
    border-bottom: 1px solid #000000;
    border-left: 1px solid #ededed;
    border-right: 1px solid #ededed;
    align:center;
    width:100%;
    height:100%;
  }
  .table-row{
    text-align:center;
  }
  .color-back{
    background:#ededed;
  }
  .content td{
    border-bottom: 1px solid #ededed;
  }
  /* char bar */
  .graph {
      position: relative; /* IE is dumb */
      width: 100%;
      border: 1px solid #ffd01f;
      padding: 0.5px;
  font-size:11px;
  font-family:tahoma;
  margin-bottom:2px;
  }
  .graph .bar {
      display: block;
      position: relative;
      background: #ffd01f;
      text-align: center;
      color: #333;
      height: 2em;
      line-height: 2em;
  }
  .graph .bar span { position: absolute; left: 1em; }
</style>
</head>
<body>
  <h1 align="center">개발 진행현황</h1>
  <div>
  <div align="left">
 <form>
    건수:0건&nbsp;■사업 연도:

<select name="">
    <option value="all"  selected="selected">전체보기</option>
    <option value="">??</option>
    <option value="">??</option>
    <option value=""></option>
</select>
    ■사업 구분:
    <select name="">
        <option value="all"  selected="selected">전체보기</option>
        <option value="">??</option>
        <option value="">??</option>
        <option value=""></option>
    </select>
  ■사업 명:
<input type="text"/>
<button>검색</button>
</form>
  </div>
  </div>
<table class="table-head" >
    <tr class="table-row color-back">
      <td rowspan="3">상태</td>
      <td rowspan="3">프로젝트명</td>
      <td rowspan="3">사업구분</td>
      <td colspan="3">사업기간</td>
      <td rowspan="3">간트<br>차트</td>
      <td colspan="10">추진현황</td>
      <td rowspan="3">투입인원</td>
    </tr>
    <tr class="table-row color-back">
     <td rowspan="2">시작</td>
     <td rowspan="2">종료</td>
     <td rowspan="2">기간<br>(월)</td>
     <td rowspan="2">최종 빌드일</td>
     <td rowspan="2">사업기간 결과<br>사업추진 현황</td>
     <td rowspan="2">요구사항(완료/총)</td>
     <td rowspan="2">지연</td>
     <td rowspan="2">코딩<br>준수상태</td>
     <td rowspan="2">가시화</td>
     <td colspan="4">테스트</td>
    </tr>
    <tr class="table-row color-back">
      <td>총계</td>
      <td>수행</td>
      <td>성공</td>
      <td>결함</td>
    </tr>
    <tr class="table-row content">
      <td>test</td>
      <td>test</td>
      <td>test</td>
      <td>test</td>
      <td>test</td>
      <td>test</td>
      <td>
        <button>chart</button>
      </td>
      <td>test</td>
      <td>막대그래프</td>
      <td>
        <div class="graph">
            <strong class="bar" style="width: 68%;">68%</strong>
        </div>
        </td>
      <td>test </td>
      <td>
        <button>준수</button>
      </td>
      <td>
        <button>준수</button>
      </td>
      <td>test</td>
      <td>test</td>
      <td>test</td>
      <td>test</td>
      <td>test</td>
    </tr>
</table>
</body>
</html>
