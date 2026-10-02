package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.GymMemberBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class GymMemberModel extends BaseModel<GymMemberBean> {

	@Override
	public long add(GymMemberBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			// Generate Member ID
			int pk = nextPK();
			bean.setMemberId(String.valueOf(pk));

			// Check duplicate Member ID
			GymMemberBean existBean = findBymemberID(bean.getMemberId());

			if (existBean != null) {
				throw new DuplicateRecordException("Gym member already exist");
			}

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

			pstmt.close();

		} catch (Exception e) {

			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return Long.parseLong(bean.getMemberId());
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
	public void update(GymMemberBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

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

				if (conn != null) {
					conn.rollback();
				}

			} catch (Exception ex) {

				throw new ApplicationException(
						"Exception : Update rollback exception "
						+ ex.getMessage());
			}

			throw new ApplicationException(
					"Exception in updating Gym Member "
					+ e.getMessage());

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

			throw new DatabaseException(
					"Exception in getting Member ID");
		}

		return pk + 1;
	}

	@Override
	public String getWhereClause(GymMemberBean bean) {

		StringBuffer sql = new StringBuffer(" ");

		if (bean != null) {

			if (bean.getMemberId() != null
					&& bean.getMemberId().length() > 0) {

				sql.append(" and memberid like '"
						+ bean.getMemberId() + "'");
			}

			if (bean.getName() != null
					&& bean.getName().length() > 0) {

				sql.append(" and name like '"
						+ bean.getName() + "'");
			}

			if (bean.getMembershipType() != null
					&& bean.getMembershipType().length() > 0) {

				sql.append(" and membershipType like '"
						+ bean.getMembershipType() + "'");
			}

			if (bean.getJoiningDate() != null
					&& bean.getJoiningDate().length() > 0) {

				sql.append(" and joiningDate like '"
						+ bean.getJoiningDate() + "'");
			}

			if (bean.getTrainerName() != null
					&& bean.getTrainerName().length() > 0) {

				sql.append(" and trainerName like '"
						+ bean.getTrainerName() + "'");
			}
		}

		return sql.toString();
	}

	public GymMemberBean findBymemberID(String memberId) {

		GymMemberBean bean =
				findByUniqueColumn("memberid", memberId);

		return bean;
	}
}