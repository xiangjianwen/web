<%
   set my_conn=Server.CreateObject("ADODB.Connection")
    DBPath = Server.MapPath("db/db.mdb")
   my_conn.Open "provider=microsoft.jet.oledb.4.0;data source="&dbpath
set rst = Server.CreateObject("ADODB.Recordset")

   gz=request.QueryString("t1")
      username=request.QueryString("t2")
response.expires=-1
response.charset="gb2312" 
   
 '����date()��time()��������ȡ�ͻ����Ե�ʱ��
 ltime=date()+time()
 


StrSql = "INSERT INTO  Leaveword (Username,gz,dtime) Values ('"
 StrSql = StrSql & username & "', '"
 StrSql = StrSql & gz & "', '"
 StrSql = StrSql & ltime & "' ) "
 

 '����Connection�����Execute������ִ��INSERT INTO���
my_conn.Execute StrSql
    
     if err <> 0 then
	  response.write("δ����ɹ�") 
	 else 
	 response.write("����ɹ�")
	 end if


 '�Ͽ����ݿ����ӣ��ر����ݿ⣬�ͷ�Connection������� 
 my_conn.Close
 set my_conn=nothing 
%>
