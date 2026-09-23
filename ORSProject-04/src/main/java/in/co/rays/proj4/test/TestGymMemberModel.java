package in.co.rays.proj4.test;

import in.co.rays.proj4.bean.GymMemberBean;
import in.co.rays.proj4.model.GymMemberModel;
import in.co.rays.proj4.model.MarksheetModel;

public class TestGymMemberModel {

	public static void main(String[] args) {
		
		
		//testAdd();
		//testUpdate();
		testDelete();
	}

	private static void testDelete() {

		GymMemberModel model =  new GymMemberModel();

		model.delete(1);

	}


	private static void testUpdate() {
		
		GymMemberModel model =  new GymMemberModel();
		GymMemberBean bean= new GymMemberBean();
		
		bean.setMemberId("1");
		bean.setName("Shivani");
		bean.setMembershipType("Quaterly");
		bean.setJoiningDate("12/08/2026");
		bean.setTrainerName("Ankit");
		
		model.update(bean);
		
	}
		
	

	private static void testAdd() {

		GymMemberModel model =  new GymMemberModel();
		GymMemberBean bean= new GymMemberBean();
		
		bean.setMemberId("2");
		bean.setName("Sakshi Gehlot");
		bean.setMembershipType("Monthly");
		bean.setJoiningDate("1/12/202");
		bean.setTrainerName("Shubham");
		
		model.add(bean);
		
	}
	
}
