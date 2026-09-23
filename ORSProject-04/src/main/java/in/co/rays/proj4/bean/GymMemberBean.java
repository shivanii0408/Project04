package in.co.rays.proj4.bean;


import java.sql.ResultSet;
import java.sql.SQLException;

public class GymMemberBean extends BaseBean { 

	private String memberId;
	private String name;
	private String membershipType;
	private String joiningDate;
	private String trainerName;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMembershipType() {
		return membershipType;
	}
	public void setMembershipType(String membershipType) {
		this.membershipType = membershipType;
	}
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	public String getTrainerName() {
		return trainerName;
	}
	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
	
	
 public void setResultset(ResultSet rs) {

	    try {
	        super.setResultset(rs);
	        this.setMemberId("memberId");
	        this.setName(rs.getString("NAME"));
	        this.setMembershipType(rs.getString("MembershipType"));
	        this.setJoiningDate(rs.getString("JoiningDate"));
	        this.setTrainerName(rs.getString("TrainerName"));

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
@Override
public String getValue() {

	return null;
}
 }
	

