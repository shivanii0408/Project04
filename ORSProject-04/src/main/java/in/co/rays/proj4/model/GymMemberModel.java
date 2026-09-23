package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import in.co.rays.proj4.bean.GymMemberBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class GymMemberModel extends BaseModel<GymMemberBean>  {

	@Override
	public long add(GymMemberBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;
		
		GymMemberBean existBean = findBymemberID(bean.getMemberId());

		if (existBean != null) {
			throw new DuplicateRecordException("gym member already exist");
		}
		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			int pk = nextPK();
			bean.setId(pk);

			PreparedStatement pstmt = conn.prepareStatement(
					"insert into " + getTable()
					+ " values(?,?,?,?,?)");

			  pstmt.setString(1, bean.getMemberId());
		        pstmt.setString(2, bean.getName());
		        pstmt.setString(3, bean.getMembershipType());
		        pstmt.setString(4, bean.getJoiningDate());
		        pstmt.setString(5, bean.getTrainerName());
		        
			pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {

			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return bean.getId();
	}

	@Override
	public String getTable() {

		return "gym_member";
	}

	@Override
	public GymMemberBean getBean() {

	    return new GymMemberBean();
	}



	@Override
	public void update(GymMemberBean bean) throws ApplicationException, DuplicateRecordException {
		 Connection conn = null;
		    
		 GymMemberBean existBean = findBymemberID(bean.getMemberId());

			if (existBean != null && existBean.getMemberId() != bean.getMemberId()) {
				throw new DuplicateRecordException("Member already exist");
			}

		    try {

		        conn = JDBCDataSource.getConnection();
		        conn.setAutoCommit(false);

		        PreparedStatement pstmt = conn.prepareStatement(
		                "update gym_member set name=?, membershipType=?, joiningDate=?, "
		               
		                + "trainerName=? where memberid=?");

		        
		        
		        pstmt.setString(1, bean.getName());
		        pstmt.setString(2, bean.getMembershipType());
		        pstmt.setString(3, bean.getJoiningDate());
		        pstmt.setString(4, bean.getTrainerName());
		        pstmt.setString(5, bean.getMemberId());
		     
		       

		        pstmt.executeUpdate();

		        conn.commit();

		        pstmt.close();

		    } catch (Exception e) {

		        try {

		            conn.rollback();

		        } catch (Exception ex) {

		            throw new ApplicationException(
		                    "Exception : Update rollback exception " + ex.getMessage());
		        }

		        throw new ApplicationException(
		                "Exception in updating Course " + e.getMessage());

		    } finally {

		        JDBCDataSource.closeConnection(conn);
		    }
		
	}

	@Override
	public Integer nextPK() throws DatabaseException {

	    int pk = 0;

	    try {
	        Connection conn = JDBCDataSource.getConnection();

	        PreparedStatement pstmt = conn.prepareStatement(
	                "SELECT MAX(memberid) FROM gym_member");

	        java.sql.ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            pk = rs.getInt(1);
	        }

	        rs.close();
	        pstmt.close();
	        conn.close();

	    } catch (Exception e) {
	        throw new DatabaseException("Exception in getting PK");
	    }

	    return pk + 1;
	}

	@Override
	public String getWhereClause(GymMemberBean bean) {
		StringBuffer sql = new StringBuffer(" ");

	    if (bean != null) {

	    	 if (bean.getMemberId() != null && bean.getMemberId().length() > 0) {
		            sql.append(" and member id like '" + bean.getMemberId() + "'");
		        }

	        if (bean.getName() != null && bean.getName().length() > 0) {
	            sql.append(" and name like '" + bean.getName() + "'");
	        }

	        if (bean.getMembershipType() != null && bean.getMembershipType().length() > 0) {
	            sql.append(" and Membership Type like '" + bean.getMembershipType() + "'");
	        }
	        
	        if (bean.getJoiningDate() != null && bean.getJoiningDate().length() > 0) {
	            sql.append(" and Joining Date like '" + bean.getJoiningDate() + "'");
	        }
	        
	        if (bean.getTrainerName() != null && bean.getTrainerName().length() > 0) {
	            sql.append(" and TrainerName like'" + bean.getTrainerName() + "'");
	        }
	    }

	    return sql.toString();
	}
	

	
	public GymMemberBean findBymemberID(String memberId) {

		GymMemberBean bean = findByUniqueColumn("MemberId", memberId);

		return bean;

		
	}
}