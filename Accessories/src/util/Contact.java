package util;

public class Contact {

	private String name, email, subject, message;
	private Boolean privacy;

	public Contact(String name, String email, String subject, String message, Boolean privacy) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.privacy = privacy;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getSubject() {
		return subject;
	}

	public String getMessage() {
		return message;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Boolean getPrivacy() {
		return privacy;
	}

	public void setPrivacy(Boolean privacy) {
		this.privacy = privacy;
	}
}
