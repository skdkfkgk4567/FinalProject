package greencamp.page;

public class PageModule
{
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String camp_nm)
	{
		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt / listSize) + 1;
		
		if (totalCnt % listSize == 0)
		{
			totalPage--;
		}

		int userGroup = cp / pageSize;
		if (cp % pageSize == 0)
		{
			userGroup--;
		}
		
		
		if (userGroup != 0)
		{
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?camp_nm="+camp_nm+"&cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'><img alt=\'lt\' src=\'https://vga9354.synology.me:9898/img/fp.gif\'></a>");
		}
		for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++)
		{
			if(i==cp)
			{
				sb.append("<span class=selected>");
				sb.append(i);
				sb.append("</span>");
			}
			else
			{
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?camp_nm="+camp_nm+"&cp=");
				sb.append(i);
				sb.append("' class=notselected>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
			}
			
			if (i == totalPage)
			{
				break;
			}
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0)))
		{
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?camp_nm="+camp_nm+"&cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'><img src=\'https://vga9354.synology.me:9898/img/lp.gif\'></a>");
		}
		return sb.toString();
	}
	public static String makeThemePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String nat, String fac)
	{
		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt / listSize) + 1;
		nat = nat.replaceAll("\\[", "%5B");
		nat = nat.replaceAll("\\]", "%5D");
		fac = fac.replaceAll("\\[", "%5B");
		fac = fac.replaceAll("\\]", "%5D");
		if (totalCnt % listSize == 0)
		{
			totalPage--;
		}

		int userGroup = cp / pageSize;
		if (cp % pageSize == 0)
		{
			userGroup--;
		}
		
		
		if (userGroup != 0)
		{
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?facilities="+fac+"&nature="+nat+"&cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'><img alt=\'lt\' src=\'https://vga9354.synology.me:9898/img/fp.gif\'></a>");
		}
		for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++)
		{
			if(i==cp)
			{
				sb.append("<span class=selected>");
				sb.append(i);
				sb.append("</span>");
			}
			else
			{
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?facilities="+fac+"&nature="+nat+"&cp=");
				sb.append(i);
				sb.append("' class=notselected>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
			}
			if (i == totalPage)
			{
				break;
			}
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0)))
		{
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?facilities="+fac+"&nature="+nat+"&cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'><img src=\'https://vga9354.synology.me:9898/img/lp.gif\'></a>");
		}
		return sb.toString();
	}
}