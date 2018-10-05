<%@Language="vbscript" Codepage="936"%>

  <%
  response.charset="gb2312" 
  dim rid

   rid=request.QueryString("r")
      text=request.QueryString("t")
	 page=request.QueryString("page")
	  
response.expires=-1
response.charset="utf-8" 

   set my_conn=Server.CreateObject("ADODB.Connection")
    DBPath = Server.MapPath("db/db.mdb")
   my_conn.Open "provider=microsoft.jet.oledb.4.0;data source="&dbpath
set rst = Server.CreateObject("ADODB.Recordset")
	
Sub aa(strSQL) 

				
				
			 rst.open strSQL, my_conn,1
			if rst.RecordCount=0 then
				 response.write("<ul>没有记录</ul>")
			  else
			  rst.pagesize=80
					  if page<>"" then
						epage=cint(page)
						 if epage<1 then epage=1
						 if epage>rst.pagecount then epage=rst.pagecount
					  else
					  epage=1
					  end if
					  rst.absolutepage=epage
					
					for i=1 to rst.pagesize-1
					if rst.bof or rst.eof then exit for
			   response.write("<ul>") 
		 	    response.write("<li style='width:80px'>" & rst("a2") & "</li>")
				response.write("<li style='width:40px'>" & rst("a3") & "</li>")
			  	response.write("<li style='width:60px'>" & rst("a28") & "</li>")
				response.write("<li style='width:80px'>" & rst("a29") & "</li>")
				response.write("<li style='width:80px'>" & rst("a30") & "</li>")
				response.write("<li style='width:40px'>" & rst("a4") & "</li>")
				response.write("<li style='width:40px'>" & rst("a7") & "</li>")
				response.write("<li style='width:40px'>" & rst("a10") & "</li>")
				response.write("<li style='width:40px'>" & rst("a13") & "</li>")
				response.write("<li style='width:40px'>" & rst("a16") & "</li>")
				response.write("<li style='width:40px'>" & rst("a19") & "</li>")
				response.write("<li style='width:40px'>" & rst("a22") & "</li>")
				response.write("<li style='width:40px'>" & rst("a25") & "</li>")
				response.Write("</ul>")
			   rst.MoveNext
					  next 
			     response.write("<ul style='display:none''") 
				response.write("<li style='width:60px;display:none'><a id='pre' href='examcontent.asp?r="&rid&"&t="&text&"&page=" & epage-1 & "'>前一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='next' href='/examcontent.asp?r="&rid&"&t="&text&"&page=" & epage+1 & "'>后一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='final' href='examcontent.asp?r="&rid&"&t="&text&"&page=" & rst.pagecount-1 & "'>末页</a></li>")
	
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;';  onclick='nextpage()'>下一页</li>")
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;'; onclick='finalpage()'>末页</li>")
'							response.write("<li id='pageinfo'  style='float:right;width:300px;'>现在是第" & epage & "页,一共有"&rst.pagecount&"页,"&rst.RecordCount&"条记录</li>")
                response.Write("</ul>")
                response.Write("<table Align='center'>")
						response.write("<tr><td stlye='overflow:visible;width:500px'><a  onclick='prepage()' href='javascript:void(0)'>&lt; </a>"& epage &" of "&rst.pagecount&" pages<a onclick='nextpage()' href='javascript:void(0)'> &gt;</a>"&rst.RecordCount-1&" Records<a onclick='finalpage()' href='javascript:void(0)'>&gt;&gt;</a></td></tr>")
	
               response.Write("</table>")
			end if 
	
End sub 


'else			
if rid="姓名" then
'      if text <> "" then
				  strSQL = "Select * from Lxexam81 where a2='姓名' or a2 like '%"&text& "%'ORDER BY a28 desc"
				   rst.open strSQL, my_conn,1
				   if rst.RecordCount=1 then
					   response.write("<ul>没有"&text&"的记录</ul>")
				   else
										
					'开始分页
					rst.pagesize=80
					  if page<>"" then
						epage=cint(page)
						 if epage<1 then epage=1
						 if epage>rst.pagecount then epage=rst.pagecount
					  else
					  epage=1
					  end if
					  rst.absolutepage=epage
					
					for i=1 to rst.pagesize-1
					if rst.bof or rst.eof then exit for
			   response.write("<ul>") 
		 	    response.write("<li style='width:80px'>" & rst("a2") & "</li>")
				response.write("<li style='width:40px'>" & rst("a3") & "</li>")
			  	response.write("<li style='width:60px'>" & rst("a28") & "</li>")
				response.write("<li style='width:80px'>" & rst("a29") & "</li>")
				response.write("<li style='width:80px'>" & rst("a30") & "</li>")
				response.write("<li style='width:40px'>" & rst("a4") & "</li>")
				response.write("<li style='width:40px'>" & rst("a7") & "</li>")
				response.write("<li style='width:40px'>" & rst("a10") & "</li>")
				response.write("<li style='width:40px'>" & rst("a13") & "</li>")
				response.write("<li style='width:40px'>" & rst("a16") & "</li>")
				response.write("<li style='width:40px'>" & rst("a19") & "</li>")
				response.write("<li style='width:40px'>" & rst("a22") & "</li>")
				response.write("<li style='width:40px'>" & rst("a25") & "</li>")
				response.Write("</ul>")
						'将记录集指针指向下一条记录
					  rst.MoveNext
					  next 
			     response.write("<ul style='display:none''") 
				response.write("<li style='width:60px;display:none'><a id='pre' href='examexamcontent.asp?r="&rid&"&t="&text&"&page=" & epage-1 & "'>前一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='next' href='/examcontent.asp?r="&rid&"&t="&text&"&page=" & epage+1 & "'>后一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='final' href='examcontent.asp?r="&rid&"&t="&text&"&page=" & rst.pagecount & "'>末页</a></li>")
	
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;';  onclick='nextpage()'>下一页</li>")
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;'; onclick='finalpage()'>末页</li>")
'							response.write("<li id='pageinfo'  style='float:right;width:300px;'>现在是第" & epage & "页,一共有"&rst.pagecount&"页,"&rst.RecordCount&"条记录</li>")
                response.Write("</ul>")
                response.Write("<table Align='center'>")
						response.write("<tr><td stlye='overflow:visible;width:500px'><a  onclick='prepage()' href='javascript:void(0)'>&lt; </a>"& epage &" of "&rst.pagecount&" pages<a onclick='nextpage()' href='javascript:void(0)'> &gt;</a>"&rst.RecordCount-1&" Records<a onclick='finalpage()' href='javascript:void(0)'>&gt;&gt;</a></td></tr>")
	
               response.Write("</table>")

			'else
'	   response.write("<ul>请输入姓名</ul>")
		
	end if		

 else 
     if rid="81" then
	 
	 bj="1"
	  strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
   elseif rid ="82" then
    bj="2"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid ="83" then
    bj="3"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid ="84" then
    bj="4"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid ="85" then
    bj="5"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid ="86" then
    bj="6"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid ="87"then
    bj="7"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid ="88"then
    strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	aa(bj)
	elseif rid ="89"then
    bj="9"
	strSQL = "Select * from Lxexam81 WHERE a3='" & bj & "' or a2='姓名' ORDER BY a28 desc "
   aa(strSQL)
	elseif rid="平均分" then
 response.write("<ul>") 
		 	    response.write("<li style='width:60px'>班级</li>")
		 	    response.write("<li style='width:60px'>人数</li>")
				response.write("<li style='width:60px'>总分</li>")
			  	response.write("<li style='width:60px'>语文</li>")
				response.write("<li style='width:60px'>数学</li>")
				response.write("<li style='width:60px'>英语</li>")
				response.write("<li style='width:60px'>物理</li>")
				response.write("<li style='width:60px'>政治</li>")
				response.write("<li style='width:60px'>历史</li>")
				response.write("<li style='width:60px'>地理</li>")
				response.write("<li style='width:60px'>生物</li>")
				response.Write("</ul>")
	strSQL="select   a3,count(a3) as renshu,round(avg(a28),2) as zf,round(sum(a4)/sum(IIF(a4<>'0',1,0)),2) as yw,round(sum(a7)/sum(IIF(a7<>'0',1,0)),2) as sx,round(sum(a10)/sum(IIF(a10<>'0',1,0)),2) as yy,round(avg(a13),2) as wl,round(avg(a16),2) as zz,round(avg(a19),2) as ls,round(avg(a22),2) as dl,round(avg(a25),2) as sw from Lxexam81 where a28 not in('总分','0')  group by a3 "
	  rst.open strSQL, my_conn,1
			if rst.RecordCount=0 then
							  

			  else
			  rst.pagesize=80
					  if page<>"" then
						epage=cint(page)
						 if epage<1 then epage=1
						 if epage>rst.pagecount then epage=rst.pagecount
					  else
					  epage=1
					  end if
					  rst.absolutepage=epage
					
					for i=1 to rst.pagesize-1
					if rst.bof or rst.eof then exit for
			   response.write("<ul>") 
		 	    response.write("<li style='width:60px'>" & rst("a3") & "</li>")
				response.write("<li style='width:60px'>" & rst("renshu") & "</li>")
				response.write("<li style='width:60px'>" & rst("zf") & "</li>")
			  	response.write("<li style='width:60px'>" & rst("yw") & "</li>")
				response.write("<li style='width:60px'>" & rst("sx") & "</li>")
				response.write("<li style='width:60px'>" & rst("yy") & "</li>")
				response.write("<li style='width:60px'>" & rst("wl") & "</li>")
				response.write("<li style='width:60px'>" & rst("zz") & "</li>")
				response.write("<li style='width:60px'>" & rst("ls") & "</li>")
				response.write("<li style='width:60px'>" & rst("dl") & "</li>")
				response.write("<li style='width:60px'>" & rst("sw") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a19") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a22") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a25") & "</li>")
				response.Write("</ul>")
			   rst.MoveNext
					  next 
			     
'			
			end if 
	 end if
end if

 my_conn.Close
       set my_conn=nothing
	   response.charset="gb2312" 

   %>


