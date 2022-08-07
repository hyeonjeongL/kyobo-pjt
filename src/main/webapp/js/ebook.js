/**
 * 
 */
function ebookBuy() {
		document.add_cart_form.action = "ebook_insert_action.jsp";
		document.add_cart_form.method = "POST";
		document.add_cart_form.submit();
	}
	
	
function setCookies(){
		document.ebook.action = "ebook_registered.jsp";
		document.ebook.method = "POST";
		document.ebook.submit();
	
}

function check_box_count() {
		ebook_check_list = 0;
		allCount = 0;
		ebook_check_list = document.getElementsByName('ebook_check');
		for(var i=0; i<ebook_check_list.length; i++){
			if(ebook_check_list[i].checked == true){
				allCount++;
			}
		}
		document.getElementById('ebook_select_count').innerHTML = allCount;
		
}

function ebook_form_delete_submit(){
	document.ebook.action = "ebook_delete_action.jsp";
	document.ebook.method = "POST";
	document.ebook.submit();
	
	
}

function pageup() {
	var a = f.u.value+1;
	location.href='ebook_detail('+a+').jsp';
}

function pagedown() {
	var a = f.d.value-1;
	location.href='ebook_detail('+a+').jsp';
}


function ipregisterlist_popup_window(){
	var left = Math.ceil(( window.screen.width)/3);
	var top = Math.ceil(( window.screen.height)/3);
	console.log(left);
	console.log(top);
	window.open("about:blank","ebook","width=420,height=200,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	document.ebook.action = 'IPregisterList.jsp';
	document.ebook.target = 'ebook';
	document.ebook.method = 'POST';
	document.ebook.submit();
}