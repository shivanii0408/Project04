package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class MarksheetModel extends BaseModel<MarksheetBean> {

	@Override
	public long add(MarksheetBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		int pk = 0;

		MarksheetBean existBean = findByRollNo(bean.getRollNo());

		if (existBean != null) {
			throw new DuplicateRecordException("marksheet already exist");
		}

		try {
			conn = JDBCDataSource.getConnection();

			pk = nextPK();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ST_MARKSHEET VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getRollNo());
			pstmt.setLong(3, bean.getStudentId());
			pstmt.setString(4, bean.getName());
			pstmt.setInt(5, bean.getPhysics());
			pstmt.setInt(6, bean.getChemistry());
			pstmt.setInt(7, bean.getMaths());
			pstmt.setString(8, bean.getCreatedBy());
			pstmt.setString(9, bean.getModifiedBy());
			pstmt.setTimestamp(10, bean.getCreatedDatetime());
			pstmt.setTimestamp(11, bean.getModifiedDatetime());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException("add rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception in add marksheet");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		return pk;
	}

	@Override
	public void update(MarksheetBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		MarksheetBean existBean = findByRollNo(bean.getRollNo());

		if (existBean != null && existBean.getId() != bean.getId()) {
			throw new DuplicateRecordException("marksheet already exist");
		}

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement("update st_marksheet set roll_no=?, student_id=?, name=?, "
					+ "physics=?, chemistry=?, maths=?, created_by=?, "
					+ "modified_by=?, created_datetime=?, modified_datetime=? " + "where id=?");

			pstmt.setString(1, bean.getRollNo());
			pstmt.setLong(2, bean.getStudentId());
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getPhysics());
			pstmt.setInt(5, bean.getChemistry());
			pstmt.setInt(6, bean.getMaths());
			pstmt.setString(7, bean.getCreatedBy());
			pstmt.setString(8, bean.getModifiedBy());
			pstmt.setTimestamp(9, bean.getCreatedDatetime());
			pstmt.setTimestamp(10, bean.getModifiedDatetime());
			pstmt.setLong(11, bean.getId());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			try {

				if (conn != null) {
					conn.rollback();
				}

			} catch (Exception ex) {

				throw new ApplicationException("Update rollback exception " + ex.getMessage());
			}

			throw new ApplicationException("Exception in updating Marksheet " + e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}
	}

	public MarksheetBean findByRollNo(String rollNo) {
		// TODO Auto-generated method stub

		MarksheetBean bean = findByUniqueColumn("roll_no", rollNo);

		return bean;

	}

	@Override
	public String getTable() {
		return "st_marksheet";
	}

	@Override
	public MarksheetBean getBean() {
		return new MarksheetBean();
	}

	@Override
	public String getWhereClause(MarksheetBean bean) {

		StringBuffer sql = new StringBuffer(" ");

		if (bean != null) {

			if (bean.getId() > 0) {
				sql.append(" and id = " + bean.getId());
			}

			if (bean.getRollNo() != null && bean.getRollNo().length() > 0) {
				sql.append(" and roll_no like '" + bean.getRollNo() + "'");
			}

			if (bean.getStudentId() != null && bean.getStudentId() > 0) {
				sql.append(" and student_id = " + bean.getStudentId());
			}

			if (bean.getName() != null && bean.getName().length() > 0) {
				sql.append(" and name like '" + bean.getName() + "'");
			}

			if (bean.getPhysics() > 0) {
				sql.append(" and physics = " + bean.getPhysics());
			}

			if (bean.getChemistry() > 0) {
				sql.append(" and chemistry = " + bean.getChemistry());
			}

			if (bean.getMaths() > 0) {
				sql.append(" and maths = " + bean.getMaths());
			}
		}

		return sql.toString();
	}
}
