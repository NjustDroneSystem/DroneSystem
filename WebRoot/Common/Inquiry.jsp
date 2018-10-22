<%@ page contentType="text/html; charset=gbk" language="java" import="com.droneSystem.hibernate.*,com.droneSystem.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="../css/systemPu.css" />
<link href="http://api.map.baidu.com/library/TrafficControl/1.4/src/TrafficControl_min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jwTcIoGGL3WahiyCb2Hg7juZi1TGym0Y" charset="utf-8"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/TrafficControl/1.4/src/TrafficControl_min.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="../Inc/Style/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../Inc/Style/Style.css" />
<script type="text/javascript" src="../Inc/JScript/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../Inc/JScript/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../Inc/JScript/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<script type="text/javascript" src="../JScript/upload.js"></script>
<script type="text/javascript" src="../JScript/admin.js"></script>
<script type="text/javascript" src="../JScript/inquiry.js"></script>
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
		 <a id="drop_down" href="javascript:void(0)">admin<img src="../images/down_sanjiao.png" /></a><a id="logout" href="javascript:void(0)" onclick="doLogout()"><img src="../images/lines10.png" />�˳�</a>
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
		<h5 class="title_sample"><span>���˻���Ƶ�б�</span></h5>
		<table border="0" cellspacing="0" cellpadding="0" class="person_name">
		  <tr>
			<th align="center" width="10%" style="height:93px">���</th>
			<th align="center" width="20%">���˻����</th>
			<th align="center" width="20%">��Ƶ�ļ�������</th>
			<th align="center" width="15%">ʱ��</th>
			<th align="center" width="15%">״̬</th>
			<th align="center" width="10%">�㷨����</th>
			<th align="center" width="10%"></th>
		  </tr>
		</table>
		<div style=" height:1323px;overflow-y:auto; background:#092E64">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="person_name"  id="videolist">
		
		</table>
		<p class="endpages" id="video"></p>
		</div>
	</div>
	
	<!-- <div class="fleft videoarea">
		<h5 class="title_sample"><span>���˻���Ƶ�㷨ͼ��</span></h5>
		<div id="echarts" style="width:2500px;height:1410px">
		
		</div>
	</div> -->

	
	<div class="fleft trafficarea">
		<h5 class="title_sample"><span>��������ѯͳ�ƽ��</span></h5>
		<div id="trafficechart" style="width:1460px;height:616px"></div>
	</div>
	<div class="fleft snowarea">
		<h5 class="title_sample"><span>ѩ���ѯͳ�ƽ��</span></h5>
		<div id="snowechart" style="width:1460px;height:616px"></div>
	</div>
	<div class="fleft sandarea">
		<h5 class="title_sample"><span>ɳ���ѯͳ�ƽ��</span></h5>
		<div id="sandechart" style="width:1460px;height:616px"></div>
	</div>
	<div class="fleft infraredarea">
		<h5 class="title_sample"><span>�����ѯͳ�ƽ��</span></h5>
		<div id="infraredechart" style="width:1460px;height:616px"></div>
	</div>
	<div class="myclear"></div>	
	
	
	<!--����001-->
	<div class="userlist">
		<h5 class="title_sample"><span>�û��б�</span><a id="userlist_close" href="javascript:void(0)" onclick="closeUserlist()"><img src="../images/cross.png" /></a></h5>
		<div class="fleft sousuolf"><a href="#"><img src="../images/addperson.png" /></a><a href="#"><img src="../images/delectperson.png" /></a></div>
		<div class="fright sousuort"><input type="text" /><button><img src="../images/searchicon.png" /></button></div>
		<div class="myclear"></div> 
		<!-------ÿҳ112������-------->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="person_name">
		  <tr>
			<th scope="col" width="140">&nbsp;</th>
			<th scope="col">ID</th>
			<th scope="col">�û���</th>
			<th scope="col">��ʵ����</th>
			<th scope="col">����</th>
			<th scope="col">��ɫ</th>
			<th scope="col">�˺�״̬</th>
			<th scope="col">ע��ʱ��</th>
			<th scope="col">����ѡ��</th>
		  </tr>
		  <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		   <tr>
			<td><input type="checkbox" /></td>
			<td>17001</td>
			<td>33dfadsfd</td>
			<td>������</td>
			<td>��Ʋ���</td>
			<td>��ͨ����Ա</td>
			<td>����</td>
			<td>2017-05-22</td>
			<td><a href="#">�༭</a><a href="#">ɾ��</a></td>
		  </tr>
		</table>
		<p class="endpages"><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">...</a><a href="#">49</a><a href="#">��һҳ</a><span>����<input type="text" />ҳ<button>ȷ��</button></span></p>
	</div> 
	<!--����001����-->
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

	

    changePage(1);
	function changePage(page){
	    /* if(page < 1 || page > totalPage){
			return;
		}
		currentPage = page;
		var queryJson = {};
		queryJson.page = page;
		queryJson.rows = 10; */
		$.ajax({
			type: "post", 
			cache: false, 
			dataType: 'json',
			url: '/droneSystem/VideoServlet.do?method=0',
			//data:queryJson,
			data:{},
			success: function(data){
			        //initPage(data.total);
				    showVideo(data); 			
			}
		}); 	
	    
	}
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
	  for(var i=0;i<data.videos.length;i++){                        
        var tr="";                      			
		tr += "<td width='10%' class='video_id'>" + data.videos[i].id + "</td>";   
		tr += "<td width='20%'>" + data.videos[i].drone + "</td>";  
		tr += "<td width='20%'>" + data.videos[i].video + "</td>";       
		tr += "<td width='15%'>" + data.videos[i].time + "</td>"; 
		tr += "<td width='15%'>" + data.videos[i].status + "</td>";
		tr += "<td width='10%'>" + data.videos[i].type  + "</td>";
		tr += "<td width='10%'><a id='trafficbutton' href='#' onclick='showCharts(this)'>�鿴</a></td>";
        $("#videolist").append("<tr>"+tr+"</tr>");
        }
	}
	
	function showCharts(element){
		  var videoId = $(element).parent().parent().find(".video_id").text();
		  //console.log(videoId);
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
		         var xdata = [];
		         var ydata1 = [];
		         var ydata2 = [];
			     for(var i =0 ;i < data.carNums.length;i++){
			            xdata[i] = data.carNums[i].time;
			            ydata1[i] = data.carNums[i].valueLeft;
			            ydata2[i] = data.carNums[i].valueRight;
			     } 
		         aFun(xdata,ydata1,ydata2);
				}
				});		      						      
   }
   	
	/* *
	 * @brief ��ʼ��ҳ��ؼ�
	 * @params  totalCntOfUser �û���������
	 * @return null
	 * */
/* 	function initPage(totalCntOfUser){
		//�ж��Ƿ��ʼ����ҳ���ؼ�
		if(isInit){
			return;
		}
		isInit = true;
		
		totalPage = Math.ceil(totalCntOfUser / 10);
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
	} */
   
   var aChart = echarts.init(document.getElementById("trafficechart"),'blue');

    function aFun(x_data, y_data1, y_data2) {

        aChart.setOption({
        			title : {
        			    text: '',
        			    textstyle:{
        			    	"fontSize":"20",
        		            "fontWeight": "bolder"
        		    },
        			},
        			tooltip : {
        			    trigger: 'axis', 
        		        axisPointer: {
        		            type: 'cross',
        		            label: {
        		            //    backgroundColor: 'F2F2F2'
        		            }
        		        }
        			 },
        		    legend: {
        		        data:['ʵʱ���г������仯', 'ʵʱ���г������仯'],
        		        textStyle: {  
        		            color: '#fff',          //legend������ɫ 
        		            fontSize:'22'

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
        		        
        	            itemSize:'22',
        	            emphasis:{//����ʱ
        	                iconStyle:{
        	                    borderColor:"white"//ͼ�ε������ɫ
        	                }
        	            }

        		    },
        		    dataZoom : {
        		        show : true,
        		        start : 0,
        		        end : 50
        		    },
        		    xAxis : [
        		        {
        		            type : 'category',
        		            axisLabel: {        
        		                show: true,
        		                textStyle: {
        		                    color: '#fff',
        		                    fontSize:'20'
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
        		                    width:1
        		                }
        		            },
        		            axisPointer: {
        	                type: 'shadow'
        	                },

        		            boundaryGap : true,
        		            data:x_data
        		        },
        		         {
        		            type: 'category',
        		            boundaryGap: true,
        		            data: (function (){
        		                var res = [];
        		                var len = 10;
        		                while (len--) {
        		                    res.push(10 - len - 1);
        		                }
        		                return res;
        		            })()
        		        }
        		   ],
        		   yAxis : [
        		      {
        		           type : 'value',
        		           scale: true,
        		           name : '������V/h',
        		           axisLabel: {        
        		                show: true,
        		                textStyle: {
        		                    color: '#fff',
        		                    fontSize:'20'
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
        		           axisLabel: {        
        		                show: true,
        		                textStyle: {
        		                    color: '#fff',
        		                    fontSize:'20'
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
        		            name:"ʵʱ���г������仯",
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
        		            name:"ʵʱ���г������仯",
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
			    	"fontSize":"20",
		            "fontWeight": "bolder"
		    },
			},
			tooltip : {
			    trigger: 'axis', 
		        axisPointer: {
		            type: 'cross',
		            label: {
		            //    backgroundColor: 'F2F2F2'
		            }
		        }
			 },
		    legend: {
		        data:['ѩ����'],
		        textStyle: {  
		            color: '#fff',          //legend������ɫ 
		            fontSize:'22'

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
		        
	            itemSize:'22',
	            emphasis:{//����ʱ
	                iconStyle:{
	                    borderColor:"white"//ͼ�ε������ɫ
	                }
	            }

		    },
		    dataZoom : {
		        show : false,
		        start : 0,
		        end : 100
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'20'
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
		                    width:1
		                }
		            },
		            axisPointer: {
	                type: 'shadow'
	                },

		            boundaryGap : true,
		            data:x_data
		        },
		         {
		            type: 'category',
		            boundaryGap: true,
		            data: (function (){
		                var res = [];
		                var len = 10;
		                while (len--) {
		                    res.push(10 - len - 1);
		                }
		                return res;
		            })()
		        }
		   ],
		   yAxis : [
		      {
		           type : 'value',
		           scale: true,
		           name : 'ѩ����M',
		           axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'20'
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
			    	"fontSize":"20",
		            "fontWeight": "bolder"
		    },
			},
			tooltip : {
			    trigger: 'axis', 
		        axisPointer: {
		            type: 'cross',
		            label: {
		            //    backgroundColor: 'F2F2F2'
		            }
		        }
			 },
		    legend: {
		        data:['ɳ����'],
		        textStyle: {  
		            color: '#fff',          //legend������ɫ 
		            fontSize:'22'

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
		        
	            itemSize:'22',
	            emphasis:{//����ʱ
	                iconStyle:{
	                    borderColor:"white"//ͼ�ε������ɫ
	                }
	            }

		    },
		    dataZoom : {
		        show : false,
		        start : 0,
		        end : 100
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'20'
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
		                    width:1
		                }
		            },
		            axisPointer: {
	                type: 'shadow'
	                },

		            boundaryGap : true,
		            data:x_data
		        },
		         {
		            type: 'category',
		            boundaryGap: true,
		            data: (function (){
		                var res = [];
		                var len = 10;
		                while (len--) {
		                    res.push(10 - len - 1);
		                }
		                return res;
		            })()
		        }
		   ],
		   yAxis : [
		      {
		           type : 'value',
		           scale: true,
		           name : 'ɳ����M^2',
		           axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'20'
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
			    	"fontSize":"20",
		            "fontWeight": "bolder"
		    },
			},
			tooltip : {
			    trigger: 'axis', 
		        axisPointer: {
		            type: 'cross',
		            label: {
		            //    backgroundColor: 'F2F2F2'
		            }
		        }
			 },
		    legend: {
		        data:['ɳ����'],
		        textStyle: {  
		            color: '#fff',          //legend������ɫ 
		            fontSize:'22'

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
		        
	            itemSize:'22',
	            emphasis:{//����ʱ
	                iconStyle:{
	                    borderColor:"white"//ͼ�ε������ɫ
	                }
	            }

		    },
		    dataZoom : {
		        show : false,
		        start : 0,
		        end : 100
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'20'
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
		                    width:1
		                }
		            },
		            axisPointer: {
	                type: 'shadow'
	                },

		            boundaryGap : true,
		            data:x_data
		        },
		         {
		            type: 'category',
		            boundaryGap: true,
		            data: (function (){
		                var res = [];
		                var len = 10;
		                while (len--) {
		                    res.push(10 - len - 1);
		                }
		                return res;
		            })()
		        }
		   ],
		   yAxis : [
		      {
		           type : 'value',
		           scale: true,
		           name : 'ɳ����M^2',
		           axisLabel: {        
		                show: true,
		                textStyle: {
		                    color: '#fff',
		                    fontSize:'20'
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

