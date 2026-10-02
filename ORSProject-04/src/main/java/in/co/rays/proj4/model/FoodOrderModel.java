package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.FoodOrderBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class FoodOrderModel extends BaseModel<FoodOrderBean> {

	@Override
	public long add(FoodOrderBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			// Generate Order ID
			int pk = nextPK();
			bean.setOrderId(String.valueOf(pk));

			// Check duplicate Order ID
			FoodOrderBean existBean = findByOrderId(bean.getOrderId());

			if (existBean != null) {
				throw new DuplicateRecordException(
						"Food Order already exists");
			}

			PreparedStatement pstmt = conn.prepareStatement(
					"insert into " + getTable()
					+ " values(?,?,?,?,?)");

			pstmt.setString(1, bean.getOrderId());
			pstmt.setString(2, bean.getCustomerName());
			pstmt.setString(3, bean.getRestaurant());
			pstmt.setDouble(4, bean.getOrderAmount());
			pstmt.setString(5, bean.getDeliveryStatus());

			pstmt.executeUpdate();

			conn.commit();
			pstmt.close();

		} catch (Exception e) {

			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

			throw new ApplicationException(
					"Exception in adding Food Order " + e.getMessage());

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return Long.parseLong(bean.getOrderId());
	}

	@Override
	public String getTable() {
		return "food_order";
	}

	@Override
	public FoodOrderBean getBean() {
		return new FoodOrderBean();
	}

	@Override
	public Integer nextPK() throws DatabaseException {

		int pk = 0;

		try {
			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT MAX(orderid) FROM food_order");

			java.sql.ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				pk = rs.getInt(1);
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {

			e.printStackTrace();

			throw new DatabaseException(
					"Exception in getting Order ID: " + e.getMessage());
		}

		return pk + 1;
	}
	
	public FoodOrderBean findByOrderId(String orderId) {

		FoodOrderBean bean =
				findByUniqueColumn("orderid", orderId);

		return bean;
	}

	@Override
	public void update(FoodOrderBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"update food_order set customerName=?, "
					+ "restaurant=?, orderAmount=?, "
					+"deliveryStatus=? where orderid=?");

			pstmt.setString(1, bean.getCustomerName());
			pstmt.setString(2, bean.getRestaurant());
			pstmt.setDouble(3, bean.getOrderAmount());
			pstmt.setString(4, bean.getDeliveryStatus());
			pstmt.setString(5, bean.getOrderId());

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
					"Exception in updating food order "
					+ e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}
	}

	@Override
	public String getWhereClause(FoodOrderBean bean) {

		StringBuffer sql = new StringBuffer(" ");

		if (bean != null) {

			if (bean.getOrderId() != null
					&& bean.getOrderId().length() > 0) {

				sql.append(" and orderid like '"
				        + bean.getOrderId() + "'");
			}

			if (bean.getCustomerName() != null
					&& bean.getCustomerName().length() > 0) {

				sql.append(" and customerName like '"
						+ bean.getCustomerName() + "%'");
			}

			if (bean.getRestaurant() != null
					&& bean.getRestaurant().length() > 0) {

				sql.append(" and restaurant like '"
						+ bean.getRestaurant() + "%'");
			}

			if (bean.getOrderAmount() != null
					&& bean.getOrderAmount() > 0) {

				sql.append(" and orderAmount = "
						+ bean.getOrderAmount());
			}

			if (bean.getDeliveryStatus() != null
					&& bean.getDeliveryStatus().length() > 0) {

				sql.append(" and deliveryStatus like '"
						+ bean.getDeliveryStatus() + "%'");
			}
		}

		return sql.toString();
	}
}