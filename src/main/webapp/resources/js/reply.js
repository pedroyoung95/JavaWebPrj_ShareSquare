console.log("reply module.......");

var replyService = (function() {
	//댓글 추가
	function add(reply, callback, error) {
		console.log("add method");
		console.log(reply);		
		$.ajax({
			type:"post",
			url: appRoot + "/replies/new",
			data:JSON.stringify(reply), 
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
	
	//댓글 목록 불러오기
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		$.getJSON(appRoot + "/replies/pages/" + bno + "/" + page, function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error(err);
			}
		});
	}
	
	//댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			type:"delete",
			url:appRoot + "/replies/" + rno,
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
	
	//댓글 수정
	function update(reply, callback, error) {
		$.ajax({
			type:"put",
			url:appRoot + "/replies/" + reply.rno,
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
	
	//댓글 조회
	function get(rno, callback, error) {
		$.get(appRoot + "/replies/" + rno + ".json", function(data) {
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