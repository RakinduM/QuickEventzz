    var calendar;
    var Calendar = FullCalendar.Calendar;
    var events = [];
    $(function() {
        if (!!scheds) {
            Object.keys(scheds).map(k => {
                var row = scheds[k]
                events.push({ id: row.id, title: row.title, description: row.description, start: row.start_datetime, end: row.end_datetime });
            })
        }
        var date = new Date()
        var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear()

        calendar = new Calendar(document.getElementById('calendar'), {
            headerToolbar: {
                left: 'prev,next today',
                right: 'dayGridMonth,dayGridWeek,list',
                center: 'title',
            },
            selectable: true,
            themeSystem: 'bootstrap',
            //Random default events
            events: events,
            eventClick: function(info) {
                var _details = $('#event-details-modal');
			    var event = info.event; // Access the clicked event
			
			    // Populate the modal with event information
			    _details.find('#title').text(event.title);
			    _details.find('#description').text(event.extendedProps.description);
			    _details.find('#start').text(event.start.toLocaleString());
			    _details.find('#end').text(event.end.toLocaleString());
			    _details.find('#edit, #delete').attr('data-id', event.id);
			    _details.modal('show');
            },
            
            eventDidMount: function(info) {
                // Do Something after events mounted
            },
            editable: true
        });

        calendar.render();

        // Form reset listener
        $('#schedule-form').on('reset', function() {
            $(this).find('input:hidden').val('')
            $(this).find('input:visible').first().focus()
        })

        // Edit Button
        $('#edit').click(function() {
	    var id = $(this).attr('data-id');
	    var event = calendar.getEventById(id); // Get the event by ID from FullCalendar
	
	    if (event) {
	        var _form = $('#schedule-form');
	        _form.find('[name="id"]').val(event.id);
	        _form.find('[name="title"]').val(event.title);
	        _form.find('[name="description"]').val(event.extendedProps.description);
	        _form.find('[name="start_datetime"]').val(event.start.toISOString().slice(0, 16));
	        _form.find('[name="end_datetime"]').val(event.end.toISOString().slice(0, 16));
	        $('#event-details-modal').modal('hide');
	        _form.find('[name="title"]').focus();
	    } else {
	        alert("Event is undefined");
	    }
	});
		

        $('#delete').click(function() {
		    var id = $(this).attr('data-id');
		    var event = calendar.getEventById(id); // Get the event by ID from FullCalendar
		    
		    if (event) {
		        // Set the event ID to the input field in the form
	            $('#delete-event-id').val(event.id);
	            // Submit the form
	            $('#delete-form').submit();
		    } else {
		        alert("Event is undefined");
		    }
		});
    });