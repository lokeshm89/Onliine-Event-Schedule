package scheduler.event.entity;

public class Venue implements java.io.Serializable{
	 
	private static final long serialVersionUID = 1L;
		private String venueName;
		private String venueDescription;
		private String venueType;
		private String venueState;
		
		public Venue(String venueName, String venueDescription, String venueType, String venueState){
		this.venueName = venueName;
		this.venueDescription = venueDescription;
		this.venueType = venueType;
		this.venueState = venueState;		
			
		}
		public String getVenueName() {
			return venueName;
		}
		public void setVenueName(String venueName) {
			this.venueName = venueName;
		}
		public String getVenueDescription() {
			return venueDescription;
		}
		public void setVenueDescription(String venueDescription) {
			this.venueDescription = venueDescription;
		}
		public String getVenueType() {
			return venueType;
		}
		public void setVenueType(String venueType) {
			this.venueType = venueType;
		}
		public String getVenueState() {
			return venueState;
		}
		public void setVenueState(String venueState) {
			this.venueState = venueState;
		}
				
}
