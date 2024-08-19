package user1;

import java.util.List;

import user1.User1DAO;
import user1.User1DTO;

public class User1Service {

	//DAO 인스턴스
	
	
	private static User1Service instance = new User1Service();
	public static User1Service getInstance() {
		return instance;
	}
	
private User1DAO dao = User1DAO.getInstance();
	
	// DAO CRUD 메서드 호출
	public void insertUser1(User1DTO dto) {
		dao.insertUser1(dto);
	}
	
	public User1DTO selectUser1(String uid) {
		return dao.selectUser1(uid);
	}
	
	public List<User1DTO> selectUser1s() {
		return dao.selectUser1s();
	}
	
	public void updateUser1(User1DTO dto) {
		dao.updateUser1(dto);
	}
	
	public void deleteUser1(String uid) {
		dao.deleteUser1(uid);
	}
	
}
