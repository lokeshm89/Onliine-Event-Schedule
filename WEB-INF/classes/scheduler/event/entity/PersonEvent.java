package scheduler.event.entity;

public class PersonEvent {

	private int personid;
	private int eventid;
	private boolean status;
	
	public PersonEvent(){	
		
	}

	
	public int getPersonid() {
		return personid;
	}

	public void setPersonid(int personid) {
		this.personid = personid;
	}

	


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}


	public int getEventid() {
		return eventid;
	}

	public void setEventid(int eventid) {
		this.eventid = eventid;
	}
	
	
	
}
