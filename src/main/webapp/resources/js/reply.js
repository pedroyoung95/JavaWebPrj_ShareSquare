console.log("reply module.......");

var replyService = (function() {
	function add(reply, callback, error) {
//reply:입력된 댓글, callback:성공했을 때, error:실패했을 때	
		console.log("add method");
		console.log(reply);		
		$.ajax({
			type:"post",
			url:"/replies/new",
			data:JSON.stringify(reply), 
//JSON.stringify(object):form에 입력된 data를 json타입으로 변환
			contentType:"application/json;charset=UTF-8",
			success:function(result, status, xhr) {
				if(callback) {
					callback(result);
				}				
			},
			error:function(xhr, status, er) {
				if(error) {
					error(er);
				}				
			}
		});
	}
	
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		//javascript에서 false값이 되는 것들 : 0, ""(빈 텍스트), null, undefined
		//변수 선언 시 ||연산자로 둘 중 false가 아닌 값을 할당하게 함
		$.getJSON("/replies/pages/" + bno + "/" + page, function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error(err);
			}
		});
	}
	
	function remove(rno, callback, error) {
		$.ajax({
			type:"delete",
			url:"/replies/" + rno,
			success:function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error:function(xhr, status, er) {
				if(error) {
					error(er);
				}
			} 
		});
	}
	
	function update(reply, callback, error) {
		$.ajax({
			type:"put",
			url:"/replies/" + reply.rno,
			data:JSON.stringify(reply),
			contentType:"application/json;charset=UTF-8",
			success:function(data, status, xhr) {
				if(callback) {
					callback(data);
				}
			},
			error:function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function get(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, er) {
			if(error) {
				error(er);
			}
		});
	}
	
	return {
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get
		};
})();