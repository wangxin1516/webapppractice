<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BorrowDAO" %>
<%@ page import="com.actionForm.BorrowForm" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.*"%>
<html>
<%
ReaderForm readerForm=(ReaderForm)request.getAttribute("readerinfo");
Collection coll=(Collection)request.getAttribute("borrowinfo");
int borrowNumber=0;
%>
<head>
<title>知识点系统</title>
<link href="CSS/style.css" rel="stylesheet">
		<script language="javascript">
		function checkreader(form){
			if(form.barcode.value==""){
				alert("请输入读者条形码!");form.barcode.focus();return;
			}
			form.submit();
		}
		function checkbook(form){
			if(form.barcode.value==""){
				alert("请输入读者条形码!");form.barcode.focus();return;
			}		
			if(form.inputkey.value==""){
				alert("请输入查询关键字!");form.inputkey.focus();return;
			}

			if(form.number.value-form.borrowNumber.value<=0){
				alert("您不能再借阅其他图书了!");return;
			}
			form.submit();
		}
		</script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
	<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">

 排序的基本概念和法</br></br>
 排序的基本概念</br>
设有{R1,R2,…,Rn}是由n个记录组成的文件，{k1，k2,…,kn}是相应的排序码的集合。</br>
排序——将记录排列序码不增（或不减）的次序排列起来的运算。</br>
排序：计算机内经常进行的一种操作，其目的是将一组“无序”的记录序列调整为“有序”的记录序列。</br>
排序算法的稳定性：键值相等的记录排序后保持原来的顺序，则稳定。否则不稳定。</br>
排序的分类</br>
<img src ="Images/sort1.jpg" /> </br>
按待排序文件规模的大小分类：内部排序（在内部进行的排序）;外部排序（在外存设备上进行的排序）</br>
 排序方法的分类</br>
待排序记录的存储方式</br>
<img src ="Images/sort2.jpg" /> </br>
序算法效率的指标</br>
评价排序算法好坏的标准</br>
·算法执行时所需要的时间（最重要的标准）</br>
·执行算法所需要的附加空间</br>
 直接插入排序</br>
基本思想</br>
依次从待排序序列中取出一个元素，插入到有序序列的适当位置上。</br>
完整算法</br>
<img src ="Images/sort3.jpg" /> </br>
冒泡排序</br>
一种简单的交换排序方法。</br>
 基本思想</br>
每次都是相邻的两个数进行比较，将较大者交换到最后一个位置。对n个数的序列进行n-1次比较后最大者被交换到了最后一个位置，这样就完成了一趟冒泡排序。</br>
冒泡排序算法的具体实现</br>
<img src ="Images/sort4.jpg" /> </br>
快速排序</br>
快速排序思想</br>
<img src ="Images/sort5.jpg" /> </br>
 快速排序算法实现</br>
<img src ="Images/sort6.jpg" /> </br>
快速排序算法分析</br>
（1）时间复杂度</br>
·最好：划分后，左侧右侧子序列的长度相同，时间复杂度为O（n）</br>
·最坏：就是待排序序列已经安排好的情况下，每次取界点都是第一个元素，这种情况下，每次划分只能得到一个比上一次少一个记录的子序列，时间复杂度为O（）</br>
·平均情况下，时间复杂度为O（n）</br>
（2）空间复杂度</br>
由于排序是递归的，执行时需要栈存放每层递归调用时参数，最好情况下空间复杂度为O（n），最坏情况下为O（n）</br>
（3）特点</br>
·由于中心点可任选一元素，算法不稳定</br>
·适合初始记录无序，n较大的情况</br>
 简单选择排序</br>
 基本思想</br>
首先，从待排序序列中选出最小者并交换到第一个位置（第一次选择最小者）；接下来，从剩下的未排序序列中选出最小者并交换到第二个位置（第二次选择第二小）；</br>
以此类推，对于含n个元素的序列进行n-1次选择之后就排好序了。</br>
 算法实现</br>
<img src ="Images/sort7.jpg" /> </br>
<img src ="Images/sort8.jpg" /> </br>
<img src ="Images/sort9.jpg" /> </br>
改进算法</br>
<img src ="Images/sort10.jpg" /> </br>


堆排序算法</br>
堆的定义</br>
每个节点都不大于或者都小于它的子节点的完全二叉树。</br>
<img src ="Images/sort11.jpg" /> </br>
 堆排序的基本思想</br>
·将无序序列建成一个堆</br>
·输出堆顶元素</br>
·以最后一个元素代替堆顶元素</br>
·将剩余的n-1个元素再调整成一个堆</br>
·重复执行，直到整个堆剩一个元素</br>
堆排序算法</br>
·堆排序算法（1）</br>
<img src ="Images/sort12.jpg" /> </br>
·堆排序算法（2）</br>
<img src ="Images/sort13.jpg" /> </br>
·堆排序算法（3）</br>
<img src ="Images/sort14.jpg" /> </br>
算法分析</br>
·时间效率：O（n）</br>
·空间效率：O（1）</br>
·稳定度：不稳定</br>
·适用于n较大的情况</br></br>
 归并排序算法</br></br>
归并：将两个或两个以上的排序表组合成一个新有序表。</br>
归并排序算法的基本思想。</br>
<img src ="Images/sort15.jpg" /> </br>

合并算法</br>
<img src ="Images/sort16.jpg" /> </br>
给定区间的归并算法</br>
<img src ="Images/sort17.jpg" /> </br>
归并排序算法实现</br>
void MergeSort(ElementType A[])</br>
{ //对顺序表A做归并排序</br>
Msort（A，C, 1</br>
A.length）;</br>
}</br>
 归并排序算法分析</br>
·时间效率：O（n）</br>
·空间效率：O（n）</br>
·稳定性：稳定</br>
基数排序</br>
 基数排序的定义</br>
 <img src ="Images/sort18.jpg" /> </br>
基数排序算法分析</br>
·时间效率：O（d（n+rd））</br>
·空间效率：O（n+rd）（实现时采用静态链表存储）</br>
·稳定性：稳定</br>

    <table>
    </table></td>
  </tr>
</table>
    <%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>