/**
 * ajax javaScript 파일
 */
var XHR=null;

function getXHR()
{
	if(window.ActiveXObject)
	{
		return new ActiveXObject('Msxml2.XMLHTTP');
	}
	else if(window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else
	{
		return null;	
	}
}

function sendXHR(url,params,callback,method)
{
	XHR=getXHR();
	
	var newMethod = method?method:'GET';
	if(newMethod!='GET'||newMethod!='POST')
	{
		newMethod='GET';
	}
	
	var newParams = (params==null||params=='')?null:params;
	var newUrl = url;
	if(newMethod=='GET' && newParams!=null)
	{
		newUrl = newUrl+'?'+newParams;
	}
	XHR.onreadystatechange=callback;
	XHR.open(newMethod,newUrl,true);
	XHR.setRequestHeader('Content-Type','x-www-form-urlencoded');
	XHR.send(newMethod=='POST'?newParams:null);
}