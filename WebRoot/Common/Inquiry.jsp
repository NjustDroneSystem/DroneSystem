<%@ page contentType="text/html; charset=gbk" language="java" import="com.droneSystem.hibernate.*,com.droneSystem.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="../css/systemPu.css" />
<link rel="stylesheet" type="text/css" href="../Inc/Style/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../Inc/Style/Style.css" />
<script type="text/javascript" src="../Inc/JScript/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../JScript/upload.js"></script>
<script type="text/javascript" src="../JScript/admin.js"></script>
<!-- <script type="text/javascript" src="../JScript/inquiry.js"></script> -->
<script type="text/javascript" src="../JScript/json2.js"></script>
<title>���ɹ����˻���Ŀ����ϵͳ-��ѯͳ��</title>
</head>
<body>
<script type="text/javascript" src="../Inc/JScript/echarts.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="../Inc/JScript/blue.js" charset="UTF-8"></script>

	<div class="head_area">
		<div class="fleft"><img src="../images/logo.png" /></div>
		<div class="head_left">
		<ul>
			<li><a href="Main.jsp">������Ϣ</a></li>
			<li><a href="Snow.jsp">ѩ����Ϣ</a></li>
			<li><a href="Sand.jsp">ɳ����Ϣ</a></li>
			<li><a href="javascript:void(0)" onclick="ale()">������Ϣ</a></li>
			<li><a href="Inquiry.jsp" class="pagenow">��ѯͳ��</a></li>
		</ul>
		</div>
		<div class="fright">
		 <a id="drop_down" href="javascript:void(0)" style="margin-right:29px">admin<img src="../images/down_sanjiao.png" /></a><a id="logout" href="javascript:void(0)" style="margin-left:0px" onclick="doLogout()"><img src="../images/lines10.png" />�˳�</a>
		 <div class="js_list001" id="drop_list">
			<p id="p1"><a href="#">�û��б�</a></p>
			<p id="p2"><a href="#">��ɫ�б�</a></p>
			<p id="p3"><a href="#">Ȩ���б�</a></p>
		</div> 
		</div>
	</div>
	<div class="myclear"></div>
	
	<p class="h128box"></p>
	
	<div class="fleft maparea" >
		<h5 class="title_sample" ><span>���˻���Ƶ�б�</span></h5>
		<table border="0" cellspacing="0" cellpadding="0" class="person_name">
		  <tr>
			<th align="center" width="10%" style="height:93px">��Ƶ���</th>
			<th align="center" width="15%">���˻����</th>
			<th align="center" width="25%">ʱ��</th>
			<th align="center" width="25%">��Ƶ�ļ���</th>
			<th align="center" width="15%">�㷨����</th>
			<th align="center" width="10%"></th>
		  </tr>
		</table>
		<div style=" height:1323px; background:#092E64">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="video_name"  id="videolist">
		
		</table>
		<p class="endpages" style="margin-bottom: 40px;margin-top: 40px;" id="video"></p>
		</div>
	</div>

	<div class="fleft trafficarea" id="trafficarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>��������ѯͳ�ƽ��</span></h5>
		<div id="trafficechart" style="width:3200px;height:1323px;"></div>
	</div>
	<div class="fleft snowarea" id="snowarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>ѩ���ѯͳ�ƽ��</span></h5>
		<div id="snowechart" style="width:3200px;height:1323px;"></div>
	</div>
	<div class="fleft sandarea" id="sandarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>ɳ���ѯͳ�ƽ��</span></h5>
		<div id="sandechart" style="width:3200px;height:1323px"></div>
	</div>
	<div class="fleft infraredarea" id="infraredarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>�����ѯͳ�ƽ��</span></h5>
		<div id="infraredechart" style="width:3200px;height:1323px"></div>
	</div>
	<div class="myclear"></div>	
	
	
	<!--����001-->
	<div class="userlist" id="userlist">
		<h5 class="title_sample"><span>�û��б�</span><a id="userlist_close" href="#" ><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href='javascript:$("#new_user").css("display","block");'><img src="../images/addperson.png" /></a></div>
		<div class="fright sousuort"><input type="text" /><button><img src="../images/searchicon.png" /></button></div>
		<div class="myclear"></div> 
		<table id="usertable" width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		</table>
		<p class="endpages" id="user"></p>
	</div> 
	<div id="new_user" style="position:absolute; z-index:101; left:2750px; top:500px; width:1250px; height:900px;display:none; background:url(../images/personbg.png) repeat-x top">
		<h5 class="title_sample"><span>����û�</span><a id="userlist_close" href="#" ><img src="../images/cross.png" /></a></h5>
		<form id="new_user_form" style="padding:10px 20px 10px 40px;margin-left:50px;margin-top:30px" method="post">
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </td><td><input type="text" name="Name" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;�� : </td><td><input type="text" name="userName" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>��&nbsp;��&nbsp;��&nbsp;�� : </td>
				<td>
					<select id="department" class="easyui-validatebox" name="DepartmentId" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="1">����</option>
						<option value="2">�շ���</option>
						<option value="3">ҵ������</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </td>
				<td>
					<select class="easyui-validatebox" name="Gender" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="0">��</option>
						<option value="1">Ů</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </td><td><input type="text" name="Password" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<div style="padding:5px;text-align:center;margin-top:30px">
				<button id="new_submit_btn" class="easyui-linkbutton" icon="icon-ok" style="width:150px;height:60px;margin-right:20px" onclick="saveUser(this)">ȷ��</button>
				<button class="easyui-linkbutton" icon="icon-cancel" style="width:150px;height:60px" onclick='$("#new_user").css("display","none");'>ȡ��</button>
			</div>
		</form>
	</div>
	<div id="modify_user" style="position:absolute; z-index:101; left:2750px; top:500px; width:1250px; height:900px;display:none; background:url(../images/personbg.png) repeat-x top">
		<h5 class="title_sample"><span>�޸��û�</span><a id="userlist_close" href="#" ><img src="../images/cross.png" /></a></h5>
		<form id="modify_user_form" style="padding:10px 20px 10px 40px;margin-left:50px;margin-top:30px" method="post">
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </td><td><input type="text" name="Name" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>��&nbsp;��&nbsp;��&nbsp;�� : </td>
				<td>
					<select id="department" class="easyui-validatebox" name="DepartmentId" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="1">����</option>
						<option value="2">�շ���</option>
						<option value="3">ҵ������</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </td>
				<td>
					<select class="easyui-validatebox" name="Gender" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="0">��</option>
						<option value="1">Ů</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </td><td><input type="text" name="Password" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr><td><input style='display:none;' name='Id' class='easyui-validatebox' value='-1'></input></td></tr>
			<div style="padding:5px;text-align:center;margin-top:30px">
				<button id="modify_submit_btn" class="easyui-linkbutton" icon="icon-ok" style="width:150px;height:60px;margin-right:20px" onclick="modifyUser()">ȷ��</button>
				<button class="easyui-linkbutton" icon="icon-cancel" style="width:150px;height:60px" onclick='$("#modify_user").css("display","none");'>ȡ��</button>
			</div>
		</form>
	</div>
	<!--����001����-->
	<div class="userlist" id="rolelist">
		<h5 class="title_sample"><span>��ɫ�б�</span><a href="#"><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href="#"><img src="../images/addperson.png" /></a><a href="#"><img src="../images/delectperson.png" /></a></div>
		<div class="myclear"></div>
		<!-------����Ȩ��������������������û�취ȷ���Ŷ�����Ŀ�������Լ�����-------->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		  <tr>
			<th scope="col" width="140">&nbsp;</th>
			<th scope="col">ID</th>
			<th scope="col">��ɫ����</th>
			<th scope="col">����Ȩ��</th>
			<th scope="col" width="30%">����Ȩ��</th>
			<th scope="col">����ʱ��</th>
			<th scope="col">����ѡ��</th>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������桢���͡���ԭ�������Ա����ӽ�ɫ�����Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������桢���͡���ԭ�������Ա����ӽ�ɫ�����Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������桢���͡���ԭ�������Ա����ӽ�ɫ�����Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������桢���͡���ԭ�������Ա����ӽ�ɫ�����Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������桢���͡���ԭ�������Ա����ӽ�ɫ�����Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������桢���͡���ԭ�������Ա����ӽ�ɫ�����Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ�������Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>��������Ա</td>
			<td>�鿴����ҳ��</td>
			<td>�༭��������Ԥ����ɾ�������Ȩ��</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		 </table>
		<p class="endpages"><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">...</a><a href="#">49</a><a href="#">��һҳ</a><span>����<input type="text" />ҳ<button>ȷ��</button></span></p>
	</div>
	<!--����002����-->
	<!--����003-->
	<div class="userlist" id="privilegelist">
		<h5 class="title_sample"><span>Ȩ���б�</span><a href="#"><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href="#"><img src="../images/addperson.png" /></a><a href="#"><img src="../images/delectperson.png" /></a></div>
		<div class="fright sousuort"><input type="text" /><button><img src="../images/searchicon.png" /></button></div>
		<div class="myclear"></div>
		<!-------����Ȩ��������������������û�취ȷ���Ŷ�����Ŀ�������Լ�����-------->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		  <tr>
			<th scope="col" width="140">&nbsp;</th>
			<th scope="col">ID</th>
			<th scope="col">Ȩ������</th>
			<th scope="col">����</th>
			<th scope="col" width="30%">Ȩ������</th>
			<th scope="col">����ʱ��</th>
			<th scope="col">����ѡ��</th>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>�鿴����</td>
			<td>����Ȩ��</td>
			<td>Ȩ������������Ȩ��������Ȩ������������Ȩ������������Ȩ������������Ȩ������������</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>�鿴����</td>
			<td>����Ȩ��</td>
			<td>Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>�鿴����</td>
			<td>����Ȩ��</td>
			<td>Ȩ������������Ȩ������Ȩ������������Ȩ������������Ȩ������������Ȩ������������</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>�鿴����</td>
			<td>����Ȩ��</td>
			<td>Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>�鿴����</td>
			<td>����Ȩ��</td>
			<td>Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������Ȩ������������</td>
			<td>2017-08-19</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		 </table>
		<p class="endpages"><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">...</a><a href="#">49</a><a href="#">��һҳ</a><span>����<input type="text" />ҳ<button>ȷ��</button></span></p>
	</div>
	<!--����003����-->
</body>
</html>	

<script type="text/javascript">
	function totable3(data){
		data = data.rows;
		$.each(data,function (index,item) {    
			//alert(index+item.userName);
			var tr;  				
			tr = "<td><input type='checkbox' /></td>"; 	
			tr += "<td>" + item.Id + "</td>";   
			tr += "<td>" + item.userName + "</td>";  
			tr += "<td>" + item.Name + "</td>";       
			tr += "<td>" + item.JobTitle + "</td>"; 
			tr += "<td>" + item.Education  + "</td>";     
			tr += "<td>" + item.Status + "</td>";    
			tr += "<td>" + item.CancelDate + "</td>";     					
			tr += "<td><a href='#'>�༭</a><a href='#'>ɾ��</a></td>";   
			  										
			$("#usertable").append("<tr>"+tr+"</tr>");			
									
		});
	    
	}

	
	user();
	function user(){
		$.ajax({
			type: "post", 
			cache: false, 
			dataType: 'json',
			url: '/droneSystem/UserServlet.do?method=0',
			data:{},
			success: function(data){
//				totable1(data);
//				totable2(data);
				totable3(data);
				//totable4(data);
		
			}
		}); 	
	    
	}

	

    
	function changePage(page){
	    if(page < 1 || page > totalPage){
			return;
		}
		currentPage = page;
		var queryJson = {};
		queryJson.page = page;
		queryJson.rows = 10;
		$.ajax({
			type: "post", 
			cache: false, 
			dataType: 'json',
			url: '/droneSystem/VideoServlet.do?method=0',
			data:queryJson,
			//data:{video.page:page},
			success: function(data){
			console.log(queryJson);
			console.log(data);
			        initPage(data.total);
				    showVideo(data); 			
			}
		}); 	
	    
	}
	changePage(1);
	//ȫ�ֱ���
	var currentPage; //��ǰҳ��
	var totalPage; //��ҳ����
	var isInit = false; //�Ƿ��ʼ��ҳ�����ؼ��ı�ʶλ
	/* *
	 * @brief ����ҳҪ���ѯ�û�
	 * @params data ��Ų�ѯ�����û�������û�����json 
	 * @return null
	 * */
	function showVideo(data){
	  $("#videolist").empty();
	  data = data.videos;
	  $.each(data,function (index,item) {    
			var tr="";  				
			tr += "<td width='10%' class='video_id'>" + item.id + "</td>";   
			tr += "<td width='15%'>" + item.droneCode + "</td>";  
			tr += "<td width='25%'>" + item.time + "</td>"; 
			tr += "<td width='25%'>" + item.video + "</td>";       
			tr += "<td width='15%' class='video_type'>" + item.type  + "</td>";				
			tr += "<td width='10%'><a id='trafficbutton' href='#' onclick='showCharts(this)'>�鿴</a></td>";   
			  										
			$("#videolist").append("<tr>"+tr+"</tr>");			
									
		});
	}
	
	function showCharts(element){
		  var videoId = $(element).parent().parent().find(".video_id").text();
		  var videoType = $(element).parent().parent().find(".video_type").text();
          var url = '/droneSystem/VideoServlet.do?method=1';
		  var paramData={id:videoId};
		  $.ajax({
		      url: url,
		      type: "post",
		      data: paramData,
		      dataType: 'json',
		      cache: false,
		      error:function(){
		          console.log("get redis error!!!");
		      },
		      success: function(data){ 
		      if(videoType==3){
		       	        
		         var xdata = [];
		         var ydata1 = [];
		         var ydata2 = [];
			     for(var i =0 ;i < data.carNums.length;i++){
			            xdata[i] = data.carNums[i].time;
			            ydata1[i] = data.carNums[i].valueLeft;
			            ydata2[i] = data.carNums[i].valueRight;
			     } 
			     console.log(xdata);
		         aFun(xdata,ydata1,ydata2);
		        $('.trafficarea').show();
                $('.sandarea').hide();			
		        $('.snowarea').hide();			
		        $('.infraredarea').hide();
				}
				else if(videoType==2){
		       	        
		         var xdata = [];
		         var ydata1 = [];		         
			     for(var i =0 ;i < data.carNums.length;i++){
			            xdata[i] = data.carNums[i].time;
			            ydata1[i] = data.carNums[i].valueLeft;
			     } 
		         cFun(xdata,ydata1);
		        $('.trafficarea').hide();
                $('.sandarea').show();			
		        $('.snowarea').hide();			
		        $('.infraredarea').hide();
				}
				else if(videoType==1){
		       	        
		         var xdata = [];
		         var ydata1 = [];		         
			     for(var i =0 ;i < data.carNums.length;i++){
			            xdata[i] = data.carNums[i].time;
			            ydata1[i] = data.carNums[i].valueLeft;
			     }
			     bFun(xdata,ydata1);
			    $('.trafficarea').hide();
                $('.sandarea').hide();			
		        $('.snowarea').show();			
		        $('.infraredarea').hide();	
		         
				}
				else if(videoType==4){
		       	        
		         var xdata = [];
		         var ydata1 = [];		         
			     for(var i =0 ;i < data.carNums.length;i++){
			            xdata[i] = data.carNums[i].time;
			            ydata1[i] = data.carNums[i].valueLeft;
			     } 
			      dFun(xdata,ydata1);
			    $('.trafficarea').hide();
                $('.sandarea').hide();			
		        $('.snowarea').hide();			
		        $('.infraredarea').show();
		        
				}
				else{
				 alert("δ�ܲ�ѯ������Ƶ��Ϣ!");
				}
				}
				});		      						      
   }
   	
	/* *
	 * @brief ��ʼ��ҳ��ؼ�
	 * @params  totalCntOfUser �û���������
	 * @return null
	 * */
	function initPage(totalCntOfVideo){
		//�ж��Ƿ��ʼ����ҳ���ؼ�
		if(isInit){
			return;
		}
		isInit = true;
		
		totalPage = Math.ceil(totalCntOfVideo / 10);
		var aLabel = '';
		if (totalPage >= 3) {
			aLabel += '<a class="change_page" href="#">��һҳ</a>'
			aLabel += '<a class="change_page" href="#">1</a>';
			aLabel += '<a href="#">...</a>';
			aLabel += '<a class="change_page" href="#">'+totalPage+'</a>';
			aLabel += '<a class="change_page" href="#">��һҳ</a><span>����<input id="switch_page" type="text" />ҳ<button id="confirm_page">ȷ��</button></span>'
			$("#video").append(aLabel);
		} else {
			aLabel += '<a class="change_page" href="#">��һҳ</a>'
			for(var i = 1; i <= totalPage; i++){
				aLabel += '<a class="change_page" href="#">'+i+'</a>';
			}
			aLabel += '<a class="change_page" href="#">��һҳ</a><span>����<input id="switch_page" type="text" />ҳ<button id="confirm_page">ȷ��</button></span>'
			$("#video").append(aLabel);
		}
		$(".change_page").click(function(){
			var temp = $(this).text();
			//$(this).css("color","#4FCD74");
			if(temp == "��һҳ" && currentPage > 1){
				currentPage--;
			} else if(temp == "��һҳ" && currentPage < totalPage){
				currentPage++;
			} else if(temp != "��һҳ" && temp != "��һҳ"){
				currentPage = temp;
			}
			changePage(currentPage);
		});
		$("#confirm_page").click(function(){
			var switchPage = $("#switch_page").val();
			currentPage = switchPage;
			changePage(switchPage);
		});
	}
   
   var aChart = echarts.init(document.getElementById("trafficechart"),'blue');

    function aFun(x_data, y_data1, y_data2) {

        aChart.setOption({
        			title : {
        			    text: '',
        			    textstyle:{
        			    	"fontSize":"40",
        		            "fontWeight": "bolder"
        		         },
        			},
        			grid:{
        			     top:'10%',
        			     left:'10%',
        			     right:'10%'
        			},
        			tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'cross',
				            label: {
			                    fontSize:'30'
				        }
				        },
				        textStyle: {
		               /*  color: '#000', */
		                fontSize:'30'
		            },	
				    },
        		    legend: {
        		        data:['���г������仯ͳ��', '���г������仯ͳ��'],
        		        textStyle: {  
        		            color: '#fff',          //legend������ɫ 
        		            fontSize:'40'

        		        }
        		    },
        		    toolbox: {
        		        show : true,
        		        feature : {
        		            dataView : {show: true, readOnly: false, iconStyle:{borderWidth:1}},
        		           // magicType : {show: true,  type:['line', 'bar']},
        		            restore : {show: true},
        		            saveAsImage : {show: true}
        		        },
        		        right:'10%',
        	            itemSize:'32',
        	            emphasis:{//����ʱ
        	                iconStyle:{
        	                    borderColor:"white"//ͼ�ε������ɫ
        	                }
        	            }

        		    },
        		    dataZoom : {
        		        show : true,
        		        start : 0,
        		        end : 25
        		    },
        		    xAxis : [
        		        {
        		            type : 'category',
        		            axisLabel: {        
        		                show: true,
        		                textStyle: {
        		                    color: '#fff',
        		                    fontSize:'30'
        		                }
        		            },
        		            axisPointer: {
			                    type: 'shadow',
			                    label:{
			                    backgroundColor:'#CDCDCD',
			                    color:'#3F48CC'
			                    }
			                },
        		        // �����������Ƿ���ʾ
        			        splitLine: {
        			                show: false, 
        			                //  �ı�������ɫ
        			                lineStyle: {
        			                    // ʹ����ǳ�ļ��ɫ
        			                    color: ['white']
        			                }                            
        			        },
        		            axisLine:{
        		                lineStyle:{
        		                    color:'#FFFFFF',
        		                    width:2
        		                }
        		            },       		           
        		            boundaryGap : true,
        		            data:x_data
        		        }
        		   ],
        		   yAxis : [
        		      {
        		           type : 'value',
        		           scale: true,
        		           name : '������V/h',
        		           nameTextStyle:{
        		                fontSize:30
        		           },
        		           axisLabel: {        
        		                show: true,
        		                textStyle: {
        		                    color: '#fff',
        		                    fontSize:'30'
        		                }
        		            },
        		            axisPointer: {
			                    type: 'line',
			                    label:{
			                    backgroundColor:'#CDCDCD',
			                    color:'#3F48CC'
			                    }
			                },
        		        // �����������Ƿ���ʾ
        			        splitLine: {
        			                show: false, 
        			                //  �ı�������ɫ
        			                lineStyle: {
        			                    // ʹ����ǳ�ļ��ɫ
        			                    color: ['white']
        			                }                            
        			        },
        			        max: 20,
                   			min: 0,
        		           boundaryGap: [0.2, 0.2],
        		           
        		      },
        		      {
        		           type : 'value',
        		           scale: true,
        		           name : '������V/h',
        		           nameTextStyle:{
        		                fontSize:30
        		           },
        		           axisLabel: {        
        		                show: true,
        		                textStyle: {
        		                    color: '#fff',
        		                    fontSize:'30'
        		                }
        		            },
        		            axisPointer: {
			                    type: 'line',
			                    label:{
			                    backgroundColor:'#CDCDCD',
			                    color:'#3F48CC'
			                    }
			                },
        		        // �����������Ƿ���ʾ
        			        splitLine: {
        			                show: false, 
        			                //  �ı�������ɫ
        			                lineStyle: {
        			                    // ʹ����ǳ�ļ��ɫ
        			                    color: ['white']
        			                }                            
        			        },
        			        max: 20,
                   			min: 0,
        		           boundaryGap: [0.2, 0.2],
        		           
        		      }
        		  ],
        		  series : [
        		       {
        		            name:"���г������仯ͳ��",
        		            type:'bar',
        		            //stack:'one',
        		            data:y_data1,
        		            markPoint : {
        			                data : [
        			                    {type : 'max', name: '���ֵ'},
        			                    {type : 'min', name: '��Сֵ'}
        			                ]
        			            },
        			            markLine : {
        			                data : [
        			                    {type : 'average', name: 'ƽ��ֵ'}
        			                ]
        			            }
        		            
        		       },
        		       {
        		            name:"���г������仯ͳ��",
        		            type:'line',
        		           // stack:'one',
        		            
        		            data:y_data2, 
        		            markPoint : {
        			                data : [
        			                    {type : 'max', name: '���ֵ'},
        			                    {type : 'min', name: '��Сֵ'}
        			                ]
        			            },
        			            markLine : {
        			                data : [
        			                    {type : 'average', name: 'ƽ��ֵ'}
        			                ]
        			            }
        		            
        		       },
        		       
        		  ]
        });

    }
    
  var bChart = echarts.init(document.getElementById("snowechart"),'blue');

    function bFun(x_data, y_data) {

        bChart.setOption({

        	title : {
			    text: '',
			    textstyle:{
			    	"fontSize":"40",
		            "fontWeight": "bolder"
		    },
			},
			grid:{
      			     top:'10%',
      			     left:'10%',
      			     right:'10%'
      			},
			tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'cross',
				            label: {
			                    fontSize:'30'
				        }
				        },
				        textStyle: {
		               /*  color: '#000', */
		                fontSize:'30'
		            },	
				    },
		    legend: {
		        data:['ѩ����'],
		        textStyle: {  
		            color: '#fff',          //legend������ɫ 
		            fontSize:'40'

		        }
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		           // magicType : {show: true,  type:['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        },
		        right:'10%',
	            itemSize:'32',
	            emphasis:{//����ʱ
	                iconStyle:{
	                    borderColor:"white"//ͼ�ε������ɫ
	                }
	            }

		    },
		    dataZoom : {
		        show : false,
		        start : 0,
		        end : 25
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'30'
		                }
		            },
		            axisPointer: {
	                    type: 'shadow',
	                    label:{
	                    backgroundColor:'#CDCDCD',
	                    color:'#3F48CC'
	                    }
	                },
		        // �����������Ƿ���ʾ
			        splitLine: {
			                show: false, 
			                //  �ı�������ɫ
			                lineStyle: {
			                    // ʹ����ǳ�ļ��ɫ
			                    color: ['white']
			                }                            
			        },
		            axisLine:{
		                lineStyle:{
		                    color:'#FFFFFF',
		                    width:2
		                }
		            },		           
		            boundaryGap : true,
		            data:x_data
		        }
		   ],
		   yAxis : [
		      {
		           type : 'value',
		           scale: true,
		           name : 'ѩ����M',
		           nameTextStyle:{
        		                fontSize:30
        		           },
		           axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'30'
		                }
		            },
		            axisPointer: {
			                    type: 'line',
			                    label:{
			                    backgroundColor:'#CDCDCD',
			                    color:'#3F48CC'
			                    }
			                },
		        // �����������Ƿ���ʾ
			        splitLine: {
			                show: false, 
			                //  �ı�������ɫ
			                lineStyle: {
			                    // ʹ����ǳ�ļ��ɫ
			                    color: ['white']
			                }                            
			        },
			        max: 1200,
           			min: 0,
		           boundaryGap: [0.2, 0.2],
		           
		      }
		  ],
		  series : [
		       {
		            name:"ѩ����",
		            type:'bar',
		            //stack:'one',
		            data:y_data,
		            markPoint : {
			                data : [
			                    {type : 'max', name: '���ֵ'},
			                    {type : 'min', name: '��Сֵ'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: 'ƽ��ֵ'}
			                ]
			            }		            
		       }		       
		  ]
        }, true);

    }

 var cChart = echarts.init(document.getElementById("sandechart"),'blue');

    function cFun(x_data, y_data) {

        cChart.setOption({

        	title : {
			    text: '',
			    textstyle:{
			    	"fontSize":"40",
		            "fontWeight": "bolder"
		    },
			},
			grid:{
     			     top:'10%',
     			     left:'10%',
     			     right:'10%'
        			},
			tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'cross',
				            label: {
			                    fontSize:'30'
				        }
				        },
				        textStyle: {
		               /*  color: '#000', */
		                fontSize:'30'
		            },	
				    },
		    legend: {
		        data:['ɳ����'],
		        textStyle: {  
		            color: '#fff',          //legend������ɫ 
		            fontSize:'40'

		        }
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		           // magicType : {show: true,  type:['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        },
		        right:'10%',
	            itemSize:'32',
	            emphasis:{//����ʱ
	                iconStyle:{
	                    borderColor:"white"//ͼ�ε������ɫ
	                }
	            }

		    },
		    dataZoom : {
		        show : false,
		        start : 0,
		        end : 25
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'30'
		                }
		            },
		            axisPointer: {
	                    type: 'shadow',
	                    label:{
	                    backgroundColor:'#CDCDCD',
	                    color:'#3F48CC'
	                    }
	                },
		        // �����������Ƿ���ʾ
			        splitLine: {
			                show: false, 
			                //  �ı�������ɫ
			                lineStyle: {
			                    // ʹ����ǳ�ļ��ɫ
			                    color: ['white']
			                }                            
			        },
		            axisLine:{
		                lineStyle:{
		                    color:'#FFFFFF',
		                    width:2
		                }
		            },		           
		            boundaryGap : true,
		            data:x_data
		        }
		   ],
		   yAxis : [
		      {
		           type : 'value',
		           scale: true,
		           name : 'ɳ����M^2',
		           nameTextStyle:{
        		                fontSize:30
        		           },
		           axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'30'
		                }
		            },
		            axisPointer: {
	                    type: 'line',
	                    label:{
	                    backgroundColor:'#CDCDCD',
	                    color:'#3F48CC'
	                    }
	                },
		        // �����������Ƿ���ʾ
			        splitLine: {
			                show: false, 
			                //  �ı�������ɫ
			                lineStyle: {
			                    // ʹ����ǳ�ļ��ɫ
			                    color: ['white']
			                }                            
			        },
			        max: 1200,
           			min: 0,
		           boundaryGap: [0.2, 0.2],
		           
		      }
		  ],
		  series : [
		       {
		            name:"ɳ����",
		            type:'bar',
		            //stack:'one',
		            data:y_data,
		            markPoint : {
			                data : [
			                    {type : 'max', name: '���ֵ'},
			                    {type : 'min', name: '��Сֵ'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: 'ƽ��ֵ'}
			                ]
			            }		            
		       }		       
		  ]

        }, true);

    }
    
    var dChart = echarts.init(document.getElementById('infraredechart'),'blue');

    // ָ��ͼ��������������

    function dFun(x_data,y_data) {

        dChart.setOption({
        	title : {
			    text: '',
			    textstyle:{
			    	"fontSize":"40",
		            "fontWeight": "bolder"
		    },
			},
			grid:{
      			     top:'10%',
      			     left:'10%',
      			     right:'10%'
        			},
			tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'cross',
				            label: {
			                    fontSize:'30'
				        }
				        },
				        textStyle: {
		               /*  color: '#000', */
		                fontSize:'30'
		            },	
				    },
		    legend: {
		        data:['ɳ����'],
		        textStyle: {  
		            color: '#fff',          //legend������ɫ 
		            fontSize:'40'

		        }
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		           // magicType : {show: true,  type:['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        },
		        right:'10%',
	            itemSize:'32',
	            emphasis:{//����ʱ
	                iconStyle:{
	                    borderColor:"white"//ͼ�ε������ɫ
	                }
	            }

		    },
		    dataZoom : {
		        show : false,
		        start : 0,
		        end : 25
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'30'
		                }
		            },
		            axisPointer: {
	                    type: 'shadow',
	                    label:{
	                    backgroundColor:'#CDCDCD',
	                    color:'#3F48CC'
	                    }
	                },
		        // �����������Ƿ���ʾ
			        splitLine: {
			                show: false, 
			                //  �ı�������ɫ
			                lineStyle: {
			                    // ʹ����ǳ�ļ��ɫ
			                    color: ['white']
			                }                            
			        },
		            axisLine:{
		                lineStyle:{
		                    color:'#FFFFFF',
		                    width:2
		                }
		            },		           
		            boundaryGap : true,
		            data:x_data
		        }
		   ],
		   yAxis : [
		      {
		           type : 'value',
		           scale: true,
		           name : 'ɳ����M^2',
		            nameTextStyle:{
        		                fontSize:30
        		           },
		           axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'30'
		                }
		            },
		            axisPointer: {
			                    type: 'shadow',
			                    label:{
			                    backgroundColor:'#CDCDCD',
			                    color:'#3F48CC'
			                    }
			                },
		        // �����������Ƿ���ʾ
			        splitLine: {
			                show: false, 
			                //  �ı�������ɫ
			                lineStyle: {
			                    // ʹ����ǳ�ļ��ɫ
			                    color: ['white']
			                }                            
			        },
			        max: 1200,
           			min: 0,
		            boundaryGap: [0.2, 0.2],
		           
		      }
		  ],
		  series : [
		       {
		            name:"ɳ����",
		            type:'bar',
		            //stack:'one',
		            data:y_data,
		            markPoint : {
			                data : [
			                    {type : 'max', name: '���ֵ'},
			                    {type : 'min', name: '��Сֵ'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: 'ƽ��ֵ'}
			                ]
			            }		            
		       }		       
		  ]
            });

    }
    
	
   
</script>

