<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.ParameterForm" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
ParameterForm form=(ParameterForm)request.getAttribute("parameterModifyif");
int cost=0;
int validity=0;
%>
<head>
<title>知识点系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">

哈夫曼编码、图的定义和遍历<br/><br/><br/>

一、哈夫曼编码<br/>
1、以前没有考虑各个元素的被查找概率，或者默认概率是相等的。<br/>

-》当时在树中查找的效率，与树的高度有关。<br/>

但，如果是已知被查找概率不同，那么查找效率还应当考虑元素的位置<br/>

-》同等高度，应尽量让高概率元素放在上面，使总的带权路径长度wsl最小。<br/>
<img src ="Images/pic1.jpg" /> </br>



WPL：带权路径长度<br/>

2、典型例子：不定长编码问题<br/>

1）不定长编码，比定长编码节约空间<br/>

2）但需要避免二义性，避免0和01这样的“前缀码”<br/>

3）“前缀码“必须避免，怎么避免？编码时简单借助二叉树这种数据结构，只要字符都在叶节点上就能保证不会有二义性。<br/>
<img src ="Images/pic2.jpg" /> </br>

4）但这样的二叉树很多，带权路径长度WSL有大有小，我们需要的是效率最高的一棵树——哈夫曼树——也就是其中WSL最小的。<br/>
<img src ="Images/pic3.jpg" /> </br>



3、哈夫曼树==最优二叉树<br/>

给定n个权值作为n个叶子结点，WSL最小的树。<br/>


4、给与权重不同的元素，如何去构造出哈夫曼树？<br/>

哈夫曼树就是权重小的放下面，所以从下往上构造<br/>

把每个元素看成1个现成的哈夫曼树，就有了n个树的集合；然后从中取出2个最小权重的树，合并成大树加入集合，然后再选2个最小权重的……不断的合并，合并，合并！<br/>
n个元素，合并进行n-1次。<br/>

时间复杂度：O（NlogN）<br/>
<img src ="Images/pic4.jpg" /> </br>


堆的插入删除都是logN，这正是堆删除的地方……<br/>



5、哈夫曼树的特点：<br/>

1）有左儿子就有右儿子，建树过程决定的。<br/>

2）n个叶子节点，就有n-1个度为2的节点，总结的就是2n-1.<br/>

3）不分左右，哈夫曼树左右子树交换仍然是哈夫曼树。<br/>

4）哈夫曼树不唯一，但WSL都是一样的。（不过一种特定的生产算法肯定是唯一的）<br/>

<img src ="Images/pic5.jpg" /> </br>
二、图的定义和基本术语<br/>
 图的定义<br/>

图（Graph）是一种网状数据结构，其形式化定义如下：<br/>

Graph=（V，R）<br/>
 V={x∣x∈DataObject} <br/>
R={VR} <br/>
VR={<x，y>∣P（x，y）∧（x，y∈V）}<br/>

其中：<br/>

DataObject：具有相同特性的元素的集合<br/>

V：顶点（vertex）集合<br/>

VR：顶点间关系的集合<br/>

P(x,y)：表示x和y之间有特定的关联属性P<br/>

有向图：图中边有方向。若 ￼ ，则<x,y>表示顶点x到y的弧。<br/>

无向图：图中边无方向。若 ￼ ，则必有 ￼ ，以无序对(x,y)来代替两个有序对。<br/>

顶点在图中的位置：人为排列中的位置序号可将任一顶点看作图的第一个顶点，对任一顶点其邻接点间不存在顺序关系。<br/>

基本术语<br/>

1. 图：<br/>

有向完全图：有n(n-1)条边（图中每个顶点和其余n-1个顶点都有弧相连）。<br/>
<img src ="Images/pic6.jpg" /> </br>


无向完全图：有n(n-1)/2条边（图中每个顶点和其余n-1个顶点都有边相连）。<br/>
<img src ="Images/pic7.jpg" /> </br>


子图：设有两个图G=(V,{E})和图G'=(V',{E'}),若 ￼ 且 ￼ ，则称图G'为G的子图。<br/>
<img src ="Images/pic8.jpg" /> </br>


连通图：如果对于图中的任意两个顶点 ￼ ， ￼ ， ￼ 都是连通的，则称该无向图G为连通图。<br/>

<img src ="Images/pic9.jpg" /> </br>

连通分量：无向图中的极大连通子图。<br/>
<img src ="Images/pic10.jpg" /> </br>


强连通图：在有向图G=(V,{A})中，若对于每对顶点 ￼ 且 ￼ ，从 ￼ 到 ￼ 和 ￼ 到 ￼ 都有路径，则称该有向图为强连通图。<br/>
<img src ="Images/pic11.jpg" /> </br>


强连通分量：有向图的极大强连通子图。<br/>

<img src ="Images/pic12.jpg" /> </br>

2. 邻接点：<br/>

对于无向图 G=(V,{E})，如果边(v,v')∈E，则称顶点v，v'互为邻接点，即v，v' 相邻接。<br/>

边(v,v')依附于顶点v和v'，或者说边(v,v')与顶点v和v' 相关联。<br/>

对于有向图G=(V,{A})而言，若弧<v,v'>∈A，则称顶点v邻接到顶点v'，顶点v' 邻接自顶点v，或者说弧<v,v'>与顶点v，v'相关联。<br/>

3. 路径和回路：<br/>

路径长度：顶点序列上经过的边的个数。<br/>

回路和环：起点和终点相同。<br/>

简单路径：若表示路径的顶点序列中的顶点各不相同，则称这样的路径为简单路径。<br/>

简单回路：除了第一个和最后一个顶点外，其余各顶点均不重复出现的回路为简单回路。<br/>

4. 度：<br/>

对于无向图来讲，顶点V的度TD(V)：和V相连的边的个数。<br/>

对于有向图来讲，顶点V的度有出度和入度两部分：以顶点V为弧头的弧的数目称为该顶点的入度，记作ID(V)；以顶点V为弧尾的弧的数目称为该顶点的出度，<br/>
记作OD(V)。则顶点V的度为：TD(V)=ID(V)+OD(V)<br/>

度的计算公式：若图G中有n个顶点，e条边或弧，则图中顶点的度与边的关系如下： ￼<br/>

5. 权与网：<br/>

赋权图（网）：带权的图。<br/>

图的边或弧上于它相关的数称为权。<br/>

权可以表示从一个顶点到另一个顶点的距离或耗费等信息。<br/>
<img src ="Images/pic13.jpg" /> </br>

6. 生成树：<br/>

生成树：极小连通子图含有连通图全部顶点n并有n-1条边。<br/>
<img src ="Images/pic14.jpg" /> </br>
三、图的遍历<br/>
（1）深度优先遍历（deep first traverse）<br/>

定义：假设给定图G的初态是所有顶点均未曾访问过，在G中任选一顶点v为初始出发点(源点)，则深度优先遍历可定义如下：首先访问出发点v，并将其标记为已访问过；<br/>
然后依次从v出发搜索v的每个邻接点w。若w未曾访问过，则以w为新的出发点继续进行深度优先遍历，直至图中所有和源点v有路径相通的顶点(亦称为从源点可达的顶点)均已<br/>
被访问为止。若此时图中仍有未访问的顶点，则另选一个尚未访问的顶点作为新的源点重复上述过程，直至图中所有顶点均已被访问为止，这里定义使用的就是递归定义。<br/>
图的深度优先遍历类似于树的前序遍历，采用的搜索方法的特点是尽可能先对纵深方向进行搜索。这种搜索方法称为深度优先搜索(Depth-First Search)。相应地，用此方法遍历<br/>
图就很自然地称之为图的深度优先遍历<br/>
递归方式实现深度遍历的编码思想：所谓深度优先就是以纵向优先的方式遍历节点。我们从当前节点curr出发，如果当前节点被访问过，就返回，否则将该节点标记为访问过的节点，<br/>
然后在递归访问当前节点的所有邻接节点。<br/>
栈和回溯方式实现深度遍历的编码思想：首先我们需要一个栈结构来存放需要被访问的节点，当然栈的第一个元素是我们传入的node节点，如果这个栈里面还有节点的话，拿出栈顶节点，访问该节点，<br/>
然后将这个节点的所有未被访问的邻接节点压入栈中，具体过程请看下图：<br/>

首先1入栈，1出栈，1被标记为被访问，1的邻接节点2,7,8入栈，8出栈，8被标记为被访问，8的邻接节点9,12入栈，现在栈中的节点为2，7，9，12，然后12出栈，12被访问，由于12没有邻接节点，所以没有节点被加入，<br/>
9出栈，9被访问，10,11入栈，现在栈中的节点是2,7,10,11，接下来11出栈，11被访问，由于11没有邻接节点，所以没有节点被加入，10出栈，10被访问，现在栈中的节点为2,7,接下来的依次类推即可，下面的代码就<br/>
描述了这个过程。<br/>

（2）广度有限遍历（broad first traverse）<br/>

定义：广度优先遍历是连通图的一种遍历策略，它的思想是从一个顶点V0开始，辐射状地优先遍历其周围较广的区域。也就是从V0出发，访问V0的各个未曾访问的邻接点<br/>
W1，W2，…,Wk;然后,依次从W1,W2,…,Wk出发访问各自未被访问的邻接点；<br/>

队列实现广度优先遍历思想：所谓的广度优先指的是从当前节点curr出发，将该节点标记为已经访问过的节点，然后在依次访问curr的没有被访问的邻接节点，然后在依次<br/>
访问邻接节点的邻接节点，直到所有的节点被访问。具体过程请看下图：<br/>

首先，1入队，1出队，1被访问，2,7,8入队，2出队，2被访问，3,6入队，现在队列为7,8,3,6，然后7出队，由于没有和7邻接的节点，依次没有节点入队，8出队，8被访问，9,12入队，<br/>
现在队列为3,6,9,12，接下来3出队，3被访问，4,5入队，依次类推，下面的代码就描述了这个过程。<br/>

（3）总结<br/>

使用递归和不使用递归的区别，假设到达目标需要begin->step1->step2->step3->....->stepN->target,其中stepN表示解决方案N，然后递归的方法是先拿到解决N，然后在退一步，<br/>
拿到解决方案stepN-1,依次类推，直到最终拿到step1解决方案，而非递归方法是先拿到step1，然后在拿step2，最终拿到stepN。如果可以理解总结这段话，说明你对递归有非常好的理解了，对于图的遍历更不是问题。<br/>



 <table>
</table><%@ include file="copyright.jsp"%>
</td>
  </tr>
</table>
</body>
</html>
