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
	 end if


 '断开数据库连接，关闭数据库，释放Connection对象变量 
 my_conn.Close
 set my_conn=nothing 
%>
