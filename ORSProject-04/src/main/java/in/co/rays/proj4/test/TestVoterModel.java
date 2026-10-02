package in.co.rays.proj4.test;

import in.co.rays.proj4.bean.VoterBean;
import in.co.rays.proj4.model.VoterModel;

public class TestVoterModel {

	public static void main(String[] args) {

		// testAdd();
		// testUpdate();
		//testDelete();
	}

	private static void testDelete() {

		VoterModel model = new VoterModel();

		model.delete(1);
	}

	private static void testUpdate() {

		VoterModel model = new VoterModel();

		VoterBean bean = new VoterBean();

		bean.setVoterId("1");
		bean.setName("Shivani");
		bean.setAge(22);
		bean.setConstituency("Indore");
		bean.setHasVoted(true);

		model.update(bean);
	}

	private static void testAdd() {

		VoterModel model = new VoterModel();

		VoterBean bean = new VoterBean();

		bean.setVoterId("1");
		bean.setName("Shivani");
		bean.setAge(22);
		bean.setConstituency("Indore");
		bean.setHasVoted(true);

		model.add(bean);
	}
}