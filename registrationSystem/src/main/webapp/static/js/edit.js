/*
 * edit.js 
 */

$(function(){
	listNotebooksAction();
	
	//在点击 添加笔记按钮时候加载添加笔记对话框
	$('#add_note').click(function(){
		
		if(! model.currentNotebook){
			alert("请先选定笔记本!");
			return false;
		}
		
		var url = './views/alert/alert_note.jsp';
		var data = {abc:Math.random()};
		$('#can').load(url, data,function(){
			//console.log("成功!");
			$('#can .close, #can .cancel')
			.click(function(){
				$('#can').empty();
			});
			
			//为确定按钮绑定事件
			$('#can .sure').click(addNoteAction);
		});
	});
	$('#save_note').click(saveNoteAction);
});



//定义一个数据模型, 封装界面显示数据和数据显示的方法
//updateNotebooks 数据更新方法
//updateNotebooksView 视图更新方法
var model = {
	notebooks:[],
	notes:[],
	updateNotebooks:function(notebooks){
		this.notebooks = notebooks;
		this.updateNotebooksView();
	},
	updateNotebooksView:function(){
		//console.log("Update View!");
		//找到视图元素 ul
		var view=$('#notebooks-view');
		view.empty();
		/*
		<li class="online">
		<a  class='checked'>
		<i class="fa fa-book" title="online" rel="tooltip-bottom">
		</i> 默认笔记本</a></li>
		 */
		//将每个笔记本数据显示到视图上
		for(var i=0; i<this.notebooks.length; i++){
			var book = this.notebooks[i];
			var li=$('<li class="online"></li>');
			var a=$('<a></a>');
			var ico =$('<i class="fa fa-book" title="online" rel="tooltip-bottom"></i>')
			li.append(a.append(ico).append(book.name));
			view.append(li);
			
			if(model.currentNotebook){
				if(book.id==model.currentNotebook.id){
					a.addClass('checked');
				}
			}
			
			//利用Jquery数据绑定传递数据
			a.data('index', i);
			
			a.click(function(){
				$('#notebooks-view a')
					.removeClass('checked');
				$(this).addClass("checked");
				//取到传递过来的index
				index = $(this).data('index');
				//获取index 对应的当前笔记对象
				notebook=model.notebooks[index];	
				//console.log("A clicked")
				//获取当前笔记本?
				model.currentNotebook=notebook;
				//model.currentNotebookIndex=index;
				//测试当前笔记
				console.log(notebook);
				listNotesAction();
				return false;
			});
		}
	}
	
};

// 更新数据模型中 笔记列表 
model.updateNotes=function(notes){
	this.notes = notes;
	this.updateNotesView();
};
/*
<li class="online">
	<a  class='checked'>
		<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> 使用Java操作符<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-chevron-down"></i></button>
	</a>
	<div class="note_menu" tabindex='-1'>
		<dl>
			<dt><button type="button" class="btn btn-default btn-xs btn_move" title='移动至...'><i class="fa fa-random"></i></button></dt>
			<dt><button type="button" class="btn btn-default btn-xs btn_share" title='分享'><i class="fa fa-sitemap"></i></button></dt>
			<dt><button type="button" class="btn btn-default btn-xs btn_delete" title='删除'><i class="fa fa-times"></i></button></dt>
		</dl>
	</div>
</li>
 * 
 */
//将笔记列表信息显示到 笔记列表区域
model.updateNotesView=function(){
	var ul=$('#notes-view').empty();
	for(var i=0; i<this.notes.length; i++){
		var note=this.notes[i];
		//将note 添加 显示区域
		var li=$('<li class="online"></li>');
		var a=$('<a></a>');
		var ico=$('<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i>');
		var menuBtn=$('<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-chevron-down"></i></button>');
		var menu = $('<div class="note_menu" tabindex="-1">'+
				'<dl>'+
					'<dt><button type="button" class="btn btn-default btn-xs btn_move" title="移动至..."><i class="fa fa-random"></i></button></dt>'+
					'<dt><button type="button" class="btn btn-default btn-xs btn_share" title="分享"><i class="fa fa-sitemap"></i></button></dt>'+
					'<dt><button type="button" class="btn btn-default btn-xs btn_delete" title="删除"><i class="fa fa-times"></i></button></dt>'+
				'</dl>'+
				'</div>');
		a.append(ico).append(note.title)
			.append(menuBtn);
		li.append(a).append(menu);
		ul.append(li);
		
		//选定当前正在显示的笔记
		
		if(model.currentNote && 
			note.id==model.currentNote.id){
			console.log(model.currentNote.id);
			a.addClass('checked');
		}
		
		a.data('index',i);
		//绑定显示笔记详细信息事件
		a.click(function(){
			$('#notes-view a').removeClass('checked');
			$(this).addClass('checked');
			//console.log("Click!");
			var index=$(this).data('index');
			//点击鼠标获取的笔记信息
			var note = model.notes[index];
			model.currentNoteIndex=index;
			//console.log(note);
			showNoteAction();
			//$('#notes-view .note_menu').hide();
			return false;
		});
		
		menuBtn.click(function(){
			var menu = $(this).parent().next();
			var i=$(this).children('i');
			//$('#notes-view .note_menu').hide();
			menu.toggle(function(){
				i.removeClass('fa-chevron-down')
				.removeClass('fa-chevron-up');
				if($(this).css('display')=='none'){
					i.addClass('fa-chevron-down');
				}else{
					i.addClass('fa-chevron-up');
				}
				
			});
			return false;
		});
		
		menu.find('.btn_move').click(function(){
			var url="alert/alert_move.jsp";
			$('#can').load(url, function(){
				$('#can .close, #can .cancel').click(function(){
					$('#can').empty();
				});
				$('#can .sure').click(moveNoteAction);
				$('#can h4').append(' ').
					append(model.currentNote.title);
				$('#moveSelect').empty();
				for(var i=0; i<model.notebooks.length; i++){
					var notebook=model.notebooks[i];
					var opt=$('<option></option>').val(notebook.id)
					.append(notebook.name);
					if(notebook.id==model.currentNotebook.id){
						opt.attr('selected', 'selected');
					}
					$('#moveSelect').append(opt);
				}
				
			});
		});
	}
};

/*
 * 处理笔记的移动
 */
function moveNoteAction(){
	var notebookId=$('#moveSelect').val();
	//判断是否需要移动
	if(model.currentNote.notebookId==
		notebookId){
		return;
	}
	var url = "note/move.do";
	var data={id:model.currentNote.id,
			notebookId: notebookId};
	$.post(url, data, function(result){
		if(result.state==SUCCESS){
			//处理表现逻辑
			//console.log(result);
			//找目标当前笔记本
			for(var i=0; i<model.notebooks.length;i++){
				if(model.notebooks[i].id==notebookId){
					model.currentNotebook=model.notebooks[i];
					model.updateNotebooksView();
					break;
				}
			}
			
			listNotesAction();
			
			model.currentNote.notebookId=
				model.currentNotebook.id;
			
			$('#can').empty();
			
		}else{
			alert(result.message);
		}
	});
}

model.updateNote=function(note){
	//模型中当前正在被编辑的笔记对象
	this.currentNote = note;
	this.updateNoteView();
};

model.updateNoteView = function(){
	um.setContent(model.currentNote.body);
	$('#input_note_title').val(model.currentNote.title);
};


function saveNoteAction(){
	
	if(! model.currentNote){
		return false;
	}
	
	//console.log("Save Note!");
	var id=model.currentNote.id;
	var title=$('#input_note_title').val();
	var body=um.getContent();
	
	if(title == model.currentNote.title
		&& body==model.currentNote.body){
		return false;
	}
	
	var url = 'note/save.do';
	var data={id:id, title:title, body:body};
	$.post(url, data, function(result){
		if(result.state==SUCCESS){
			//console.log(result);
			model.updateNote(result.data);
			model.notes[model.currentNoteIndex].title=
				result.data.title;
			model.updateNotesView();
		}else{
			alert(result.message);
		}
	});
	return false;
}

function addNoteAction(){
	var url="note/add.do";
	var data={notebookId: model.currentNotebook.id,
		userId: getCookie(USER_ID),
		title: $('#input_note').val()};
	$.post(url, data, function(result){
		if(result.state==SUCCESS){
			var note = result.data;
			//model.currentNote=note;
			
			model.notes.unshift(
				{id:note.id, 
				notebookId:note.notebookId,
				title: note.title});
			model.currentNoteIndex = 0;
			
			model.updateNote(note);
			
			model.updateNotesView();

			$('#can').empty();
		}else{
			alert(result.message);
		}
	});
}

function showNoteAction(){
	var index = model.currentNoteIndex;
	var noteId = model.notes[index].id;
	
	var url='note/load.do';
	var data={noteId: noteId};
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			//console.log(result.data);
			model.updateNote(result.data);
		}else{
			alert(result.message);
		}
	});
}

function listNotesAction(){
	//console.log("listNotesAction()");
	var url = "note/list.do";
	var data = 
	  {notebookId:model.currentNotebook.id};
	console.log(data);
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			console.log(result.data);
			model.updateNotes(result.data);
		}else{
			alert(result.message);
		}
	});
}

//发起异步请求获取笔记本列表数据
function listNotebooksAction(){
	var userId = getCookie(USER_ID);
	var url = "notebook/list.do";
	var data = {'userId':userId};
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			var list=result.data;
			//for(var i=0; i<list.length; i++){
			//	console.log(list[i]); 
			//}
			//将笔记本列表数据更新到模型中
			model.updateNotebooks(list);
		}else{
			//出异常时候提示异常信息
			alert(result.message);
		}
	});
}










