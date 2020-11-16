/* utils.em - 常用编辑宏的集合*/

// #ifdef插入指定宏定义的宏（在macro中显示）
macro InsertIfdef()
{
	sz = Ask("Enter ifdef condition:")
	if (sz != "")
		IfdefSz(sz);
}

// #ifdef定义插入C++宏（在macro中显示）
macro InsertCPlusPlus()
{
	IfdefSz("__cplusplus");
}

// #ifdef实现插入指定字符串的宏（不显示在macro中）
macro IfdefSz(sz)
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	 
	hbuf = GetCurrentBuf()
	InsBufLine(hbuf, lnFirst, "#ifdef @sz@")
	InsBufLine(hbuf, lnLast+2, "#endif /* @sz@ */")
}