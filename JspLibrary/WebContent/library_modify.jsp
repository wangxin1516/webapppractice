<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.LibraryForm" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
LibraryForm libraryForm=(LibraryForm)request.getAttribute("libraryModifyif");
String libraryname="";
String curator="";
String tel="";
String address="";
String email="";
String url="";
String createTime="";
String introduce="";
%>
<head>
<title>知识点系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function checkForm(form){
	for(i=0;i<form.length;i++){
		if(form.elements[i].value==""){
			alert("请将信息添写完整!");
			form.elements[i].focus();
			return false;
		}
	}
}
</script>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">



java里的数据结构<br/>


什么是数据结构：<br/>

栈是一种数据结构。我这里不给出严格的定义，因为对于完全没有基础的新人而言，严格的定义说了等于没说。我只从一个简单的角度举例说明一下。在初学阶段，<br/>
你可以认为数据结构就是关于数据在计算机中如何组织的一门课程。<br/>

比如，我要往一个数组中，存1，3，2这三个整数，那么，我实际存的时候，是按照从小到大排着存呢，还是从大到小存，还是没有顺序随便存，这要根据实际的需求来决<br/>
定。根据需求决定数据存储的方式。这就是数据结构要研究的内容。<br/>

栈：<br/>

以前打了粮食，会放到一个筒形的容器里，这个筒形的容器，大家叫它栈。它的特点是先放进去的粮食要最后才能取出来，后放进去的粮食是最先被取出来。所以中文就用<br/>
栈这个词翻译英文的stack了。<br/>
想一想，生活中，还有很多栈的例子。比如叠在一起的碗盘，叠的时候我们是从底往高处叠，但是取的时候，我们是从最上面的一个依次向下取。这也是一个典型的栈：<br/>
后进先出，先进后出。<br/>
那么Java语言中如何模拟这一个过程呢？首先，我们定义一个名叫Stack的类：<br/>
public class Stack { private int[] data; <br/>
private int size; <br/>
private int top = 0; // 指向栈的顶部 <br/>
public Stack(int size) { this.size = size;<br/>
 this.data = new int[size];<br/>
 } } <br/>

OK，接下来，就是要往类里添加相关的操作了。先定义一个可以往栈里写数据的函数，叫做push：<br/>
public void push(int num) <br/>
{ data[top++] = num; } <br/>
这个函数的意义就是，把数据num存到数组里，并且把游标向后指一位。逻辑比较简单。<br/>
相对应的，我们还可以继续定义以下三个方法，分别是取栈顶元素(getTop)，出栈(pop)，判断栈是否为空(isEmpty)。<br/>

public int pop(int num)<br/>
 { return data[--top]; <br/>
} <br/>
public int getTop(int num) <br/>
{ return data[top-1]; <br/>
}<br/>
 public boolean isEmpty() <br/>
{ return top == 0; } <br/>

好了，一个栈就定义完了（当然，这里是有问题的，因为我们在push里，没有检查top是否越过了size规定的数组，出栈的时候，也没有判断top是否等于0。<br/>
这个做为今天的第一个作业，请读者自行添加。）<br/>
数组<br/>

我们从数组开始讲起，创建一个数组，在第 n 位存数据，取数据，这些基本的操作我就不再赘述了。这些都是比较简单的操作。我们再想一种情况，假如，<br/>
我要在第3个位置上插入一个数据，例如，现在的数组是这样定义的：<br/>

int[] array = new int[10]; <br/>
for (int i = 0;<br/>
 i < array.length - 1;<br/>
 i++) array[i] = i + 1;<br/>

然后我希望在第3位插入10，这样遍历这个数组的时候，得到的是1, 2, 3, 10, 4, 5, 6, 7, 8。那么我就得这么做：<br/>
for (int i = array.length - 1; <br/>
i >= 3; i--)<br/>
 { array[i] = array[i - 1]; <br/>
} <br/>
array[3] = 10;<br/>
 for (int i : array)<br/>
 { System.out.println(i); } <br/>

通过这个例子，我们看到了数组的特点：随机存取都很快，但顺序存储会比较慢。<br/>

大O记号<br/>

上一节，我用快慢来描述存取算法，这种感性的描述是不好的。我们希望有一种方法可以量化一种操作的耗时情况。注意到，解决问题的时间往往和问题的规<br/>
模有关系，我们借用了数学分析中的大O记号来描述这种关系。<br/>
解决一个规模为 n 的问题所花费的步骤如果是 n 的常数倍，我们就记这个方法的复杂度为O(n)。例如，给一个数组，求这个数组中的最大值，需要遍历这个数组，<br/>
如果数组长度为n，那么遍历数组的步骤就是 n。所以，这是一种O(n)的操作。<br/>
同样，解决一个规模为 n 的问题所花费的步骤如果是 n^2 的常数倍，我们就记这个方法的复杂度为O(n^2)。比如冒泡排序。<br/>
而解决问题的步骤如果与问题规模无关，这个时间复杂度就是O(1)的。比如，数组的随机存取。<br/>
上一节里说讲的数组的顺序存储就是O(n)的。<br/>

链表<br/>

我们接下来看链表，先看一个类的定义：<br/>

class LinkNode { public int data;<br/>
public LinkNode next;<br/>
 public LinkNode(int data) <br/>
{ this.data = data; <br/>
this.next = null; } } <br/>

我们定义了一个LinkNode类，这个类里有两个成员变量，一个是整型data，还有一个是指向LinkNode 类型的引用。<br/>
通过这个引用，我就可以把多个LinkNode串起来，比如，这样的代码：<br/>
LinkNode head = new LinkNode(1); head.next = new LinkNode(2); 我就在内存里创建了两个LinkNode对象，它们之间的关系就像这样：<br/>
head所引用的那个LinkNode，其data为1，其next指向下一个LinkNode，其 data为2，next域为空。<br/>

链表增加一项<br/>

如果我想在head之后，增加一个链表项，让这个链表变成下图中的样子，该怎么做呢？<br/>



大家可以先想一下，看看能不能写出来。<br/>

LinkNode newNode = new LinkNode(3);<br/>
 newNode.next = head.next;<br/>
 head.next = newNode; <br/>

思路就是先把新的结点的next设为head的next，然后再使得head.next指向新的结点即可。<br/>
反过来，想要把head后面的那个结点删掉，也很简单，只需要让head的next再往后指一项，把原来head后面的那一项跳过去就可以了：<br/>
head.next = head.next.next; <br/>
可以看到，在链表中，指定的结点后面添加一个项是常数时间的，也就是O(1)，删除一个项也是一样的。但与数组不同的，如果我要完成“查询链表中<br/>
的第n项是什么”这个操作，就会变成O(n)的，因为我们每次查找都必须从头开始，依次向后查找。<br/>
public static int queryData(LinkNode head, int index) <br/>
{ LinkNode cur = head;<br/>
 for (int i = 0; i < index; i++) { cur = cur.next; }<br/>
 return cur.data; } <br/>

再看一个问题，假如我知道了一个LinkNode，不妨记为temp, 位于一个链表中，如果想知道这个结点的上一个结点是什么，应该怎么办？对于我们前边定义的链<br/>
表结构，只能从头开始找，去判断是否有某个结点，它的 next 与 temp 相等。如果相等就说明，这个结点就是 temp 的前序结点。代码如下：<br/>

public static LinkNode findPrevious(LinkNode head, LinkNode temp) <br/>
{ LinkNode cur = head; while (cur != null)<br/>
 { if (cur.next == temp) return cur; cur = cur.next; <br/>
} <br/>
return null; } <br/>

双向链表<br/>

实际上，在工程实践中，使用链表的时候，经常会有“查询某个结点的前一结点”这样的需求，为了加速这一过程，我们其实可以修改一下LinkNode的定义，<br/>
结它加上一个指向前序结点的成员变量：<br/>

class DoubleLinkNode { public int data; <br/>
public LinkNode next;<br/>
 public LinkNode prev;<br/>
 public LinkNode(int data)<br/>
 { this.data = data; <br/>
this.next = null; <br/><br/>
this.prev = null; } } <br/>
<br/>
这样的话，链表就成了这个样子了：<br/>

这样一来，查找某个结点的上一个节点，只要返回它的prev就可以了。<br/>
队列与栈是相对的一种数据结构。栈的特点是后进先出，而队列的特点是先进先出先出，而队列的特点是先进先出。队列的用处很大，但大多都是在其他的数据结构中，<br/>
比如，树的按层遍历，图的广度优先搜索等都需要使用队列做为辅助数据结构。<br/>

单向队列<br/>

单向队列比较简单，只能向队尾添加元素，从队头删除元素。比如排队买票，新来的人只能在队列后面，排到最前边的人才可以买票，买完了以后，离开队伍。这个过程<br/>
就是一个典型的队列。<br/>

定义队列的接口：<br/>

public interface Queue { public boolean add(Object elem); // 将一个元素放到队尾，如果成功，返回true public Object remove(); // 将一个元素从队头<br/>
删除，如果成功，返回true }<br/>

一个队列只要能入队，和出队就可以了。这个队列的接口就定义好了，具体的实现有很多种办法，例如，我可以使用数组做存储，也可以使用链表做存储。这个问题，我们在<br/>
下一节课，具体分析ArrayList和LinkedList的时候再解释。<br/>
其实大家也可以看一下JDK的源代码。在java.util.Queue中，可以看到队列的定义。只是它是泛型的。基本上，Queue.java中定义的接口都是进队，出队。只是行为有所不同。<br/>
例如，remove如果失败，会抛出异常，而poll失败则返回null，但它俩其实都是从队头删除元素。<br/>

双向队列<br/>
如果一个队列的头和尾都支持元素入队，出队，那么这种队列就称为双向队列，英文是Deque。大家可以通过java.util.Deque来查看Deque的接口定义，这里节选一部分：<br/>
最重要的也就是这4个，一大段英文，啰里巴嗦的，无非就是说，addFirst是向队头添加元素，如果不满足条件就会抛异常，然后定义了各种情况下抛出的异常的类型。<br/>
只要记住队列是先进先出的数据结构就好了。我们以后会不断地提起这一点。比如消息队列，channel通信等等。今天不必把这些东西都掌握了，只需要记住队列是一种<br/>
先进先出的数据结构就可以了。<br/>
容器类
容器，顾名思义，就是盛东西的地方。我们的程序中经常要管理大量的对象，比如在学校的信息管理系统里，每一个学生的相关信息，都可以抽象成一个对象；再比如在<br/>
web server的场景下，一个客户端可以抽象成一个对象。这些情况下，都会产生很多同类型的对象，这时候，我们就会把同一个类型的对象放到同一个容器中进行集中管理。<br/>
容器中存放了我们随时可能需要使用到的对象，这就要求容器最起码要提供增删改等基本接口。其实，从某种意义上说，数组也是一种容器。但是数组太简陋了，在使用<br/>
之前必须指定长度，不能动态扩容，没有方便的增删改接口，没有迭代器。唯一的优点就是简单直接。<br/>
Java为了弥补数组的不足，提供了丰富的容器类。我们今天先看一下，本周所学习的几种数据结构，在Java中分别是怎么实现的。<br/>
Collection是序列容器的顶级接口，这个interface定义了序列容器必须实现的所有成员方法。我只列举了一部分，但这里面也包含了增，删，查看容器中元素个数，判断<br/>
是否为空，迭代器基本的操作了。<br/>
多说一下序列容器。序列容器是与关联容器相对的一个概念。在序列容器中，元素是以一个个独立的值而存在的。而关联容器则是以键值对的形式存在容器里的。如果还<br/>
不明白，就先跳过这个概念吧，以后我们讲到Map的时候，自然就会懂了。<br/>
另外，容器类大多是泛型的，这是为了让容器类适应各种类型的元素。了。<br/>
<br/>
列表类<br/><br/>

List 接口定义了列表类，List.java里有详细的注释，我把它翻译一点过来：<br/>

/** * An ordered collection (also known as a <i>sequence</i>). The user of this * interface has precise control over where in the list <br/>
each element is * inserted. The user can access elements by their integer index (position in * the list), and search for elements in the list.<br/>
<p> * * Unlike sets, lists typically allow duplicate elements. */<br/>

这一段说明了List这个接口的作用，是一个有序的容器，使用这个接口的人，可以精确地控制数据存放在列表的什么位置，用户还可以通过一个整型的索引去<br/>
检索容器里的某个元素，还有，List和Set最大的不同就是， List中允许元素是重复的。限于篇幅，我这里不再把所有的说明都列出来了。大家尽量多读一读这些注释。<br/>

就算不去源代码里读，也要读一下oracle的文档：List (Java Platform SE 8 )，最少也要读一下中文版的。<br/>
我们再来看一下列表类的继承关系，代码我就不列出来了，直接给类图吧。再提醒大家一下，源码面前无秘密，一定要多去翻翻JDK的源代码。ArrayList， LinkedList，<br/>
ArrayDeque<br/>
从上图中，我们可以看到，JDK提供了队列的接口：Queue，还有双端队列的接口：Deque，队列和栈的相关知识，我们在前边的课程里都介绍过了。<br/>
LinkedList 的内部实现是一个链表，链表的知识我们也已经介绍了。大家可能会奇怪，为什么ArrayList不能像LinkedList一样，直接实现Deque呢？还要费劲<br/>
搞一个ArrayDeque。这个问题，其实我们在链表那一节课也已经讲到了。这是因为ArrayList 从队列头上删除元素时，要把后面的元素向前拷贝。再看一下ArrayList<br/>
 的remove方法的实现：<br/>
public E remove(int index) { rangeCheck(index); <br/>
modCount++;<br/>
 E oldValue = elementData(index); <br/>
int numMoved = size - index - 1;<br/>
 if (numMoved > 0) System.arraycopy(elementData, index+1, elementData, index, numMoved); <br/>
elementData[--size] = null; // clear to let GC do its work return oldValue; }<br/>
这种实现，无疑是很低效的。与之相对的，我们可以看一下LinkedList的remove方法：<br/>
public E remove(int index) { checkElementIndex(index);<br/>
return unlink(node(index)); <br/>
} E unlink(Node<E> x) { // assert x != null; <br/>
final E element = x.item; <br/>
final Node<E> next = x.next; <br/>
final Node<E> prev = x.prev; <br/>
if (prev == null)<br/>
 { first = next; <br/>
} <br/>
else <br/>
{ prev.next = next; <br/>
x.prev = null; } <br/>
if (next == null)<br/>
 { last = prev; <br/>
}<br/>
 else { next.prev = prev; <br/>
x.next = null; } <br/>
x.item = null; <br/>
size--; modCount++;<br/>
 return element; }<br/>
<br/>
还记得咱们在链表那一节课的作业吗？瞧，JDK里其实已经有答案了。删除链表中的一个元素，只需要修改几处引用的值，这比拷贝一段内存要高效多了。<br/>
ArrayList 和 LinkedList 的基本原理，其实咱们已经讲过了，大家对照前边的课程再对照源代码自己学习一下吧。<br/>
今天，我重点介绍一下ArrayDeque。这是一个循环队列。它的实现比较高效，它的思路是这样：引入两个游标，head 和 tail，如果向队列里，插入一个元素，就把tail向后移动。如果从队列中删除一个元素，<br/>
就把head向后移动。我们看一下示意图：<br/>
如果向队列中插入 D，那么，队列就会变成这样：<br/>
如果此时，从队列的头部把A删除，那只需要移动head指针即可：<br/>
通过这种方式，就可以使元素出队，入队的速度加快了。那如果 tail 已经指向了数组的最后一位怎么办呢?很简单，只需要将 tail 重新指向数组的头就可以了。比如，tail 已经指向数组最后一位了，<br/>
再插入一个元素，就会变成这样：<br/><br/>



使用这种方式，就可以循环使用一个数组来实现队列了。这里有一个编程上的小技巧，那就是，实现的时候，数组的长度都是2的整数次幂，这样，我们就可以使用 (tail ++) & (length - 1) 来<br/>
计算tail的下一位。比如说，数组长度是 1024， 2的10次方，如果tail已经指向了数组的最后一位了，那我们就可以使用 tail++ ，然后再与 1023 求与，就得到了0，变成了数组的第一项。这个小技巧，<br/>
在位操作那一节课，我们也介绍过了。<br/>
二叉树<br/>

最核心的一种数据结构：树。<br/>
树在日常生活中是广泛存在的，例如家族的族谱，各种公司部门结构图等。在计算机里，树更是无处不在，你平时接触到的堆，红黑树，二叉查找树，并查集，线段树，<br/>
后缀树，树状数组都是树。数据库中索引是B+树，编译器中的语法树也是一种树，操作系统中的文件系统大多设计成树的结构……还有太多太多了。所以说，树这种数<br/>
据结构是程序的灵魂，是程序的根基，是电，是光，是……总之，能不能把树这种数据结构玩得溜，可以说是做程序员的第一道坎。<br/>
树这种数据结构，最经典，最基础的实例就是二叉树，掌握好二叉树是学习其他高级数据结构的基石，所以，请大家一定要反复看这一节，反复写程序。真的，二叉树<br/>
可能比你想象的还要重要得多。<br/>
JDK中的TreeMap是一种用树实现的Map，但是，它的实现是红黑树。虽然它本质上仍然是一棵二叉树，但却无论如何都得算是高级数据结构了（我敢打赌，90%以上的程<br/>
序员无法完整地写出红黑树的实现，不要说删除节点，恐怕光是插入就写不全）。所以，我强烈建议大家在完全地掌握了二叉树和AVL树之前，先不要急着去翻JDK的源代码。<br/>
二叉树<br/>
二叉树是一种树型结构，它的特点是每个结点至多只有两棵子树，并且，二叉树的子树有左右之分，其次序不能任意颠倒。<br/>
先上代码，二叉树的结点定义：<br/>

class Node { public Object data; public Node left;<br/>
 public Node right; } <br/>

可以看到，我们除了定义了一个结点的左孩子和右孩子，还定义一个data变量用于存储数据。我们写一段代码，来实际地创建一棵二叉树：<br/>
public class Main { public static void main(String args[]) { Node a = new Node(Integer.valueOf(1));<br/>
 Node b = new Node(Integer.valueOf(2));<br/>
 Node c = new Node(Integer.valueOf(3)); <br/>
a.left = b; a.right = c; } }<br/>
b. class Node { public Object data; <br/>
c.public Node left; <br/>
d.public Node right; <br/>
e.public Node(Object d) <br/>
{ this.data = d; } } <br/>

我们通过这种方式，手动地创建了一个二叉树，这个二叉树，如果使用图画出来，就是以下的样子：<br/>
我们称1是父节点，2是左孩子结点，3是右孩子结点。如果一个节点没有子结点，例如图中的2和3，那这个节点也是叶子节点。如果一个结点有子结点，也可以称其为<br/>
内部结点，或者是非叶子结点。<br/>
树的层次是这样定义的，把树按照上图所示的情况画出来，1位于第一层，2 和 3 位于第二层。树中结点的最大层次称为树的高度，2 和 3 位于第二层，所以这棵树<br/>
的高度就是2。<br/>
二叉查找树<br/>
二叉查找树的规则是，对于树中的任意一个结点，都满足，它的左孩子上的所有结点的值都比该结点小，而它的右孩子上的所有结点的值都比该结点大。与该结点<br/>
值相同的的结点可以放在左孩子上，也可以放在右孩子上，这个可以根据实际情况灵活实现。
根据这个定义，二叉查找树的插入过程就是递进地判断待插入数据与树中结点值的大小关系，找到待插入数据应该出现的位置。<br/>
如果待插入数据比根结点的数据小，就去检查根结点的左孩子。如果左孩子不为空，就继续向下检查，如果左孩子为空，就说明已经找到应该插入数据的位置了。
向右的情况则与向左的情况互为镜像，只是条件判断的符号换了一下而已。<br/>
在二叉查找树中找一个数据的思路与插入数据的思路很相似，唯一的不同之处是遇到空指针就是查找失败，说明待查找数据没在树中。程序不再列出，请读者自行实现。<br/>

二叉树的性质<br/>

这节课，先介绍一下二叉树的几个相关的性质，这些性质很简单，但却是我们进行数据结构的性能分析的基础。<br/>

1. 在二叉树的第 i 层上至多有 ￼ 个结点。<br/>

这个性质是显然的，第一层有1个，第二层最多只可能是第1层的两倍，第三层是第二层的两倍。<br/>

2. 深度为 k 的二叉树，最多有 ￼ 个结点。<br/>

这条性质由 1 可以直接得出：将每一层的最大结点数相加。这是一个公比为 2 的等比数列，其和为 ￼。<br/>
二叉树的遍历<br/>

在上一节课的课外阅读里，我们详细地讨论了递归程序。并且使用递归实现了二叉树的前序遍历：<br/>

public void preOrder(Node<T> n)<br/>
 { System.out.println(n.data);<br/>
if (n.left != null) preOrder(n.left); <br/>
if (n.right != null) preOrder(n.right); } <br/>

这里，先介绍一下三种常用的遍历方式：<br/>

1. 前序遍历。先访问根结点，再前序遍历左子树，最后前序遍历右子树。可见，这个操作的定义就是递归的。<br/>

2. 中序遍历。先中序遍历左子树，再访问根结点，最后中序遍历右子树。由于左子树上的值都比根结点小，右子树上的值都比根结点大，所以，中序遍历<br/>
一棵树所得到的结果，是从小到大有序的，可以根据这个特点，来检验你的中序遍历是否正确实现了。<br/>

3. 后序遍历。先后序遍历左子树，再后序遍历右子树，最后访问根结点。<br/>
红黑树。红黑树是JDK中最重要的一个树型数据结构。TreeSet, TreeMap，以及最新的Hashtable都使用了红黑树。<br/>

红黑树<br/>
在各种框架，开源软件，系统中十分常见。比如在linux源代码中，就有使用红黑树做为容器管理进程的代码，再比如C++的STL中，Set, Map都是使用红黑树实现的。但是红黑树不光在教材里很少出现，即使在各类博客，教程也很少出现。我觉得这可能是因为红黑树的规则太复杂所导致的。
定义和性质<br/>
红黑树是一种自平衡二叉查找树。它的统计性能要好于平衡二叉树（AVL树），因此，红黑树在很多地方都有应用。在STL中，很多部分(目前包括set，multiset，map， multimap)应用了红黑树。它的操作有着良好的最坏情况运行时间，并且在实践中是高效的: 它可以在O(logn)时间内做查找，插入和删除等操作。
与二叉查找树相比，红黑树的树结点多了一个颜色属性，而每个结点不是黑色即是红色。这就是红黑树名称的由来。树的每个节点是一个五元组：color（颜色），key（数据）， left（左孩子），right（右孩子）和parent（父结点）。注意哦，红黑树是一种平衡树，但是结点的结构却出奇的简单，比起传统二叉树，只多了颜色而已。

红黑树具有以下性质：<br/>

根是黑色<br/>

所有叶子都是黑色（叶子是NIL结点）<br/>

如果一个结点是红的，则它的两个儿子都是黑的<br/>

从任一结点到其叶子的所有简单路径都包含相同数目的黑色结点<br/>

总结起来，最重要的就是红色结点不能有红色孩子，从根到任意叶子，经过的黑色结点数目相等。<br/>

插入数据<br/>

红黑树从根本上说还是排序二叉树，因此，红黑树的查找操作与二叉排序树的查找操作是一致的。<br/>

向红黑树中插入新的结点。具体做法是，将新结点的 color 赋为红色，然后以二叉排序树的插入方法插入到红黑树中去。之所以将新插入的结点的颜色赋为红色，<br/>
是因为：如果设为黑色，就会导致根到叶子的路径上有一条路上，多一个额外的黑结点，这个是很难调整的。但是设为红色结点后，可能会导致出现两个连续红色<br/>
结点的冲突，那么可以通过颜色调换和树旋转来调整，这样简单多了。<br/>

接下来，讨论一下插入以后，红黑树的情况。设要插入的结点为N，其父结点为P，其 祖父结点为G，其父亲的兄弟结点为U（即P和U 是同一个结点的两个子结点）。<br/>
如果P是黑色的，则整棵树不必调整就已经满足了红黑树的所有性质。如果P是红色的（可知，其父结点G一定是黑色的），则插入N后，违背了红色结点只能有黑色孩子的<br/>
性质，需要进行调整。<br/>

调整时分以下三种情况：<br/>
<br/>
第一、N的叔叔U是红色的。将P和U重绘为黑色并重绘结点G为红色。现在新结点N有 了一个黑色的父结点P，因为通过父结点P或叔父结点U的任何路径都必定通过祖父结<br/>
点G， 在这些路径上的黑结点数目没有改变。但是，红色的祖父结点G的父结点也有可能是红色 的，这就违反了性质3。为了解决这个问题，我们在祖父结点G递归向上<br/>
调整颜色。<br/>
第二、N的叔叔U是黑色的，且N是左孩子。对祖父结点G 的一次右旋转; 在旋转产生的树中，以前的父结点P现在是新结点N和以前的祖父节点 G 的父结点，然后交换以<br/>
前的父结点P和祖父结点G的颜色，结果仍满足红黑树性质。如图 2.15。在(b)中，虚线代表原来的指针，实线代表旋转过后的指针。所谓旋转就是改变图中所示的两<br/>
个指针的值即可。当然，在实际应用中，还有父指针p也需要修改，这里为了图示的简洁而省略掉了。<br/>
第三、N的叔叔U是黑色的，且N是右孩子。我们对P进行一次左旋转调换新结点和其父 结点的角色，就把问题转化成了第二种情况。<br/>
对于一堆数据的操作，有插入，删除，和查找。红黑树当然是一种解决方案，这一节，我们介绍另外一种思路，那就是散列表。散列表(HashTable)的背后也是分治的思想。<br/>
其实散列表本身很简单，基本的数据结构教材里都讲得很详细。但我觉得，学习散列表最重要的还是要体会它与红黑树等树形结构的本质不同。树形结构利用的是数据之<br/>
间的有序关系，也就是说红黑树所组织的数据必须是可比较大小(或者是定出先后顺序的)，而散列表则完全不同于树形结构，它对数据的要求仅仅是可以计算特征。<br/>
在树型结构中，查找的效率依赖于查找过程中所进行的比较次数。理想的情况是希望不经过任何比较，一次存取便能得到所查记录，那就必须在记录的存储位置和它的关<br/>
键字之间建立一个确定的对应关系 f, <br/>
使每个关键字和结构中一个惟一的存储位置相对应。因而在查找时，只要根据这个对应关系 f 找到给定值 K 的函数值 f(K)。若结构中存在关键字和 K 相等的记录。<br/>
在此，我们称这个对应关系 f 为哈希 (Hash) 函数，按这个思想建立的表为哈希表。<br/>
举一个例子。假如我们十个仓库，对货物都编上号码，如果货物号的个位是0，就放到0号仓库，个位是1，就放到1号仓库。这样，我们就建立了一个货物编号与仓库<br/>
之间的对应关系：<br/>
f(id) = id % 10<br/>
这种哈希函数一般称为除留余数法，当然还有其他的构造方式，我们这里就不再介绍了。有兴趣的可以自己去查（这不是一个重要的知识点）<br/>

处理冲突<br/>

还是考虑仓库的例子。如果我们已经把 3 号货物送到了 3 号仓库，这时我们想从仓库中取出 3 号货物，就非常简单，只要直接去 3 号仓库中去取就好了。<br/>
我们考虑使用代码来表示，用一个数组代表仓库：<br/>

int[] warehouse = new int[10];<br/>

那么，往里面存数据的函数就可以写成：<br/>
<br/>
int hash(int id)<br/>
 { <br/>
return id % 10; <br/>
} <br/>
void put(id) <br/>
{ warehouse[hash(id)] = id;<br/>
 }<br/>

当插入的数据是11， 13， 25， 46， 38时，一切都非常好，所有的货物都能找到自己对应的仓库。但如果这时，又来了一个21，31，就有问题了。这时就会发现，<br/>
1号仓库已经被11占据了。这种情况就是发生了冲突了。<br/>
选择一个更加均匀的哈希函数可以减少冲突，但不能完全避免，所以如果处理冲突是哈希表不可缺少的一方面。<br/>
如果需要删除的结点有两个孩子，我们的做法是找到这个结点的中序后继，将后继结点中的数据拷贝至待删除结点，然后删除后继结点。而后继结点必然最多只有<br/>
一个子结点，这样我们就把删除两个孩子的结点转为删除一个孩子的结点。在删除的过程中，我们只关心树是否仍然保持红黑树的性质，数据是否组织正确，而<br/>
不关心这个结点是最初要删除的结点还是我们从中复制出值的那个结点。<br/>

接下来，我们只讨论删除只有一个儿子的结点，如果它两个儿子都为空，即均为叶子，我们任意将其中一个看作它的儿子。这里，体现出来，在红黑树里特别指<br/>
定叶子结点为NIL结点的作用，NIL结点经常可以充当正常结点使用以使得算法的表达更加容易。<br/>
如果我们删除一个红色结点，它的父亲和儿子一定是黑色的。所以我们可以简单的用它的黑色儿子替换它，并不会破坏属性2和3。通过被删除结点的所有路径<br/>
只是少了一个红色结点，这样可以继续保证属性4。另一种简单情况是在被删除结点是黑色而它的儿子是红色的时候。如果只是去除这个黑色结点，用它的红色<br/>
儿子顶替上来的话，会破坏属性4，但是如果我们重绘它的儿子为黑色，则曾经通过它的所有路径将通过它的黑色儿子，这样可以继续保持属性4。这是比较简<br/>
单的两种情况，我们不再讨论。<br/>
现在，需要详细讨论的就是如果待删除结点和它的子结点都是黑色的时候，这种比较复杂的情况。有些参考资料上为了表达形式上的简洁，把要讨论的情况分成<br/>
了四类或者五类，而我认为，把情况细分为六类是比较合理的，这样更利于理解。而且不同于其他的讲解的地方是，我在这里调整了这六种情况的排序。先讲解最<br/>
简单的，最后讲最复杂的，而不是追求形式上完善，这一点希望读者能够理解。<br/>
先来约定涉及到的结点的名称。我们先用待删除结点的孩子代替待删除结点，并且记这个孩子为N，记它的新的父结点为P，它的兄弟结点，也就是父结点的另外<br/>
一个孩子为S， 记S的左孩子为￼，记S的右孩子为￼。<br/>
情况一。N是新的根。在这种情况下，我们就做完了。我们从所有路径去除了一个黑色节点，而新根是黑色的，所有属性都保持着。<br/>
情况二。P为红色，S和S的两个孩子都是黑色的。将P置为黑色，S置为红色。这样，不经过N的路径上的黑色结点数目并没有发生变化，而经过N结点的路径上黑色<br/>
结点的数目 增加了1，刚好添补了这条路径上删除的黑色结点。所以红黑树又重新达到了平衡。<br/>
情况三。S是黑色，S的右儿子是红色，而N是它父亲的左儿子。在这种情况下我们在N的父亲上做左旋转，这样S成为N的父亲和S的右儿子的父亲。我们接着交换N的<br/>
父亲和S的颜色，并使S的右儿子为黑色。子树在它的根上的仍是同样的颜色，所以属性3 没有被违反。但是，N现在增加了一个黑色祖先: 要么N的父亲变成黑色，要<br/>
么它是黑色而S被增加为一个黑色祖父。所以，通过N的路径都增加了一个黑色节点。此时，如果一个路径不 通过N，则有两种可能性:<br/>
通过N 的新兄弟。那么它以前和现在都必定通过S 和N 的父亲，而它们只是交换了颜色。所以路径保持了同样数目的黑色节点。<br/>
它通过N 的新叔父，S 的右儿子。那么它以前通过S、S 的父亲和S的右儿子，但是现在只通过S，它被假定为它以前的父亲的颜色，和 S 的右儿子，它被从红色改变<br/>
为黑色。合成效果是这个路径通过了同样数目的黑色节点。<br/>
在任何情况下，在这些路径上的黑色节点数目都没有改变。所以我们恢复了属性4。在示意图中的白色节点可以是红色或黑色，但是在变换前后都必须指定相同的颜色<br/>
情况四。S是黑色，S的左儿子是红色，S的右儿子是黑色，而N是它父亲的左儿子。在 这种情况下我们在S上做右旋转，这样S的左儿子成为S的父亲和N的新兄弟。我们<br/>
接着交换S和它的新父亲的颜色。所有路径仍有同样数目的黑色节点，但是现在N有了一个右儿子是红色的黑色兄弟，所以我们进入了情况三。N和它的父亲都不受这个<br/>
变换的影响。<br/>
情况五。S是红色。在这种情况下我们在N的父亲上做左旋转，把红色兄弟转换成N的 祖父。我们接着对调N的父亲和祖父的颜色。尽管所有的路径仍然有相同数目的黑色<br/>
节点，现在N有了一个黑色的兄弟和一个红色的父亲，所以我们可以接下去按二、三或四情况来处 理。N它的新兄弟SL是黑色，因为它未旋转前是红色S的一个儿子。<br/>
情况六。N的父亲、S和S的儿子都是黑色的。在这种情况下，我们简单的重绘S为红 色。结果是通过S的所有路径，它们就是以前不通过N的那些路径，都少了一个黑色节<br/>
点。 因为删除N的初始的父亲使通过N的所有路径少了一个黑色节点，这使事情都平衡了起来。 但是，通过P的所有路径现在比不通过P的路径少了一个黑色节点，所以<br/>
仍然违反属性3。要修正这个问题，我们要从情况一开始，在P上做重新平衡处理。<br/>
对于一堆数据的操作，有插入，删除，和查找。红黑树当然是一种解决方案，这一节，我们介绍另外一种思路，那就是散列表。散列表(HashTable)的背后也是分治的思<br/>
想。其实散列表本身很简单，基本的数据结构教材里都讲得很详细。但我觉得，学习散列表最重要的还是要体会它与红黑树等树形结构的本质不同。树形结构利用的是<br/>
数据之间的有序关系，也就是说红黑树所组织的数据必须是可比较大小(或者是定出先后顺序的)，而散列表<br/>则完全不同于树形结构，它对数据的要求仅仅是可以计算特征。<br/>
在树型结构中，查找的效率依赖于查找过程中所进行的比较次数。理想的情况是希望不经过任何比较，一次存取便能得到所查记录，那就必须在记录的存储位置和它的<br/>
关键字之间建立一个确定的对应关系 f, 使每个关键字和结构中一个惟一的存储位置相对应。因而在查找时，只要根据这个对应关系 f 找到给定值 K 的函数值 f(K)。<br/>
若结构中存在关键字和 K 相等的记录。在此，我们称这个对应关系 f 为哈希 (Hash) 函数，按这个思想建立的表为哈希表。<br/>
<br/><br/>
举一个例子。假如我们十个仓库，对货物都编上号码，如果货物号的个位是0，就放到0号仓库，个位是1，就放到1号仓库。这样，我们就建立了一个货物编号与仓库之<br/>
间的对应关系：<br/>

f(id) = id % 10<br/>

这种哈希函数一般称为除留余数法，当然还有其他的构造方式，我们这里就不再介绍了。有兴趣的可以自己去查（这不是一个重要的知识点）<br/>

处理冲突<br/>

还是考虑仓库的例子。如果我们已经把 3 号货物送到了 3 号仓库，这时我们想从仓库中取出 3 号货物，就非常简单，只要直接去 3 号仓库中去取就好了。<br/>
我们考虑使用代码来表示，用一个数组代表仓库：<br/>

int[] warehouse = new int[10];<br/>

那么，往里面存数据的函数就可以写成：<br/>

int hash(int id)<br/>
 { return id % 10;<br/>
} void put(id) <br/>
{ warehouse[hash(id)] = id;<br/>
 }<br/>

当插入的数据是11， 13， 25， 46， 38时，一切都非常好，所有的货物都能找到自己对应的仓库。但如果这时，又来了一个21，31，就有问题了。这时就会<br/>
发现，1号仓库已经被11占据了。这种情况就是发生了冲突了。<br/>
选择一个更加均匀的哈希函数可以减少冲突，但不能完全避免，所以如果处理冲突是哈希表不可缺少的一方面。<br/>
我们今天要介绍解决冲突的方法是链地址法。其他的方法就不再介绍了。链地址法的思路非常简单，那就是把原来容量为1的仓库，变成一个单链表就可以了。<br/>



<table>
</table><%@ include file="copyright.jsp"%>
</td>
  </tr>
</table>
</body>
</html>
