package javaexample;

import java.sql.Date;

public class memberinfo {
	    private String id;
	    private String password;
	    private String name;
	    private Date registerDate ;
	    private String email;
	    
	    public String getId() {
	        return id;
	    }
	    public void setId(String val) {
	        this.id = val;
	    }
	    public String getPassword() { // 수정
	        return password;
	    }
	    public void setPassword(String val) { // 수정
	        this.password = val;
	    }
	    public String getName() { // 수정
	        return name;
	    }
	    public void setName(String val) { // 수정
	        this.name = val;
	    }
	    public Date getRegisterDate() { // 수정
	        return registerDate;
	    }
	    public void setRegisterDate(Date val) { // 수정
	        this.registerDate = val;
	    }
	    public String getEmail() { // 수정
	        return email;
	    }
	    public void setEmail(String val) { // 수정
	        this.email = val;
	    }
	}

