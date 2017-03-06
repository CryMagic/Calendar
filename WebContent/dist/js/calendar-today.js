$(function () {
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    $('#fullcalendar').fullCalendar({
    		locale: 'vi_VN',	
		    header: {
		      left: 'prev,next today',
		      center: 'title'
		    },
		    //Random default events
		    events: [
				{
				    title: 'Birthday Party',
				    start: new Date(y, m, d + 1, 19, 0),
				    end: new Date(y, m, d + 1, 22, 30),
				    allDay: false,
				    backgroundColor: "#00a65a", //Success (green)
				    borderColor: "#00a65a" //Success (green)
				},
		    ], 
		    eventMouseover: function(event, jsEvent, view){
		    	
		    	
		    }
	   });
  });