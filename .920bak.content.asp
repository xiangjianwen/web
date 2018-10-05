<%@Language="vbscript" Codepage="936"%>

  <%
  response.charset="gb2312" 

   rid=request.QueryString("r")
      text=request.QueryString("t")
	 page=request.QueryString("page")
	  
response.expires=-1
response.charset="utf-8" 

   set my_conn=Server.CreateObject("ADODB.Connection")
    DBPath = Server.MapPath("db/db.mdb")
   my_conn.Open "provider=microsoft.jet.oledb.4.0;data source="&dbpath
set rst = Server.CreateObject("ADODB.Recordset")
' if text="title" then
'			'strSQL2 ="select top 1 * from Leaveword order by id desc"
'			strSQL = "Select * from ExamScores "
'			 rst.open strSQL, my_conn,1
'			if rst.RecordCount=0 then
'				 response.write("<ul>没有记录</ul>")
'			  else
'			   response.write("<ul >") 
'		 	    response.write("<li style='width:150px'>" & rst("a2") & "</li>")
'			    response.write("<li style='width:80px'>" & rst("Username") & "</li>")
'			  	response.write("<li style='width:40px'>" & rst("a18") & "</li>")
'				response.write("<li style='width:80px'>" & rst("a19") & "</li>")
'				response.write("<li style='width:80px'>" & rst("a20") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a5") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a6") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a7") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a8") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a9") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a10") & "</li>")
'				response.write("<li style='width:80px'>" & rst("a11") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a12") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a13") & "</li>")
'				response.write("<li style='width:40px'>" & rst("a14") & "</li>")
'				response.write("<li style='width:80px'>" & rst("a15") & "</li>")
'				response.write("<li style='width:80px'>" & rst("a16") & "</li>")
'				response.write("<li style='width:40px;border-right-stlye:none'>" & rst("a17") & "</li>")
'				response.Write("</ul>")
'			end if			
'else			
if text<>"" then
				  strSQL = "Select * from ExamScores where a2='学校名称' or "&rid&" like '%"&text& "%'"
				   rst.open strSQL, my_conn,1
				   if rst.RecordCount=1 then
					   response.write("<ul>没有"&text&"块记录</ul>")
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
		 	    response.write("<li style='width:150px'>" & rst("a2") & "</li>")
			    response.write("<li style='width:80px'>" & rst("Username") & "</li>")
			  	response.write("<li style='width:60px'>" & rst("a18") & "</li>")
				response.write("<li style='width:80px'>" & rst("a19") & "</li>")
				response.write("<li style='width:80px'>" & rst("a20") & "</li>")
				response.write("<li style='width:40px'>" & rst("a5") & "</li>")
				response.write("<li style='width:40px'>" & rst("a6") & "</li>")
				response.write("<li style='width:40px'>" & rst("a7") & "</li>")
				response.write("<li style='width:40px'>" & rst("a8") & "</li>")
				response.write("<li style='width:40px'>" & rst("a9") & "</li>")
				response.write("<li style='width:40px'>" & rst("a10") & "</li>")
				response.write("<li style='width:80px'>" & rst("a11") & "</li>")
				response.write("<li style='width:40px'>" & rst("a12") & "</li>")
				response.write("<li style='width:40px'>" & rst("a13") & "</li>")
				response.write("<li style='width:40px'>" & rst("a14") & "</li>")
				response.write("<li style='width:80px'>" & rst("a15") & "</li>")
				response.write("<li style='width:80px'>" & rst("a16") & "</li>")
				response.write("<li style='width:40px'>" & rst("a17") & "</li>")
				response.Write("</ul>")
						'将记录集指针指向下一条记录
					  rst.MoveNext
					  next 
			     response.write("<ul style='display:none''") 
				response.write("<li style='width:60px;display:none'><a id='pre' href='content.asp?r="&rid&"&t="&text&"&page=" & epage-1 & "'>前一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='next' href='/content.asp?r="&rid&"&t="&text&"&page=" & epage+1 & "'>后一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='final' href='content.asp?r="&rid&"&t="&text&"&page=" & rst.pagecount & "'>末页</a></li>")
	
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;';  onclick='nextpage()'>下一页</li>")
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;'; onclick='finalpage()'>末页</li>")
'							response.write("<li id='pageinfo'  style='float:right;width:300px;'>现在是第" & epage & "页,一共有"&rst.pagecount&"页,"&rst.RecordCount&"条记录</li>")
                response.Write("</ul>")
                response.Write("<table Align='center'>")
						response.write("<tr><td stlye='overflow:visible;width:500px'><a  onclick='prepage()' href='javascript:void(0)'>&lt; </a>"& epage &" of "&rst.pagecount&" pages<a onclick='nextpage()' href='javascript:void(0)'> &gt;</a>"&rst.RecordCount&" Records<a onclick='finalpage()' href='javascript:void(0)'>&gt;&gt;</a></td></tr>")
	
               response.Write("</table>")

			end if	

 else 
				 strSQL = "Select a2 from ExamScores WHERE(a2<>'学校名称') GROUP BY a2 "
			 rst.open strSQL, my_conn,1
			if rst.RecordCount=0 then
				 response.write("<ul>没有记录</ul>")
			  else
			 response.write("<ul>所有学校</ul>")
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
			   response.write("<ul >"& rst("a2")&"</ul>")
			   rst.MoveNext
					  next 
			     response.write("<ul style='display:none''") 
				response.write("<li style='width:60px;display:none'><a id='pre' href='content.asp?r="&rid&"&t="&text&"&page=" & epage-1 & "'>前一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='next' href='/content.asp?r="&rid&"&t="&text&"&page=" & epage+1 & "'>后一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='final' href='content.asp?r="&rid&"&t="&text&"&page=" & rst.pagecount & "'>末页</a></li>")
	
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;';  onclick='nextpage()'>下一页</li>")
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;'; onclick='finalpage()'>末页</li>")
'							response.write("<li id='pageinfo'  style='float:right;width:300px;'>现在是第" & epage & "页,一共有"&rst.pagecount&"页,"&rst.RecordCount&"条记录</li>")
                response.Write("</ul>")
                response.Write("<table Align='center'>")
						response.write("<tr><td stlye='overflow:visible;width:500px'><a  onclick='prepage()' href='javascript:void(0)'>&lt; </a>"& epage &" of "&rst.pagecount&" pages<a onclick='nextpage()' href='javascript:void(0)'> &gt;</a>"&rst.RecordCount&" Records<a onclick='finalpage()' href='javascript:void(0)'>&gt;&gt;</a></td></tr>")
	
               response.Write("</table>")
			end if 
end if
'end if
 my_conn.Close
       set my_conn=nothing
	   response.charset="gb2312" 

   %>


