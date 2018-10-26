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
<title>内蒙古无人机项目管理系统-查询统计</title>
</head>
<body>
<script type="text/javascript" src="../Inc/JScript/echarts.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="../Inc/JScript/blue.js" charset="UTF-8"></script>

	<div class="head_area">
		<div class="fleft"><img src="../images/logo.png" /></div>
		<div class="head_left">
		<ul>
			<li><a href="Main.jsp">流量信息</a></li>
			<li><a href="Snow.jsp">雪阻信息</a></li>
			<li><a href="Sand.jsp">沙阻信息</a></li>
			<li><a href="javascript:void(0)" onclick="ale()">红外信息</a></li>
			<li><a href="Inquiry.jsp" class="pagenow">查询统计</a></li>
		</ul>
		</div>
		<div class="fright">
		 <a id="drop_down" href="javascript:void(0)" style="margin-right:29px">admin<img src="../images/down_sanjiao.png" /></a><a id="logout" href="javascript:void(0)" style="margin-left:0px" onclick="doLogout()"><img src="../images/lines10.png" />退出</a>
		 <div class="js_list001" id="drop_list">
			<p id="p1"><a href="#">用户列表</a></p>
			<p id="p2"><a href="#">角色列表</a></p>
			<p id="p3"><a href="#">权限列表</a></p>
		</div> 
		</div>
	</div>
	<div class="myclear"></div>
	
	<p class="h128box"></p>
	
	<div class="fleft maparea" >
		<h5 class="title_sample" ><span>无人机视频列表</span></h5>
		<table border="0" cellspacing="0" cellpadding="0" class="person_name">
		  <tr>
			<th align="center" width="10%" style="height:93px">视频编号</th>
			<th align="center" width="15%">无人机编号</th>
			<th align="center" width="25%">时间</th>
			<th align="center" width="25%">视频文件名</th>
			<th align="center" width="15%">算法类型</th>
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
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>车流量查询统计结果</span></h5>
		<div id="trafficechart" style="width:3200px;height:1323px;"></div>
	</div>
	<div class="fleft snowarea" id="snowarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>雪阻查询统计结果</span></h5>
		<div id="snowechart" style="width:3200px;height:1323px;"></div>
	</div>
	<div class="fleft sandarea" id="sandarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>沙阻查询统计结果</span></h5>
		<div id="sandechart" style="width:3200px;height:1323px"></div>
	</div>
	<div class="fleft infraredarea" id="infraredarea">
		<h5 class="title_sample" style="width:3200px;background:#0B3F7D"><span>红外查询统计结果</span></h5>
		<div id="infraredechart" style="width:3200px;height:1323px"></div>
	</div>
	<div class="myclear"></div>	
	
	
	<!--弹框001-->
	<div class="userlist" id="userlist">
		<h5 class="title_sample"><span>用户列表</span><a id="userlist_close" href="#" ><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href='javascript:$("#new_user").css("display","block");'><img src="../images/addperson.png" /></a></div>
		<div class="fright sousuort"><input type="text" /><button><img src="../images/searchicon.png" /></button></div>
		<div class="myclear"></div> 
		<table id="usertable" width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		</table>
		<p class="endpages" id="user"></p>
	</div> 
	<div id="new_user" style="position:absolute; z-index:101; left:2750px; top:500px; width:1250px; height:900px;display:none; background:url(../images/personbg.png) repeat-x top">
		<h5 class="title_sample"><span>添加用户</span><a id="userlist_close" href="#" ><img src="../images/cross.png" /></a></h5>
		<form id="new_user_form" style="padding:10px 20px 10px 40px;margin-left:50px;margin-top:30px" method="post">
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 : </td><td><input type="text" name="Name" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名 : </td><td><input type="text" name="userName" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>所&nbsp;属&nbsp;部&nbsp;门 : </td>
				<td>
					<select id="department" class="easyui-validatebox" name="DepartmentId" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="1">财务部</option>
						<option value="2">收发室</option>
						<option value="3">业务管理科</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别 : </td>
				<td>
					<select class="easyui-validatebox" name="Gender" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="0">男</option>
						<option value="1">女</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码 : </td><td><input type="text" name="Password" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<div style="padding:5px;text-align:center;margin-top:30px">
				<button id="new_submit_btn" class="easyui-linkbutton" icon="icon-ok" style="width:150px;height:60px;margin-right:20px" onclick="saveUser(this)">确认</button>
				<button class="easyui-linkbutton" icon="icon-cancel" style="width:150px;height:60px" onclick='$("#new_user").css("display","none");'>取消</button>
			</div>
		</form>
	</div>
	<div id="modify_user" style="position:absolute; z-index:101; left:2750px; top:500px; width:1250px; height:900px;display:none; background:url(../images/personbg.png) repeat-x top">
		<h5 class="title_sample"><span>修改用户</span><a id="userlist_close" href="#" ><img src="../images/cross.png" /></a></h5>
		<form id="modify_user_form" style="padding:10px 20px 10px 40px;margin-left:50px;margin-top:30px" method="post">
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 : </td><td><input type="text" name="Name" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>所&nbsp;属&nbsp;部&nbsp;门 : </td>
				<td>
					<select id="department" class="easyui-validatebox" name="DepartmentId" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="1">财务部</option>
						<option value="2">收发室</option>
						<option value="3">业务管理科</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别 : </td>
				<td>
					<select class="easyui-validatebox" name="Gender" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="0">男</option>
						<option value="1">女</option>
					</select>
				</td>
			</tr>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码 : </td><td><input type="text" name="Password" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr>
			<tr><td><input style='display:none;' name='Id' class='easyui-validatebox' value='-1'></input></td></tr>
			<div style="padding:5px;text-align:center;margin-top:30px">
				<button id="modify_submit_btn" class="easyui-linkbutton" icon="icon-ok" style="width:150px;height:60px;margin-right:20px" onclick="modifyUser()">确认</button>
				<button class="easyui-linkbutton" icon="icon-cancel" style="width:150px;height:60px" onclick='$("#modify_user").css("display","none");'>取消</button>
			</div>
		</form>
	</div>
	<!--弹框001结束-->
	<div class="userlist" id="rolelist">
		<h5 class="title_sample"><span>角色列表</span><a href="#"><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href="#"><img src="../images/addperson.png" /></a><a href="#"><img src="../images/delectperson.png" /></a></div>
		<div class="myclear"></div>
		<!-------由于权限描述字数不定，所以没办法确定放多少条目，开发自己斟酌-------->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		  <tr>
			<th scope="col" width="140">&nbsp;</th>
			<th scope="col">ID</th>
			<th scope="col">角色名称</th>
			<th scope="col">基本权限</th>
			<th scope="col" width="30%">操作权限</th>
			<th scope="col">创建时间</th>
			<th scope="col">操作选择</th>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、保存、推送、还原、添加人员、添加角色、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、保存、推送、还原、添加人员、添加角色、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、保存、推送、还原、添加人员、添加角色、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、保存、推送、还原、添加人员、添加角色、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、保存、推送、还原、添加人员、添加角色、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、保存、推送、还原、添加人员、添加角色、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>超级管理员</td>
			<td>查看所有页面</td>
			<td>编辑、发布、预览、删除、添加权限</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		 </table>
		<p class="endpages"><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">...</a><a href="#">49</a><a href="#">下一页</a><span>到第<input type="text" />页<button>确定</button></span></p>
	</div>
	<!--弹框002结束-->
	<!--弹框003-->
	<div class="userlist" id="privilegelist">
		<h5 class="title_sample"><span>权限列表</span><a href="#"><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href="#"><img src="../images/addperson.png" /></a><a href="#"><img src="../images/delectperson.png" /></a></div>
		<div class="fright sousuort"><input type="text" /><button><img src="../images/searchicon.png" /></button></div>
		<div class="myclear"></div>
		<!-------由于权限描述字数不定，所以没办法确定放多少条目，开发自己斟酌-------->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		  <tr>
			<th scope="col" width="140">&nbsp;</th>
			<th scope="col">ID</th>
			<th scope="col">权限名称</th>
			<th scope="col">性质</th>
			<th scope="col" width="30%">权限描述</th>
			<th scope="col">创建时间</th>
			<th scope="col">操作选择</th>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>查看数据</td>
			<td>基本权限</td>
			<td>权限描述性文字权限描述性权限描述性文字权限描述性文字权限描述性文字权限描述性文字</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>查看数据</td>
			<td>基本权限</td>
			<td>权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>查看数据</td>
			<td>基本权限</td>
			<td>权限描述性文字权限文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>查看数据</td>
			<td>基本权限</td>
			<td>权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>查看数据</td>
			<td>基本权限</td>
			<td>权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字权限描述性文字</td>
			<td>2017-08-19</td>
			<td><a href="#">编辑</a><a href="#">删除</a></td>
		  </tr>
		 </table>
		<p class="endpages"><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">...</a><a href="#">49</a><a href="#">下一页</a><span>到第<input type="text" />页<button>确定</button></span></p>
	</div>
	<!--弹框003结束-->
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
			tr += "<td><a href='#'>编辑</a><a href='#'>删除</a></td>";   
			  										
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
	//全局变量
	var currentPage; //当前页面
	var totalPage; //总页面数
	var isInit = false; //是否初始化页面栏控件的标识位
	/* *
	 * @brief 按分页要求查询用户
	 * @params data 存放查询到的用户对象和用户数的json 
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
			tr += "<td width='10%'><a id='trafficbutton' href='#' onclick='showCharts(this)'>查看</a></td>";   
			  										
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
				 alert("未能查询到该视频信息!");
				}
				}
				});		      						      
   }
   	
	/* *
	 * @brief 初始化页面控件
	 * @params  totalCntOfUser 用户的总数量
	 * @return null
	 * */
	function initPage(totalCntOfVideo){
		//判断是否初始化过页数控件
		if(isInit){
			return;
		}
		isInit = true;
		
		totalPage = Math.ceil(totalCntOfVideo / 10);
		var aLabel = '';
		if (totalPage >= 3) {
			aLabel += '<a class="change_page" href="#">上一页</a>'
			aLabel += '<a class="change_page" href="#">1</a>';
			aLabel += '<a href="#">...</a>';
			aLabel += '<a class="change_page" href="#">'+totalPage+'</a>';
			aLabel += '<a class="change_page" href="#">下一页</a><span>到第<input id="switch_page" type="text" />页<button id="confirm_page">确定</button></span>'
			$("#video").append(aLabel);
		} else {
			aLabel += '<a class="change_page" href="#">上一页</a>'
			for(var i = 1; i <= totalPage; i++){
				aLabel += '<a class="change_page" href="#">'+i+'</a>';
			}
			aLabel += '<a class="change_page" href="#">下一页</a><span>到第<input id="switch_page" type="text" />页<button id="confirm_page">确定</button></span>'
			$("#video").append(aLabel);
		}
		$(".change_page").click(function(){
			var temp = $(this).text();
			//$(this).css("color","#4FCD74");
			if(temp == "上一页" && currentPage > 1){
				currentPage--;
			} else if(temp == "下一页" && currentPage < totalPage){
				currentPage++;
			} else if(temp != "上一页" && temp != "下一页"){
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
        		        data:['上行车流量变化统计', '下行车流量变化统计'],
        		        textStyle: {  
        		            color: '#fff',          //legend字体颜色 
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
        	            emphasis:{//触发时
        	                iconStyle:{
        	                    borderColor:"white"//图形的描边颜色
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
        		        // 控制网格线是否显示
        			        splitLine: {
        			                show: false, 
        			                //  改变轴线颜色
        			                lineStyle: {
        			                    // 使用深浅的间隔色
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
        		           name : '车流量V/h',
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
        		        // 控制网格线是否显示
        			        splitLine: {
        			                show: false, 
        			                //  改变轴线颜色
        			                lineStyle: {
        			                    // 使用深浅的间隔色
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
        		           name : '车流量V/h',
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
        		        // 控制网格线是否显示
        			        splitLine: {
        			                show: false, 
        			                //  改变轴线颜色
        			                lineStyle: {
        			                    // 使用深浅的间隔色
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
        		            name:"上行车流量变化统计",
        		            type:'bar',
        		            //stack:'one',
        		            data:y_data1,
        		            markPoint : {
        			                data : [
        			                    {type : 'max', name: '最大值'},
        			                    {type : 'min', name: '最小值'}
        			                ]
        			            },
        			            markLine : {
        			                data : [
        			                    {type : 'average', name: '平均值'}
        			                ]
        			            }
        		            
        		       },
        		       {
        		            name:"下行车流量变化统计",
        		            type:'line',
        		           // stack:'one',
        		            
        		            data:y_data2, 
        		            markPoint : {
        			                data : [
        			                    {type : 'max', name: '最大值'},
        			                    {type : 'min', name: '最小值'}
        			                ]
        			            },
        			            markLine : {
        			                data : [
        			                    {type : 'average', name: '平均值'}
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
		        data:['雪阻量'],
		        textStyle: {  
		            color: '#fff',          //legend字体颜色 
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
	            emphasis:{//触发时
	                iconStyle:{
	                    borderColor:"white"//图形的描边颜色
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
		        // 控制网格线是否显示
			        splitLine: {
			                show: false, 
			                //  改变轴线颜色
			                lineStyle: {
			                    // 使用深浅的间隔色
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
		           name : '雪阻量M',
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
		        // 控制网格线是否显示
			        splitLine: {
			                show: false, 
			                //  改变轴线颜色
			                lineStyle: {
			                    // 使用深浅的间隔色
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
		            name:"雪阻量",
		            type:'bar',
		            //stack:'one',
		            data:y_data,
		            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
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
		        data:['沙阻量'],
		        textStyle: {  
		            color: '#fff',          //legend字体颜色 
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
	            emphasis:{//触发时
	                iconStyle:{
	                    borderColor:"white"//图形的描边颜色
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
		        // 控制网格线是否显示
			        splitLine: {
			                show: false, 
			                //  改变轴线颜色
			                lineStyle: {
			                    // 使用深浅的间隔色
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
		           name : '沙阻量M^2',
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
		        // 控制网格线是否显示
			        splitLine: {
			                show: false, 
			                //  改变轴线颜色
			                lineStyle: {
			                    // 使用深浅的间隔色
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
		            name:"沙阻量",
		            type:'bar',
		            //stack:'one',
		            data:y_data,
		            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }		            
		       }		       
		  ]

        }, true);

    }
    
    var dChart = echarts.init(document.getElementById('infraredechart'),'blue');

    // 指定图表的配置项和数据

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
		        data:['沙阻量'],
		        textStyle: {  
		            color: '#fff',          //legend字体颜色 
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
	            emphasis:{//触发时
	                iconStyle:{
	                    borderColor:"white"//图形的描边颜色
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
		        // 控制网格线是否显示
			        splitLine: {
			                show: false, 
			                //  改变轴线颜色
			                lineStyle: {
			                    // 使用深浅的间隔色
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
		           name : '沙阻量M^2',
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
		        // 控制网格线是否显示
			        splitLine: {
			                show: false, 
			                //  改变轴线颜色
			                lineStyle: {
			                    // 使用深浅的间隔色
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
		            name:"沙阻量",
		            type:'bar',
		            //stack:'one',
		            data:y_data,
		            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }		            
		       }		       
		  ]
            });

    }
    
	
   
</script>

