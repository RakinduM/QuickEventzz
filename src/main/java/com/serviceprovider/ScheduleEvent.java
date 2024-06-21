package com.serviceprovider;

public class ScheduleEvent {
	private int id;
    private String title;
    private String description;
    private String startDateTime;
    private String endDateTime;

    public ScheduleEvent(int id, String title, String description, String startDateTime, String endDateTime) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getStartDateTime() {
        return startDateTime;
    }

    public String getEndDateTime() {
        return endDateTime;
    }
}
