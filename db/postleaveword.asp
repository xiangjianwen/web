<%
   set my_conn=Server.CreateObject("ADODB.Connection")
    DBPath = Server.MapPath("db/db.mdb")
   my_conn.Open "provider=microsoft.jet.oledb.4.0;data source="&dbpath
set rst = Server.CreateObject("ADODB.Recordset")

   gz=request.QueryString("t1")
      username=request.QueryString("t2")
response.expires=-1
response.charset="gb2312" 
   
 '调用date()和time()函数来获取客户留言的时间
 ltime=date()+time()
 
Sub aa(strSQL) 

				
				
			 rst.open strSQL, my_conn,1
			if rst.RecordCount=0 then
				 response.write("<ul>没有保存成功</ul>")
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
		 	    response.write("<li style='width:80px'>" & rst("username") & "</li>")
				response.write("<li style='width:40px'>" & rst("gz") & "</li>")
				response.Write("</ul>")
			   rst.MoveNext
					  next 
			     response.write("<ul style='display:none''") 
				response.write("<li style='width:60px;display:none'><a id='pre' href='examcontent.asp?r="&rid&"&t="&text&"&page=" & epage-1 & "'>上一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='next' href='/examcontent.asp?r="&rid&"&t="&text&"&page=" & epage+1 & "'>下一页</a></li>")
				response.write("<li style='width:60px;display:none'><a id='final' href='examcontent.asp?r="&rid&"&t="&text&"&page=" & rst.pagecount-1 & "'>最后一页</a></li>")
	
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;';  onclick='nextpage()'>��һҳ</li>")
'			response.write("<li style='width:80px;cursor:pointer;color:blue;float:right;'; onclick='finalpage()'>ĩҳ</li>")
'							response.write("<li id='pageinfo'  style='float:right;width:300px;'>�����ǵ�" & epage & "ҳ,һ����"&rst.pagecount&"ҳ,"&rst.RecordCount&"���¼</li>")
                response.Write("</ul>")
                response.Write("<table Align='center'>")
						response.write("<tr><td stlye='overflow:visible;width:500px'><a  onclick='prepage()' href='javascript:void(0)'>&lt; </a>"& epage &" of "&rst.pagecount&" pages<a onclick='nextpage()' href='javascript:void(0)'> &gt;</a>"&rst.RecordCount-1&" Records<a onclick='finalpage()' href='javascript:void(0)'>&gt;&gt;</a></td></tr>")
	
               response.Write("</table>")
			end if 
	
End sub 

StrSql = "INSERT INTO  Leaveword (Username,gz,dtime) Values ('"
 StrSql = StrSql & username & "', '"
 StrSql = StrSql & gz & "', '"
 StrSql = StrSql & ltime & "' ) "
 

 '调用Connection对象的Execute方法来执行INSERT INTO语句
my_conn.Execute StrSql
    
     if err <> 0 then
	  response.write("未保存成功") 
	 else 
	 response.write("保存成功")
	 strSQL = "Select * from Leaveword WHERE Username='" & username & "'  ORDER BY Username desc "
   aa(strSQL)
	 end if


 '断开数据库连接，关闭数据库，释放Connection对象变量 
 my_conn.Close
 set my_conn=nothing 
%>
