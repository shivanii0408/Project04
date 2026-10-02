package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.PatientBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class PatientModel extends BaseModel<PatientBean> {

	@Override
	public long add(PatientBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

		
			int pk = nextPK();
			bean.setPatientId(String.valueOf(pk));

		
			PatientBean existBean = findByPatientID(bean.getPatientId());

			if (existBean != null) {
				throw new DuplicateRecordException("Patient already exist");
			}

			PreparedStatement pstmt = conn.prepareStatement(
					"insert into " + getTable()
					+ " values(?,?,?,?,?)");

			pstmt.setString(1, bean.getPatientId());
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getBloodGroup());
			pstmt.setString(5, bean.getDisease());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return Long.parseLong(bean.getPatientId());
	}

	
	
	private PatientBean findByPatientID(String patientId) {
		
		return null;
	}

	
	
	@Override
	public String getTable() {

		return "patient_data";
	}

	
	
	@Override
	public PatientBean getBean() {

		return new PatientBean();
	}

	

	@Override
	public Integer nextPK() throws DatabaseException {

		int pk = 0;

		try {

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT MAX(patientid) FROM patient_data");

			java.sql.ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				pk = rs.getInt(1);
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {

			throw new DatabaseException(
					"Exception in getting Patient ID");
		}

		return pk + 1;
	}


	

	@Override
	public void update(PatientBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"update patient_data set name=?, age=?, bloodGroup=?, "
					+ "disease=? where patientid=?");

			
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getAge());
			pstmt.setString(3, bean.getBloodGroup());
			pstmt.setString(4, bean.getDisease());
			pstmt.setString(5, bean.getPatientId());
			
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
					"Exception in updating Patient "
					+ e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}
		
	}

	@Override
	public String getWhereClause(PatientBean bean) {
		StringBuffer sql = new StringBuffer(" ");

		if (bean != null) {

			if (bean.getPatientId() != null
					&& bean.getPatientId().length() > 0) {

				sql.append(" and patientid like '"
						+ bean.getPatientId() + "'");
			}

			if (bean.getName() != null
					&& bean.getName().length() > 0) {

				sql.append(" and name like '"
						+ bean.getName() + "'");
			}
			
			if (bean.getBloodGroup() != null
					&& bean.getBloodGroup().length() > 0) {

				sql.append(" and BloodGroup like '"
						+ bean.getBloodGroup() + "'");
			}
			
			
			if (bean.getAge() > 0) {
			    sql.append(" and age = " + bean.getAge());
			}
			
			if (bean.getDisease() != null
					&& bean.getDisease().length() > 0) {

				sql.append(" and disease like '"
						+ bean.getDisease() + "'");
			}

		}

		return sql.toString();
		
	}
}