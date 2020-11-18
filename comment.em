/* comment.em - 添加各种注释的文件*/


/****************************************************************************************

    Funcname  : InsertFunctionAnnotation
    Parameter : none
    Return    : none
    Function  : 给函数添加注释
    Author    : tke
    Date      : 2020/11/17

****************************************************************************************/
macro InsertFunctionAnnotation()
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	 
	hbuf = GetCurrentBuf()

	//获取当前系统时间
	SysTime = GetSysTime(1)
    Year = SysTime.Year
    month = SysTime.month
    day = SysTime.day


	InsBufLine(hbuf, lnFirst, "****************************************************************************************/")
	InsBufLine(hbuf, lnFirst, "")
	InsBufLine(hbuf, lnFirst, "    Date      : @Year@/@month@/@day@")
	InsBufLine(hbuf, lnFirst, "    Author    : tke")
	InsBufLine(hbuf, lnFirst, "    Function  : ")
	InsBufLine(hbuf, lnFirst, "    Return    : ")
	InsBufLine(hbuf, lnFirst, "    Parameter : ")
	InsBufLine(hbuf, lnFirst, "    Funcname  : ")
	InsBufLine(hbuf, lnFirst, "")
	InsBufLine(hbuf, lnFirst, "/****************************************************************************************")
}


macro AddedBy()
{
	SysTime = GetSysTime(1)
    Year = SysTime.Year
    month = SysTime.month
    day = SysTime.day

    hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	 
	hbuf = GetCurrentBuf()

	InsBufLine(hbuf, lnFirst, "/* added end by tke in @Year@/@month@/@day@ */")
	InsBufLine(hbuf, lnFirst, "/* added begin by tke for xxxx in @Year@/@month@/@day@ */")
}
