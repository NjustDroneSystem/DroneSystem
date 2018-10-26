//全局变量
	var currentPage; //当前页面
	var totalPage; //总页面数
	var isInit = false; //是否初始化页面栏控件的标识位
	/* *
	 * @brief 按分页要求查询用户
	 * @params data 存放查询到的用户对象和用户数的json 
	 * @return null
	 * */
	function queryUser(data){
		//清空列表
		$("#usertable").empty();	
		//得到存放着json对象的数组，例如：{{"Id":"1","Name":"nick"....},{"Id":"2","Name":"barry"...}}
		data = data.rows;
		var tr = '<th scope="col" width="300">ID</th>' +
			'<th scope="col">用户名</th>' +
			'<th scope="col">真实姓名</th>' +
			'<th scope="col">部门</th>' +
			'<th scope="col">角色</th>' +
			'<th scope="col">账号状态</th>' +
			'<th scope="col">注册时间</th>' +
			'<th scope="col">操作选择</th>';
		$("#usertable").append("<tr>"+tr+"</tr>");
		
		$.each(data,function (index,item) {    
			var tr;  				
			tr = "<td class='user_id'>" + item.Id + "</td>";   
			tr += "<td>" + item.userName + "</td>";  
			tr += "<td>" + item.Name + "</td>";       
			tr += "<td>" + item.JobTitle + "</td>"; 
			tr += "<td>" + item.Education  + "</td>";     
			tr += "<td>" + item.Status + "</td>";    
			tr += "<td>" + item.CancelDate + "</td>";     					
			tr += "<td><a href='#' onclick='prepareToModifyUser(this)'>编辑</a><a href='#' onclick='deleteUser(this)'>删除</a></td>";   
			  										
			$("#usertable").append("<tr>"+tr+"</tr>");			
									
		});
	}
	
	/* *
	 * @brief 更换页面显示
	 * @params currentPage 点击的页数
	 * @return null
	 * */
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
			url: '/droneSystem/UserServlet.do?method=0',
			data: queryJson,
			success: function(data){
			//console.log(queryJson);
				initPage(data.total);
				queryUser(data);
			}
		});
	}
	changePage(1);
	
	/* *
	 * @brief 初始化页面控件
	 * @params  totalCntOfUser 用户的总数量
	 * @return null
	 * */
	function initPage(totalCntOfUser){
		//判断是否初始化过页数控件
		if(isInit){
			return;
		}
		isInit = true;
		
		totalPage = Math.ceil(totalCntOfUser / 10);
		var aLabel = '';
		if (totalPage >= 3) {
			aLabel += '<a class="change_page" href="#">上一页</a>'
			aLabel += '<a class="change_page" href="#">1</a>';
			aLabel += '<a href="#">...</a>';
			aLabel += '<a class="change_page" href="#">'+totalPage+'</a>';
			aLabel += '<a class="change_page" href="#">下一页</a><span>到第<input id="switch_page" type="text" />页<button id="confirm_page">确定</button></span>'
			$("#user").append(aLabel);
		} else {
			aLabel += '<a class="change_page" href="#">上一页</a>'
			for(var i = 1; i <= totalPage; i++){
				aLabel += '<a class="change_page" href="#">'+i+'</a>';
			}
			aLabel += '<a class="change_page" href="#">下一页</a><span>到第<input id="switch_page" type="text" />页<button id="confirm_page">确定</button></span>'
			$("#user").append(aLabel);
		}
		$(".change_page").click(function(){
			var temp = $(this).text();
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
	
	/* *
	 * @brief 操作用户信息
	 * @params  element submit按钮元素对象
	 * @return null
	 * */
	function saveUser(element){
		//根据标识位判断对用户的添加或编辑操作
		$('#new_user_form').form({
			url:'/droneSystem/servlet/UserServlet.do?method=1',
			success:function(data){			
				console.log(data);		   			
			}
		});
		//隐藏窗口
		$("#new_user").css("display","none");
	}
	
	/* *
	 * @brief 获得待编辑用户的id并填入表单
	 * @params  element 编辑按钮元素对象
	 * @return null
	 * */
	function prepareToModifyUser(element){
		$("#modify_user").css("display","block");
		var userId = $(element).parent().parent().find(".user_id").text();
		$("input[name='Id']").attr("value",""+userId);
		console.log(userId);
	}
	
	/* *
	 * @brief 编辑用户信息
	 * @params  null
	 * @return null
	 * */
	function modifyUser(){
		//上传表单
		$('#modify_user_form').form({
			url:'/droneSystem/servlet/UserServlet.do?method=2',
			success:function(data){			
				console.log(data);		   			
			},
		});
		//隐藏窗口
		$("#modify_user").css("display","none");
	}
	
	/* *
	 * @brief 删除用户
	 * @params  element 删除按钮元素对象
	 * @return null
	 * */
	function deleteUser(element){
		var deleteJson = {};
		//获得要删除的用户的id
		deleteJson.Id = $(element).parent().parent().find(".user_id").text();
		//移除条目
		$(element).parent().parent().remove();
		//请求servlet删除用户
		$.ajax({
			type: "post", 
			dataType: 'json',
			url: '/droneSystem/UserServlet.do?method=8',
			data: deleteJson,
			success: function(data){
				console.log(data);
			}
		});
	}