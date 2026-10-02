package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.VoterBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class VoterModel extends BaseModel<VoterBean> {

	@Override
	public long add(VoterBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			// Generate Voter ID
			int pk = nextPK();
			bean.setVoterId(String.valueOf(pk));

			// Check duplicate Voter ID
			VoterBean existBean = findByvoterID(bean.getVoterId());

			if (existBean != null) {
				throw new DuplicateRecordException(
						"Voter already exist");
			}

			PreparedStatement pstmt = conn.prepareStatement(
					"insert into " + getTable()
					+ " values(?,?,?,?,?)");

			pstmt.setString(1, bean.getVoterId());
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getConstituency());
			pstmt.setBoolean(5, bean.isHasVoted());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return Long.parseLong(bean.getVoterId());
	}

	@Override
	public String getTable() {

		return "voter_data";
	}

	@Override
	public VoterBean getBean() {

		return new VoterBean();
	}

	@Override
	public void update(VoterBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"update voter_data set name=?, age=?, constituency=?, "
					+ "hasVoted=? where voterid=?");

			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getAge());
			pstmt.setString(3, bean.getConstituency());
			pstmt.setBoolean(4, bean.isHasVoted());
			pstmt.setString(5, bean.getVoterId());

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
					"Exception in updating Voter "
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
					"SELECT MAX(voterid) FROM voter_data");

			java.sql.ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				pk = rs.getInt(1);
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {

			throw new DatabaseException(
					"Exception in getting Voter ID");
		}

		return pk + 1;
	}

	@Override
	public String getWhereClause(VoterBean bean) {

		StringBuffer sql = new StringBuffer(" ");

		if (bean != null) {

			if (bean.getVoterId() != null
					&& bean.getVoterId().length() > 0) {

				sql.append(" and voterid like '"
						+ bean.getVoterId() + "'");
			}

			if (bean.getName() != null
					&& bean.getName().length() > 0) {

				sql.append(" and name like '"
						+ bean.getName() + "'");
			}

			if (bean.getAge() > 0) {

				sql.append(" and age = "
						+ bean.getAge());
			}

			if (bean.getConstituency() != null
					&& bean.getConstituency().length() > 0) {

				sql.append(" and constituency like '"
						+ bean.getConstituency() + "'");
			}

			if (bean.isHasVoted()) {

				sql.append(" and hasVoted = true");
			}
		}

		return sql.toString();
	}

	public VoterBean findByvoterID(String voterId) {

		VoterBean bean =
				findByUniqueColumn("voterid", voterId);

		return bean;
	}
}