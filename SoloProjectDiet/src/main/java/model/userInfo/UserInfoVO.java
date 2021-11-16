package model.userInfo;

import org.springframework.web.multipart.MultipartFile;

public class UserInfoVO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String path;
	private MultipartFile FileUpload;
	
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public MultipartFile getFileUpload() {
		return FileUpload;
	}
	public void setFileUpload(MultipartFile fileUpload) {
		FileUpload = fileUpload;
	}
	@Override
	public String toString() {
		return "UserInfoVO [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", path=" + path
				+ ", FileUpload=" + FileUpload + "]";
	}
	
	
	
	
	
	
	
	
}
