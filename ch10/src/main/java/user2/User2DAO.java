package user2;

import java.util.ArrayList;
import java.util.List;

	public class User2DAO extends DBHelper {
		
		private static User2DAO instance = new User2DAO();
		public static User2DAO getInstance() {
			return instance;
		}
		private User2DAO() {}
	public void insertUser2(User2DTO dto) {
			
			String sql = "insert into `user2` values (?,?,?,?,?)";
			
			try {
				conn = getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getUid());
				psmt.setString(2, dto.getName());
				psmt.setString(3, dto.getBirth());
				psmt.setString(4, dto.getAddr());
			
				
				psmt.executeUpdate();
				closeAll();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public User2DTO selectUser2(String uid) {
			User2DTO dto = null;
			
			try {
				conn = getConnection();
				psmt = conn.prepareStatement("select * from `user2` where `uid`=?");
				psmt.setString(1, uid);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					dto = new User2DTO();
					dto.setUid(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setBirth(rs.getString(3));
					dto.setAddr(rs.getString(4));
				}
				closeAll();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return dto;
		}
		public List<User2DTO> selectUser2s() {
			
			List<User2DTO> users = new ArrayList<User2DTO>();
			try {
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from `user1`");
				
				while(rs.next()) {
					
					User2DTO dto = new User2DTO();
					dto.setUid(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setBirth(rs.getString(3));
					dto.setAddr(rs.getString(4));
					
					users.add(dto);
				}
				closeAll();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return users;
		}
	public void updateUser2(User2DTO dto) {
			
			String sql = "update user2 set `name`=?, `birth`=?, `addr`=? where `uid`=?";
			
			try {
				conn = getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getName());
				psmt.setString(2, dto.getBirth());
				psmt.setString(3, dto.getAddr());
				psmt.setString(4, dto.getUid());
				psmt.executeUpdate();
				closeAll();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	public void deleteUser2(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user2` where `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
	
