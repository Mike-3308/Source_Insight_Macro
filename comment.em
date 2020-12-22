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

	//获取当前系统时间日期信息
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
	MYNAME = getreg(name)
    if(strlen( MYNAME ) == 0)
    {
        MYNAME = Ask("Enter your name:")
        setreg(name, MYNAME)
    }
	description = Ask("Enter yor description:");
	if(MYNAME != "")
	{
		SysTime = GetSysTime(1)
	    Year = SysTime.Year
	    month = SysTime.month
	    day = SysTime.day

		//获取当前系统时间日期信息
	    hwnd = GetCurrentWnd()
		lnFirst = GetWndSelLnFirst(hwnd)
		lnLast = GetWndSelLnLast(hwnd)
		 
		hbuf = GetCurrentBuf()

		if(description == " ")
		{
			InsBufLine(hbuf, lnFirst, "/* added begin by @MYNAME@ in @Year@/@month@/@day@ */")
			InsBufLine(hbuf, lnLast+2, "/* added end by @MYNAME@ in @Year@/@month@/@day@ */")
			
		}
		else
		{
			InsBufLine(hbuf, lnFirst, "/* added begin by @MYNAME@ for @description@ in @Year@/@month@/@day@ */")
			InsBufLine(hbuf, lnLast+2, "/* added end by @MYNAME@ for @description@ in @Year@/@month@/@day@ */")
		}
	}
}

macro ModifyBy()
{
	MYNAME = getreg(name)
    if(strlen( MYNAME ) == 0)
    {
        MYNAME = Ask("Enter your name:")
        setreg(name, MYNAME)
    }
	description = Ask("Enter yor description:");
	if(MYNAME != "")
	{

		//获取当前系统时间日期信息
		SysTime = GetSysTime(1)
	    Year = SysTime.Year
	    month = SysTime.month
	    day = SysTime.day

	    hwnd = GetCurrentWnd()
		lnFirst = GetWndSelLnFirst(hwnd)
		lnLast = GetWndSelLnLast(hwnd)
		 
		hbuf = GetCurrentBuf()

		if(description == " ")
		{
			InsBufLine(hbuf, lnFirst, "/* modify begin by @MYNAME@ in @Year@/@month@/@day@ */")
			InsBufLine(hbuf, lnLast+2, "/* modify end by @MYNAME@ in @Year@/@month@/@day@ */")
			
		}
		else
		{
			InsBufLine(hbuf, lnFirst, "/* modify begin by @MYNAME@ for @description@ in @Year@/@month@/@day@ */")
			InsBufLine(hbuf, lnLast+2, "/* modify end by @MYNAME@ for @description@ in @Year@/@month@/@day@ */")
		}
	}
}

macro DeleteBy()
{
	MYNAME = getreg(name)
    if(strlen( MYNAME ) == 0)
    {
        MYNAME = Ask("Enter your name:")
        setreg(name, MYNAME)
    }
	description = Ask("Enter yor description:");
	if(MYNAME != "")
	{
		SysTime = GetSysTime(1)
	    Year = SysTime.Year
	    month = SysTime.month
	    day = SysTime.day

	    hwnd = GetCurrentWnd()
		lnFirst = GetWndSelLnFirst(hwnd)
		lnLast = GetWndSelLnLast(hwnd)
		 
		hbuf = GetCurrentBuf()

		if(description == " ")
		{
			InsBufLine(hbuf, lnFirst, "/* delete begin by @MYNAME@ in @Year@/@month@/@day@ */")
			InsBufLine(hbuf, lnFirst+1, "#if 0")
			InsBufLine(hbuf, lnLast+2, "#endif //if 0")
			InsBufLine(hbuf, lnLast+3, "/* delete end by @MYNAME@ in @Year@/@month@/@day@ */")
			
		}
		else
		{
			InsBufLine(hbuf, lnFirst, "/* delete begin by @MYNAME@ for @description@ in @Year@/@month@/@day@ */")
			InsBufLine(hbuf, lnFirst+1, "#if 0")
			InsBufLine(hbuf, lnLast+2, "#endif //if 0")
			InsBufLine(hbuf, lnLast+3, "/* delete end by @MYNAME@ for @description@ in @Year@/@month@/@day@ */")
		}
	}
}