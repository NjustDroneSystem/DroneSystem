//ȫ�ֱ���
	var currentPage; //��ǰҳ��
	var totalPage; //��ҳ����
	var isInit = false; //�Ƿ��ʼ��ҳ�����ؼ��ı�ʶλ
	/* *
	 * @brief ����ҳҪ���ѯ�û�
	 * @params data ��Ų�ѯ�����û�������û�����json 
	 * @return null
	 * */
	function queryUser(data){
		//����б�
		$("#usertable").empty();	
		//�õ������json��������飬���磺{{"Id":"1","Name":"nick"....},{"Id":"2","Name":"barry"...}}
		data = data.rows;
		var tr = '<th scope="col" width="300">ID</th>' +
			'<th scope="col">�û���</th>' +
			'<th scope="col">��ʵ����</th>' +
			'<th scope="col">����</th>' +
			'<th scope="col">��ɫ</th>' +
			'<th scope="col">�˺�״̬</th>' +
			'<th scope="col">ע��ʱ��</th>' +
			'<th scope="col">����ѡ��</th>';
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
			tr += "<td><a href='#' onclick='prepareToModifyUser(this)'>�༭</a><a href='#' onclick='deleteUser(this)'>ɾ��</a></td>";   
			  										
			$("#usertable").append("<tr>"+tr+"</tr>");			
									
		});
	}
	
	/* *
	 * @brief ����ҳ����ʾ
	 * @params currentPage �����ҳ��
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
	 * @brief ��ʼ��ҳ��ؼ�
	 * @params  totalCntOfUser �û���������
	 * @return null
	 * */
	function initPage(totalCntOfUser){
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
			$("#user").append(aLabel);
		} else {
			aLabel += '<a class="change_page" href="#">��һҳ</a>'
			for(var i = 1; i <= totalPage; i++){
				aLabel += '<a class="change_page" href="#">'+i+'</a>';
			}
			aLabel += '<a class="change_page" href="#">��һҳ</a><span>����<input id="switch_page" type="text" />ҳ<button id="confirm_page">ȷ��</button></span>'
			$("#user").append(aLabel);
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
	}
	
	/* *
	 * @brief �����û���Ϣ
	 * @params  element submit��ťԪ�ض���
	 * @return null
	 * */
	function saveUser(element){
		//���ݱ�ʶλ�ж϶��û�����ӻ�༭����
		$('#new_user_form').form({
			url:'/droneSystem/servlet/UserServlet.do?method=1',
			success:function(data){			
				console.log(data);		   			
			}
		});
		//���ش���
		$("#new_user").css("display","none");
	}
	
	/* *
	 * @brief ��ô��༭�û���id�������
	 * @params  element �༭��ťԪ�ض���
	 * @return null
	 * */
	function prepareToModifyUser(element){
		$("#modify_user").css("display","block");
		var userId = $(element).parent().parent().find(".user_id").text();
		$("input[name='Id']").attr("value",""+userId);
		console.log(userId);
	}
	
	/* *
	 * @brief �༭�û���Ϣ
	 * @params  null
	 * @return null
	 * */
	function modifyUser(){
		//�ϴ���
		$('#modify_user_form').form({
			url:'/droneSystem/servlet/UserServlet.do?method=2',
			success:function(data){			
				console.log(data);		   			
			},
		});
		//���ش���
		$("#modify_user").css("display","none");
	}
	
	/* *
	 * @brief ɾ���û�
	 * @params  element ɾ����ťԪ�ض���
	 * @return null
	 * */
	function deleteUser(element){
		var deleteJson = {};
		//���Ҫɾ�����û���id
		deleteJson.Id = $(element).parent().parent().find(".user_id").text();
		//�Ƴ���Ŀ
		$(element).parent().parent().remove();
		//����servletɾ���û�
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