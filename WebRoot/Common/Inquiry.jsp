<%@ page contentType="text/html; charset=gbk" language="java" import="com.droneSystem.hibernate.*,com.droneSystem.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="../css/systemPu.css" />
<link rel="stylesheet" type="text/css" href="../Inc/Style/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../Inc/Style/Style.css" />
<link rel="stylesheet" type="text/css" href="../Inc/Style/themes/default/easyui.css" />
<script type="text/javascript" src="../Inc/JScript/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../Inc/JScript/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../Inc/JScript/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<script type="text/javascript" src="../JScript/upload.js"></script>
<script type="text/javascript" src="../JScript/admin.js"></script>
<!-- <script type="text/javascript" src="../JScript/inquiry.js"></script> -->
<script type="text/javascript" src="../JScript/json2.js"></script>
<link rel="stylesheet" type="text/css" href="../Inc/Style/video-js.css" />
<script type="text/javascript" src="http://vjs.zencdn.net/5.18.4/video.min.js"></script>
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
			<p id="p1"><a href="javascript:void(0)">用户列表</a></p>
			<p id="p2"><a href="javascript:void(0)">角色列表</a></p>
			<p id="p3"><a href="javascript:void(0)">权限列表</a></p>
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
	
	<div class="videoinquiry" id="videoquery">
		<h5 class="title_sample"><span id="videoplaying">视频播放</span><a id="userlist_close" href="javascript:void(0);"><img src="../images/cross.png" /></a></h5>
		<div id="video" style="width:2500px;height:1410px">
		<object type='application/x-vlc-plugin' id='vlc' events='True' width="2021px" height="1505px" pluginspage="http://www.videolan.org" codebase="http://downloads.videolan.org/pub/videolan/vlc-webplugins/2.0.6/npapi-vlc-2.0.6.tar.xz">
        <!-- <param name='mrl' value='../Inc/MOV_0030.MOV' /> -->        
		<!-- <param name='mrl' value='rtsp://47.94.19.230:10554/gzrtsp.sdp' /> -->
        <param name='volume' value='50' />
        <param name='autoplay' value='false' />
        <param name='loop' value='false' />
        <param name='fullscreen' value='false' />
        </object>
			<!--  <video id="my-video" class="video-js" controls preload="auto" width="2500px" height="1410px"
            poster="../images/8.jpg" data-setup="{}">
			<source src="../Inc/MOV_0030.MOV" type="video/mov">
				 <source src="rtmp://live.hkstv.hk.lxdns.com/live/hks" type="rtmp/flv">
				<p class="vjs-no-js">
					To view this video please enable JavaScript, and consider upgrading to a web browser that
				<a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
				</p>
			</video>
			<script src="http://vjs.zencdn.net/5.10.4/video.js"></script> -->
			</div>
			<p class="endpages"></p>
	</div> 
	
	<!--弹框001-->
	<div class="userlist" id="userlist">
		<h5 class="title_sample"><span>用户列表</span><a id="userlist_close" href="javascript:void(0)" ><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a onclick="addUser()"><img src="../images/addperson.png" /></a></div>
		<div class="fright sousuort"><input type="text" /><button><img src="../images/searchicon.png" /></button></div>
		<div class="myclear"></div> 
		<table id="usertable" width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		</table>
		<p class="endpages" id="user"></p>
	</div> 
	<div id="new_user" style="position:absolute; z-index:101; left:2750px; top:500px; width:1250px; height:900px;display:none; background:url(../images/personbg.png) repeat-x top">
		<h5 class="title_sample"><span>添加用户</span><a id="userlist_close" href="javascript:void(0);" ><img src="../images/cross.png" /></a></h5>
		<form id="new_user_form" style="padding:10px 20px 10px 50px;font-size:40px;" method="post">
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td style="font-size:40px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 : </td><td><input type="text" name="Name" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr><br/>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td align="center" width="30%">用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名 : </td><td align="center" width="70%"><input type="text" name="userName" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr><br/>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>所&nbsp;属&nbsp;部&nbsp;门 : </td>
				<td>
					<select id="department" class="easyui-validatebox" name="DepartmentId" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="1">财务部</option>
						<option value="2">收发室</option>
						<option value="3">业务管理科</option>
					</select>
				</td>
			</tr><br/>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;">
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别 : </td>
				<td>
					<select class="easyui-validatebox" name="Gender" style="width:73%;margin:25px;padding:10px 15px 10px 15px" required="true">
						<option value="0">男</option>
						<option value="1">女</option>
					</select>
				</td>
			</tr><br/>
			<tr style="width:1000px;margin-left:auto;margin-right:auto;"><td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码 : </td><td><input type="text" name="Password" class="easyui-validatebox" required="true" style="width:70%;margin:25px;padding:10px 15px 10px 15px"></td></tr><br/>
			<div style="padding:5px;text-align:center;margin-top:30px">
				<button id="new_submit_btn" class="easyui-linkbutton" icon="icon-ok" style="width:150px;height:60px;margin-right:20px" onclick="saveUser(this)">确认</button>
				<button class="easyui-linkbutton" icon="icon-cancel" style="width:150px;height:60px" onclick='$("#new_user").css("display","none");'>取消</button>
			</div>
		</form>
	</div>
	<div id="modify_user" style="position:absolute; z-index:101; left:2750px; top:500px; width:1250px; height:900px;display:none; background:url(../images/personbg.png) repeat-x top">
		<h5 class="title_sample"><span>修改用户</span><a id="userlist_close" href="javacript:void(0);" ><img src="../images/cross.png" /></a></h5>
		<form id="modify_user_form" style="padding:10px 20px 10px 50px;font-size:40px;" method="post">
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
		<h5 class="title_sample"><span>角色列表</span><a href="javascript:void(0)"><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href="javascript:void(0)"><img src="../images/addperson.png" /></a><a href="javascript:void(0)"><img src="../images/delectperson.png" /></a></div>
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
	//全局变量
	var currentVideoPage; //当前页面
	var totalVideoPage; //总页面数
	var isVideoPageInit = false; //是否初始化页面栏控件的标识位
	
	function changeVideoPage(page){
	    if(page < 1 || page > totalVideoPage){
			return;
		}
		currentVideoPage = page;
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
			    initVideoPage(data.total);
				showVideo(data); 			
			}
		}); 	
	    
	}
	changeVideoPage(1);
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
			tr += "<td width='25%' class='video_name'>" + item.video + "</td>";       
			tr += "<td width='15%' class='video_type'>" + item.type  + "</td>";				
			tr += "<td width='10%'><a id='trafficbutton' href='javascript:void(0)' onclick='showCharts(this)'>查看</a></td>";   
			  										
			$("#videolist").append("<tr>"+tr+"</tr>");			
									
		});
	}
	
	function showCharts(element){
		  var videoId = $(element).parent().parent().find(".video_id").text();
		  var videoType = $(element).parent().parent().find(".video_type").text();
		  var videoName = $(element).parent().parent().find(".video_name").text();
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
		      $(".videoinquiry").show();
		      $("#videoplaying").text(videoName);
		      var vlc = document.getElementById("vlc"); 
			  var id = 0; 
			  id = vlc.playlist.add("../Inc/"+videoName); //添加mrl到播放列表						
			  vlc.playlist.playItem(id);  //播放播放列表里的序列
		      /* videojs("my-video").ready(function(){
							var myPlayer = this;
							myPlayer.play();
							}); */
							closevideo();
		      if(videoType==3){
		       	        
		         var xdata = [];
		         var ydata1 = [];
		         var ydata2 = [];
			     for(var i =0 ;i < data.carNums.length;i++){
			            xdata[i] = data.carNums[i].time;
			            ydata1[i] = data.carNums[i].valueLeft;
			            ydata2[i] = data.carNums[i].valueRight;
			     } 
			    // console.log(xdata);
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
   
   function closevideo()
	 {	
	 	 $(".title_sample a img").click(function (){	 	      
	          $(this).parent().parent().parent().hide("fast");
	         
	  });
	 }
   	
	/* *
	 * @brief 初始化页面控件
	 * @params  totalCntOfUser 用户的总数量
	 * @return null
	 * */
	function initVideoPage(totalCntOfVideo){
		//判断是否初始化过页数控件
		if(isVideoPageInit){
			return;
		}
		isVideoPageInit = true;
		
		totalVideoPage = Math.ceil(totalCntOfVideo / 10);
		var aLabel = '';
		if (totalVideoPage >= 3) {
			aLabel += '<a class="change_video_page" href="#">上一页</a>'
			aLabel += '<a class="change_video_page" href="#">1</a>';
			aLabel += '<a href="#">...</a>';
			aLabel += '<a class="change_video_page" href="#">'+totalVideoPage+'</a>';
			aLabel += '<a class="change_video_page" href="#">下一页</a><span>到第<input id="switch_video_page" type="text" />页<button id="confirm_video_page">确定</button></span>'
			$("#video").append(aLabel);
		} else {
			aLabel += '<a class="change_video_page" href="#">上一页</a>'
			for(var i = 1; i <= totalVideoPage; i++){
				aLabel += '<a class="change_video_page" href="#">'+i+'</a>';
			}
			aLabel += '<a class="change_video_page" href="#">下一页</a><span>到第<input id="switch_video_page" type="text" />页<button id="confirm_video_page">确定</button></span>'
			$("#video").append(aLabel);
		}
		$(".change_video_page").click(function(){
			var temp = $(this).text();
			//$(this).css("color","#4FCD74");
			if(temp == "上一页" && currentVideoPage > 1){
				currentVideoPage--;
			} else if(temp == "下一页" && currentVideoPage < totalVideoPage){
				currentVideoPage++;
			} else if(temp != "上一页" && temp != "下一页"){
				currentVideoPage = temp;
			}
			changeVideoPage(currentVideoPage);
		});
		$("#confirm_video_page").click(function(){
			var switchPage = $("#switch_video_page").val();
			currentVideoPage = switchPage;
			changeVideoPage(switchPage);
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
<script type="text/javascript" src="../JScript/UserOperation.js"></script>
