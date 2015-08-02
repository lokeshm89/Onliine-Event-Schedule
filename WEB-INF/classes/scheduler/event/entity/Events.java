package scheduler.event.entity;


public class Events implements java.io.Serializable{


	private static final long serialVersionUID = 1L;
	private String eventName;
	private String eventDescription;
	private String eventLocation;
	private String eventDate;
	private int personid;
	private String status = "Pending";
		
    public Events (){
    	
    	
    }
	public Events(String eventName, String eventDescription,String eventLocation, String eventDate) {
	
		this.eventName = eventName;
		this.eventDescription = eventDescription;
		this.eventLocation = eventLocation;
		this.eventDate = eventDate;
	}

	public Events(String eventName, String eventDescription,String eventLocation, String eventDate, String status) {
		
		this.eventName = eventName;
		this.eventDescription = eventDescription;
		this.eventLocation = eventLocation;
		this.eventDate = eventDate;
		this.status = status;
	}
	
    public Events(int personid,String eventName, String eventDescription,String eventLocation, String eventDate, String status) {
		
    	this.personid = personid;
		this.eventName = eventName;
		this.eventDescription = eventDescription;
		this.eventLocation = eventLocation;
		this.eventDate = eventDate;
		this.status = status;
		
	}
	
	public int getPersonid() {
		return personid;
	}

	public void setPersonid(int personid) {
		this.personid = personid;
	}

	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public String getEventLocation() {
		return eventLocation;
	}
	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
