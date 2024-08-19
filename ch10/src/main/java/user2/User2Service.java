package user2;

import java.util.List;

public class User2Service {
	private static User2Service instance = new User2Service();
	public static User2Service getInstance() {
		return instance;
	}
	 private User2Service() {}

	    // DAO 객체
	    private User2DAO dao = User2DAO.getInstance();
	    
	    // 사용자 추가
	    public void insertUser2(User2DTO dto) {
	        dao.insertUser2(dto);
	    }
	    
	    // 사용자 조회
	    public User2DTO selectUser2(String uid) {
	        return dao.selectUser2(uid);
	    }
	    
	    // 사용자 목록 조회
	    public List<User2DTO> selectUser2s() {
			return dao.selectUser2s();
		}
	 
	    public void updateUser2(User2DTO dto) {
	    	dao.updateUser2(dto);
	    }
	    
	    public void deleteUser2(String uid) {
	    	dao.deleteUser2(uid);
	    }
	}
