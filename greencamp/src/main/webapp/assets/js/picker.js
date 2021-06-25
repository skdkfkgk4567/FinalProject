/**
 * 
 */
 

		function check()
		{
			var DateInput = $('.t-datepicker').tDatePicker("getDates");

			var startDate = formatDate(DateInput[0]);
			var endDate = formatDate(DateInput[1]);
			document.getElementById("startDe").value=formatDate(DateInput[0]);
			document.getElementById("endDe").value=formatDate(DateInput[1]);
			var FORMAT = "-";
	        if (startDate.length != 10 || endDate.length != 10)
	        {
	        	return null;
	        }
	        if (startDate.indexOf(FORMAT) < 0 ||  endDate.indexOf(FORMAT) < 0)
	        {
	        	return null;
	        }
	        var start_dt = startDate.split(FORMAT);
	        var end_dt = endDate.split(FORMAT);
	        start_dt[1] = (Number(start_dt[1]) - 1) + "";
	        end_dt[1] = (Number(end_dt[1]) - 1) + "";
	        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
	        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
	        var bakil = (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
	        document.getElementById("sukbak").innerText = '총 숙박일 : '+(bakil)+'박 '+(bakil+1)+'일';
	        document.getElementById("sukbakDe").value = bakil;
		}
		
		function formatDate(userDate)
		{
			var d = new Date(userDate);
			var dY = d.getFullYear();
			var dM = d.getMonth()+1;
			var stringdM = dM.toString();
			if(stringdM.length==1)
			{
				stringdM = '0'+stringdM;
			}
			
			var dD = d.getDate();
			var stringdD = dD.toString();
			if(stringdD.length==1)
			{
				stringdD = '0'+stringdD;
			}
			var date = dY+'-'+stringdM+'-'+stringdD;
			return date;
		}
		
		function formatDate(userDate)
		{
			var d = new Date(userDate);
			var dY = d.getFullYear();
			var dM = d.getMonth()+1;
			var stringdM = dM.toString();
			if(stringdM.length==1)
			{
				stringdM = '0'+stringdM;
			}
			
			var dD = d.getDate();
			var stringdD = dD.toString();
			if(stringdD.length==1)
			{
				stringdD = '0'+stringdD;
			}
			var date = dY+'-'+stringdM+'-'+stringdD;
			return date;
		}
		
		$(function() {

			$('.t-datepicker').tDatePicker(
					{

						autoClose : true,
						durationArrowTop : 200,
						numCalendar : 2,
						titleCheckIn : '체크인',
						titleCheckOut : '체크아웃',
						titleToday : '오늘',
						titleDateRange : '박',
						titleDateRanges : '박',
						titleDays : [ '월', '화', '수', '목', '금', '토', '일' ],
						titleMonths : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						titleMonthsLimitShow : 3,
						replaceTitleMonths : null,
						showDateTheme : 'yyyy년 mm월 dd일',
						iconArrowTop : true,
						iconDate : '&#x279C;',
						arrowPrev : '&#x276E;',
						arrowNext : '&#x276F;',
						toDayShowTitle : true,
						dateRangesShowTitle : true,
						toDayHighlighted : false,
						nextDayHighlighted : false,
						daysOfWeekHighlighted : [ 0, 6 ],
						dateCheckIn : null,
						dateCheckOut : null,
						startDate : null,
						endDate : null,
						limitPrevMonth : 0,
						limitNextMonth : 11,
						limitDateRanges : 31,
						showFullDateRanges : false,
						fnDataEvent : null
					});

		});
		