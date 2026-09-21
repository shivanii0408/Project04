package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.TimeTableBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class TimeTableModel extends BaseModel<TimeTableBean> {

	@Override
	public long add(TimeTableBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		TimeTableBean existBean = findBySemester(bean.getSemester());

		if (existBean != null) {
			throw new DuplicateRecordException("semester already exist");
		}

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn
					.prepareStatement("insert into " + getTable() + " values(?,?,?,?,?,?,?,?,?,?,?,?,?)");

			long pk = nextPK();

			pstmt.setLong(1, pk);
			pstmt.setString(2, bean.getSemester());
			pstmt.setString(3, bean.getDescription());
			pstmt.setDate(4, new java.sql.Date(bean.getExamDate().getTime()));
			pstmt.setString(5, bean.getExamTime());
			pstmt.setLong(6, bean.getCourseId());
			pstmt.setString(7, bean.getCourseName());
			pstmt.setLong(8, bean.getSubjectId());
			pstmt.setString(9, bean.getSubjectName());
			pstmt.setString(10, bean.getCreatedBy());
			pstmt.setString(11, bean.getModifiedBy());
			pstmt.setTimestamp(12, bean.getCreatedDatetime());
			pstmt.setTimestamp(13, bean.getModifiedDatetime());

			pstmt.executeUpdate();

			conn.commit();

			bean.setId(pk);

		} catch (Exception e) {

			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return bean.getId();
	}

	public TimeTableBean findBySemester(String semester) throws ApplicationException {
		TimeTableBean bean = findByUniqueColumn("semester", semester);
		return bean;
	}

	@Override
	public String getTable() {
		return "st_timetable";
	}

	@Override
	public void update(TimeTableBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("update " + getTable()
					+ " set semester = ?,description = ?,exam_date = ?, exam_time = ?, course_id = ?, course_name = ?, subject_id = ?, subject_name = ?,modified_By = ?,modified_DateTime = ? where id = ?");

			pstmt.setString(1, bean.getSemester());
			pstmt.setString(2, bean.getDescription());
//			pstmt.setString(3, bean.getCreatedBy());
			pstmt.setDate(3, new java.sql.Date(bean.getExamDate().getTime()));
			pstmt.setString(4, bean.getExamTime());
			pstmt.setLong(5, bean.getCourseId());
			pstmt.setString(6, bean.getCourseName());
			pstmt.setLong(7, bean.getSubjectId());
			pstmt.setString(8, bean.getSubjectName());
			pstmt.setString(9, bean.getModifiedBy());
//			pstmt.setTimestamp(5, bean.getCreatedDateTime());
			pstmt.setTimestamp(10, bean.getModifiedDatetime());
			pstmt.setLong(11, bean.getId());

			pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
	}

	@Override
	public String getWhereClause(TimeTableBean bean) {
		StringBuffer sql = new StringBuffer("");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" and id = " + bean.getId());
			}
			if (bean.getSemester() != null && bean.getSemester().length() > 0) {
				sql.append(" and semester like '" + bean.getSemester() + "%'");
			}
			if (bean.getDescription() != null && bean.getDescription().length() > 0) {
				sql.append(" and description like '" + bean.getDescription() + "%'");
			}
//			if (bean.getExamDate() != null && bean.getExamDate().length() > 0) {
//				sql.append(" and description like '" + bean.getExamDate() + "%'");
//			}
			if (bean.getExamTime() != null && bean.getExamTime().length() > 0) {
				sql.append(" and examTime like '" + bean.getExamTime() + "%'");
			}
			if (bean.getCourseId() > 0) {
				sql.append(" and courseId like '" + bean.getCourseId() + "%'");
			}
			if (bean.getCourseName() != null && bean.getCourseName().length() > 0) {
				sql.append(" and courseName like '" + bean.getCourseName() + "%'");
			}
			if (bean.getSubjectId() > 0) {
				sql.append(" and description like '" + bean.getDescription() + "%'");
			}
			if (bean.getSubjectName() != null && bean.getSubjectName().length() > 0) {
				sql.append(" and subjectName like '" + bean.getSubjectName() + "%'");
			}
		}

		return sql.toString();
	}

	@Override
	public TimeTableBean getBean() {
		return new TimeTableBean();
	}

}