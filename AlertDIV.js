// $(document).ready(function () {
//		$("#txl").click(function(){$("#bg").load("txl.htm");});
//});
setTimeout("closeAd()",1000);
function closeAd()
{
	//document.getElementById("ad_3v").style.display='none';
	var thisNode=document.getElementById("ad_3v");
	thisNode.parentNode.removeChild(thisNode);
}
function changDiv(show_div,bg_div){
   document.getElementById(bg_div).innerHTML=document.getElementById(show_div).innerHTML;
   
 
};
//弹出隐藏层
function ShowDiv(show_div,bg_div){
   document.getElementById(show_div).style.display='block';
   document.getElementById(bg_div).style.display='block' ;
   var bgdiv = document.getElementById(bg_div);
   bgdiv.style.width = document.body.scrollWidth*0.5; 
  // bgdiv.style.height = $(document).height();
  // $("#"+bg_div).height($(document).height());
};
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
    document.getElementById(show_div).style.display='none';
    document.getElementById(bg_div).style.display='none';
};
function cleard()
{
	document.getElementById("save").innerHTML="";
}


//月考
function showexamContent() 
{
var xmlhttp;
var flag=0
var id;
var text;
var rid
 text= document.getElementById("textexamfield").value
  id= document.getElementById("bj").value
if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
	  //displace loading status
	var loadingDiv = document.getElementById("content"); // get the div
	loadingDiv.innerHTML = '<p align="center" style="font-size:16px; color: #F00;"><strong>正在查询，请稍后...</strong></p>'; // insert tip information
	//loadingDiv.style.display = ""; // display the div
	//load completed
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("content").innerHTML=xmlhttp.responseText;
	//	document.getElementById("bg").style=""
    }
	//	else
	//{ document.getElementById("bg").style="background-color:#CCC;"
	//	}
  }
   examid= document.getElementById("examcount").value
if (examid==1)
  {
xmlhttp.open("GET","/examcontent.asp?"+"r="+id+"&t="+text+"&page=1",true);
xmlhttp.send();
  }
 
 else
	{
	 if(examid==2){xmlhttp.open("GET","/examcontent2.asp?"+"r="+id+"&t="+text+"&page=1",true);xmlhttp.send();}
	else{
		if(examid==3){xmlhttp.open("GET","/examcontent3.asp?"+"r="+id+"&t="+text+"&page=1",true);xmlhttp.send();}
		else{alert("未考！")}
		}
	}
}
/*function ChangeColor(){var rows = document.getElementsByTagName('ul');
for (var i=0;i<rows.length;i++){
	rows[i].onmouseover = function(){		//鼠标在行上面的时候
		this.className = 'change';
	}
	rows[i].onmouseout = function(){		//鼠标离开时
		this.className = this.className.replace('change','list');
	}
}
}鼠标经过变色*/

//电话
function showphoneContent()
{
var xmlhttp;
var flag=0
var id;
var text;
 text= document.getElementById("phonetextfield").value

if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("pcontent").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","/phonecontent.asp?"+"r="+id+"&t="+text,true);
xmlhttp.send();
}

/*function ChangeColor(){var rows = document.getElementsByTagName('ul');
for (var i=0;i<rows.length;i++){
	rows[i].onmouseover = function(){		//鼠标在行上面的时候
		this.className = 'change';
	}
	rows[i].onmouseout = function(){		//鼠标离开时
		this.className = this.className.replace('change','list');
	}
}
}鼠标经过变色*/
function saveInvestigation()
{
var xmlhttp;


 text1= document.getElementById("text1").value
 text2= document.getElementById("text2").value

if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("save").innerHTML=xmlhttp.responseText;
	document.getElementById("text1").value=""
	 document.getElementById("text2").value=""
	  }
  }
xmlhttp.open("GET","/postleaveword.asp?"+"t1="+text1+"&t2="+text2,true);
xmlhttp.send();
}
function deletephone()
{var xmlhttp;
 text1= document.getElementById("text1").value
 text2= document.getElementById("text2").value
if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("save").innerHTML=xmlhttp.responseText;
	
	  }
  }
xmlhttp.open("GET","/deletephone.asp?"+"t1="+text1+"&t2="+text2,true);
xmlhttp.send();
	}
	
	
function showContent() 
{
var xmlhttp;
var flag=0
var id;
var text;
var rid
 rid= document.getElementsByName("datalistsect")
 text= document.getElementById("textfield").value
// if (text!="") {dataTitle();} 
// else 
// {document.getElementById("dtitle").innerHTML="";}

 
 for (i=0 ;i<2;i++)
 	{if(rid[i].checked==true){id=rid[i].id;flag=1;}
	}
if(flag==0)id="all";
if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
	  //displace loading status
	var loadingDiv = document.getElementById("content"); // get the div
	loadingDiv.innerHTML = '<p align="center" style="font-size:16px; color: #F00;"><strong>正在查询，请稍后...</strong></p>'; // insert tip information
	//loadingDiv.style.display = ""; // display the div
	//load completed
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("content").innerHTML=xmlhttp.responseText;
	//	document.getElementById("bg").style=""
    }
	//	else
	//{ document.getElementById("bg").style="background-color:#CCC;"
	//	}
  }
xmlhttp.open("GET","/content.asp?"+"r="+id+"&t="+text+"&page=1",true);
xmlhttp.send();
}
/*function ChangeColor(){var rows = document.getElementsByTagName('ul');
for (var i=0;i<rows.length;i++){
	rows[i].onmouseover = function(){		//鼠标在行上面的时候
		this.className = 'change';
	}
	rows[i].onmouseout = function(){		//鼠标离开时
		this.className = this.className.replace('change','list');
	}
}
}鼠标经过变色*/

 
 
 //
 function nextpage() //显示下一页
{
var xmlhttp;

urlnext=document.getElementById("next").href
if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  { 
  var loadingDiv = document.getElementById("content"); // get the div
	loadingDiv.innerHTML = '<p align="center" style="font-size:16px; color: #F00;"><strong>正在查询，请稍后...</strong></p>'; 
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("content").innerHTML=xmlhttp.responseText;
    }
  }
 
xmlhttp.open("GET",urlnext,true);
xmlhttp.send();
}

 function prepage() //显示下一页
{
var xmlhttp;

urlnext=document.getElementById("pre").href
if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  { 
  var loadingDiv = document.getElementById("content"); // get the div
	loadingDiv.innerHTML = '<p align="center" style="font-size:16px; color: #F00;"><strong>正在查询，请稍后...</strong></p>'; 
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("content").innerHTML=xmlhttp.responseText;
    }
  }
 
xmlhttp.open("GET",urlnext,true);
xmlhttp.send();
}

 function finalpage() //显示下一页
{
var xmlhttp;

urlnext=document.getElementById("final").href
if (window .XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  { 
  var loadingDiv = document.getElementById("content"); // get the div
	loadingDiv.innerHTML = '<p align="center" style="font-size:16px; color: #F00;"><strong>正在查询，请稍后...</strong></p>'; 
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("content").innerHTML=xmlhttp.responseText;
    }
  }
 
xmlhttp.open("GET",urlnext,true);
xmlhttp.send();
}

function SubmitKeyClick(obj, evt)//文本框监听回车事件
{ keyCode = evt.keyCode ? evt.keyCode : (evt.which ? evt.which : evt.charCode);
        if (keyCode == 13) {
            showContent()
        }
	}