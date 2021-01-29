console.log("reply module.......");

//${root} -> jsp파일이 아닌 js라는 소스코드이므로, ${root}라는 텍스트로 사용됨
//get.jsp에서 가장 위에 있는(가장 먼저 실행되는)<script>에 ${root}값을 
//appRoot라는 자바스크립트 변수에 할당해놓음
//이후 자바스크립트 코드에서는 appRoot변수를 사용하면 ${root}값을 사용할 수 있게 됨

var replyService = (function() {
	function add(reply, callback, error) {
//reply:입력된 댓글, callback:성공했을 때, error:실패했을 때	
		console.log("add method");
		console.log(reply);		
		$.ajax({
			type:"post",
			url: appRoot + "/replies/new",
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