package in.co.rays.proj4.bean;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;


public class TimeTableBean extends BaseBean {

	private String semester;
	private String description;
	private Date examDate;
	private String examTime;
	private long courseId;
	private String courseName;
	private int subjectId;
	private String subjectName;

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date  getExamDate() {
		return examDate;
	}

	public void setExamDate(Date date) {
		this.examDate = date;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public void setResultset(ResultSet rs) {
		try {
			super.setResultset(rs);
			this.setSemester(rs.getString("semester"));
			this.setDescription(rs.getString("description"));
			this.setExamDate(rs.getDate("exam_date"));
			this.setExamTime(rs.getString("exam_time"));
			this.setCourseId(rs.getLong("course_id"));
			this.setCourseName(rs.getString("course_name"));
			this.setSubjectId(rs.getInt("subject_id"));
			this.setSubjectName(rs.getString("subject_name"));

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String getValue() {
		return null;
	}

}