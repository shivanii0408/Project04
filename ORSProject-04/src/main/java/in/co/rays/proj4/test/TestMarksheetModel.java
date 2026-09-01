package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;


import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.model.MarksheetModel;

public class TestMarksheetModel {

	public static void main(String[] args) {

		// testAdd();
		// testUpdate();
		//testDelete();
		//testFindByPk();
		//testfindByRollNo();
		 testSearch();
	}

	private static void testSearch() {
		// TODO Auto-generated method stub
		MarksheetModel model = new MarksheetModel();
		MarksheetBean bean = new MarksheetBean();
		
		bean.setRollNo("0524795");
		
		List<MarksheetBean> list = model.search(bean, 1, 5);

		Iterator<MarksheetBean> it = list.iterator();
		while (it.hasNext()) {
			bean = it.next();
			System.out.println(bean.getId());
			System.out.println(bean.getRollNo());
			System.out.println(bean.getStudentId());
			System.out.println(bean.getName());
			System.out.println(bean.getPhysics());
			System.out.println(bean.getChemistry());
			System.out.println(bean.getMaths());
		}
		
	}

	private static void testAdd() {

		MarksheetModel model = new MarksheetModel();
		MarksheetBean bean = new MarksheetBean();

		bean.setRollNo("0524795");
		bean.setStudentId((long) 58);
		bean.setName("Anjali");
		bean.setPhysics(85);
		bean.setChemistry(89);
		bean.setMaths(94);
		bean.setCreatedBy("anjali");
		bean.setModifiedBy("admin");
		bean.setCreatedDatetime(new Timestamp(System.currentTimeMillis()));
		bean.setModifiedDatetime(new Timestamp(System.currentTimeMillis()));

		model.add(bean);

//		System.out.println("Marksheet Added Successfully");
	}

	private static void testDelete() {

		MarksheetModel model = new MarksheetModel();

		model.delete(2);

	}

	private static void testUpdate() {

		MarksheetModel model = new MarksheetModel();

		MarksheetBean bean = new MarksheetBean();

		bean.setRollNo("0483982");
		bean.setStudentId((long) 47);
		bean.setName("Shivani");
		bean.setPhysics(45);
		bean.setChemistry(67);
		bean.setMaths(56);

		bean.setCreatedBy("shivani");
		bean.setModifiedBy("shivani");
		bean.setCreatedDatetime(new Timestamp(System.currentTimeMillis()));
		bean.setModifiedDatetime(new Timestamp(System.currentTimeMillis()));

		model.update(bean);

	}
	
	public static void testFindByPk() {

		MarksheetModel model = new MarksheetModel();

		MarksheetBean bean = new MarksheetBean();

		bean = model.findByPK(3);

		System.out.println(bean.getId());
		System.out.println(bean.getRollNo());
		System.out.println(bean.getStudentId());
		System.out.println(bean.getName());
		System.out.println(bean.getPhysics());
		System.out.println(bean.getChemistry());
		System.out.println(bean.getMaths());

	}

	public static void testfindByRollNo() {

		MarksheetModel model = new MarksheetModel();

		MarksheetBean bean = new MarksheetBean();

		bean = model.findByRollNo("0483982");

		System.out.println(bean.getId());
		System.out.println(bean.getRollNo());
		System.out.println(bean.getStudentId());
		System.out.println(bean.getName());
		System.out.println(bean.getPhysics());
		System.out.println(bean.getChemistry());
		System.out.println(bean.getMaths());
	}
}
