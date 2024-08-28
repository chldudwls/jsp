package com.farmstory.util;
public class SQL{
	//PRODUCT
	public static final String INSERT_PRODUCT 	= "INSERT INTO `product` set"
													+ "`proname`=?,"
													+ "`protype`=?,"
													+ "`proprice`=?,"
													+ "`propoint`=?,"
													+ "`prosale`=?,"
													+ "`prodeliveryfee`=?,"
													+ "`proStock`=?,"
													+ "`proimg1`=?,"
													+ "`proimg2`=?,"
													+ "`proimg3`=?,"
													+ "`proETC`=?,"
													+ "proRdate=NOW()";
	public static final String SELECT_PRODUCT 	= "SELECT * from `product` where `prono`=?";
	public static final String SELECT_PRODUCTS	= "SELECT * from `product` ";
	public static final String UPDATE_PRODUCTS 	= "UPDATE `product` set "
													+ "`proname`=?,"
													+ "`protype`=?,"
													+ "`proprice`=?,"
													+ "`propoint`=?,"
													+ "`prosale`=?,"
													+ "`prodeliveryfee`=?,"
													+ "`proStock`=?,"
													+ "`proimg1`=?,"
													+ "`proimg2`=?,"
													+ "`proimg3`=?,"
													+ "`proETC`=?"
													+ "WHERE `prono`=?";					
	public static final String DELETE_PRODUCT = "DELETE from `product` where `prono`=?";
	
	//ARTICLE
	public static final String INSERT_ARTICLE 	= "INSERT INTO `ARTICLE` set "
													+ "`artGroup`=?,"
													+ "`artCate`=?,"
													+ "`artTitle`=?,"
													+ "`artContent`=?,"
													+ "`artFile`=?,"
													+ "`arthit`=?,"
													+ "`artComment`=?,"
													+ "`artWriter`=?,"
													+ "`artRegip`=?,"
													+ "`artRdate`=NOW()";
	public static final String SELECT_ARTICLE 	= "SELECT * FROM `ARTICLE` where `artNo`=?";
	public static final String SELECT_ARTICLES 	= "SELECT * FROM `ARTICLE`";
	public static final String SELECT_ARTICLES_CATE		= "SELECT * FROM `ARTICLE` WHERE `artcate` = ? ORDER BY `ARTNO` DESC LIMIT ?, 10";
	public static final String UPDATE_ARTICLE 	= "UPDATE `ARTICLE` set "
													+ "`artGroup`=?,"
													+ "`artCate`=?,"
													+ "`artTitle`=?,"
													+ "`artContent`=?,"
													+ "`artFile`=?,"
													+ "`arthit`=?,"
													+ "`artComment`=?,"
													+ "`artWriter`=?,"
													+ "`artRegip`=?"
													+ "where `artNo`=?";
												
	public static final String DELETE_ARTICLE = "DELETE from `article` where `artNo`=?";
	//조회수 증가
	public static final String UPDATE_HIT_COUNT = "update `ARTICLE` set `arthit` = `arthit` + 1 where `artNo`=?";
	//그룹별 + 카테고리별 총 글 갯수
	public static final String SELECT_ARTICLE_COUNT_TOTAL = "SELECT COUNT(*) FROM `article` where `artGroup`=? AND `artCate`=?";
	//제품 페이지 최대수
	public static final String SELECT_MAX_NO = "select MAX(`no`) from `product`";
	//제품 총 수
	public static final String SELECT_COUNT_TOTALS="SELECT COUNT(*) FROM `product`";
	//가지고 오는 제품의 수 10개 제한
	public static final String SELECT_PRODUCTS_LIMIT = "SELECT * FROM product LIMIT ?, 10";
	//COMMENT
	public static final String INSERT_COMMENT 	= "INSERT INTO `COMMENT` set "
													+ "`comParent`=?,"
													+ "`comContent`=?,"
													+ "`comWriter`=?,"
													+ "`comRegip`=?,"
													+ "`comRdate`=NOW()";
	public static final String SELECT_COMMENT 	= "SELECT * FROM `COMMENT` where `ComNo`=?";
	public static final String SELECT_COMMENTS = "SELECT a.*, b.usernick from `comment` AS a "
													+ "JOIN `user` AS b ON a.comwriter = b.userid "
													+ "where `comparent`=? "
													+ "order by comno";
	public static final String UPDATE_COMMENT 	= "UPDATE `COMMENT` set "
													+ "`comParent`=?,"
													+ "`comContent`=?,"
													+ "`comWriter`=?,"
													+ "`comRegip`=?,"
													+ "where `ComNo`=?";
	public static final String DELETE_COMMENT 	= "DELETE from `comment` where `ComNo`=?";
	
	//USER
	public static final String INSERT_USERS = "INSERT INTO `user` set "
												+ "UserId=?,"
												+ "userPass=SHA2(?, 256),"
												+ "userName=?,"
												+ "userNick=?,"
												+ "userEmail=?,"
												+ "userHP=?,"
												+ "UserRole=?,"
												+ "userGrade=?,"
												+ "UserZip=?"
												+ "userAddr1=?,"
												+ "UserAddr2=?,"
												+ "UserRegip=?,"
												+ "userRegdate=?";
	public static final String SELECT_USER 	= "SELECT * FROM `User` `UserId`=? and `userPass`=SHA2(?,256)";
	public static final String SELECT_USERS = "SELECT * FROM `User`";
	public static final String UPDATE_USERS = "UPDATE `User` set "
												+ "userPass=SHA2(?, 256),"
												+ "userName=?,"
												+ "userNick=?,"
												+ "userEmail=?,"
												+ "userHP=?,"
												+ "UserRole=?,"
												+ "userGrade=?,"
												+ "UserZip=?"
												+ "userAddr1=?,"
												+ "UserAddr2=?"
												//+ "UserRegip=?"
												+ "where `UserId`=?";
	public static final String DELETE_USERS = "DELETE FROM `User` where `UserId`=?";
	
	//유저 수 검색
	public static final String SELECT_USERS_COUNT = "SELECT COUNT(*) FROM `User` ";
	
	//FILE
	public static final String INSERT_FILE 	= "INSERT INTO `file` set "
												+ "`ano`=?,"
												+ "`fileOname`=?,"
												+ "`fileSname`=?,"
												+ "`fileDownload`=?,"
												+ "`filerDate`=NOW()";
	public static final String SELECT_FILE 	= "SELECT * FROM `file` where `fileNo` = ?";
	public static final String SELECT_FILES = "SELECT * FROM `file`";
	public static final String UPDATE_FILE 	= "UPDATE `file` set "
												+ "`fileOname`=?,"
												+ "`fileSname`=?,"
												+ "`fileDownload`=0"
												+ "where `fileNo`=?";
	public static final String DELETE_FILE 	= "DELETE FROM `file` where `fileNo`=?";
	
	//ORDER
	
	public static final String INSERT_ORDER ="INSERT INTO `Order` set "
												+ "`oderUid`=?,"
												+ "`oderprodNO`=?,"
												+ "`oderstock`=?,"
												+ "`oderRdate`=NOW()";
	// 특정 사용자의 주문내역을 조회
	public static final String SELECT_ORDERS = "SELECT o.orderNo, o.orderprodNO, o.orderstock, o.orderRdate, " 
												+"p.proimg1, p.proname, p.prosale, p.propoint, p.proprice, p.prodeliveryfee" 
												+"FROM `order` AS o " 
												+"JOIN `product` AS p ON o.orderprodNO = p.prono " 
												+"JOIN `user` AS u ON o.orderUid = u.userUID " 
												+"WHERE u.userUID = ?";  

	public static final String UPDATE_ORDER = "UPDATE `order` SET"
												+" orderstock = ?, "
												+" orderRdate = NOW() " 
												+" WHERE orderNo = ?";
	public static final String DELETE_ORDER = "DELETE FROM `order` " 
												+"WHERE orderNo = ?";
	
	//페이지 숫자 찾기용
	public static final String SELECT_PAGED_USERS_BY_ROW_NUMBER = "WITH NumberedUsers AS ( "
																	+ "SELECT *, ROW_NUMBER() OVER (ORDER BY `UserRegdate` DESC) AS `row_num` "
																	+ "FROM `User`) "
																	+ "SELECT * "
																	+ "FROM `NumberedUsers` "
																	+ "WHERE `row_num` BETWEEN ? AND ?";
	
	//아이디,닉네임,이메일,휴대폰번호 중복 검사
	public static final String WHERE_UID = "WHERE `UserId`=?";
	public static final String WHERE_NICK = "WHERE `UserNick`=?";
	public static final String WHERE_EMAIL = "WHERE `UserEmail`=?";
	public static final String WHERE_HP = "WHERE `UserHp`=?";
	
	//TERMS
	public static final String SELECT_TERMS = "SELECT * FROM `terms`";
	
	//CART
	public static final String SELECT_CARTS = "SELECT * FROM `cart` where `cartUid`=?";
	public static final String INSERT_CART  = "INSERT into `cart` set "
												+ "`cartUid`=?,"
												+ "`cartProNo`=?,"
												+ "`cartstock`=?";
	public static final String DELETE_CART  = "DELETE FROM `cart` where cartNo=? and cartUid=?";
}

/*package com.jboard.util;

public class SQL {
	
	
	public static final String SELECT_TERMS = "select * from terms";
	
	//user
	public static final String SELECT_COUNT_USER = "SELECT COUNT(*) FROM `user` ";
	public static final String WHERE_UID  = "WHERE `uid`=?";
	public static final String WHERE_NICK = "WHERE `nick`=?";
	public static final String WHERE_EMAIL = "WHERE `email`=?";
	public static final String WHERE_HP = "WHERE `hp`=?";
	
	public static final String SELECT_USER = "select * from `user` where `uid`=? and `pass`=SHA2(?,256)";
	public static final String INSERT_USER = "insert into user set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	//article
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `article`";
	public static final String SELECT_ARTICLE ="SELECT * FROM `article` AS a "
												+ "left JOIN `file` AS b ON a.`no` = b.`ano` "
												+ "where `no`=?";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, u.nick FROM `article` AS a "
												+ "JOIN	`user` AS u ON a.writer = u.uid "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	public static final String SELECT_MAX_NO = "select MAX(`no`) from `article`";
	public static final String INSERT_ARTICLE = "insert into article set "
											+ "`title`=?,"
											+ "`content`=?,"
											+ "`file`=?,"											
											+ "`writer`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	public static final String UPDATE_HIT_COUNT = "update article set `hit` = `hit` + 1 where `no`=?";
	//comment
	public static final String SELECT_COMMENT = "SELECT * FROM `comment` where `no`= ?";
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick fROM `comment` AS a "
													+ "JOIN `user` AS b ON a.writer = b.uid "
													+ "WHERE `parent` = ?;";
	public static final String INSERT_COMMENT = "INSERT into comment set "
											+ "`parent`=?, "
											+ "`content`=?, "
											+ "`writer`=?, "
											+ "`regip`=?, "
											+ "`rdate`=now() ";
	public static final String UPDATE_COMMENT = "UPDATE `comment` set `content`=? where `no` = ?";
	public static final String DELETE_COMMENT = "DELETE FROM `comment` where `no`=?";
	//file
	public static final String DELETE_FILE = "DELETE FROM `file` where `ano`=?";
	public static final String SELECT_FILE = "SELECT * FROM `file` where `fno`=?";
	public static final String INSERT_FILE = "insert into file set "
											+ "`ano`=?,"
											+ "`oName` = ?,"
											+ "`sName` = ?,"
											+ "`rdate` = now()";
	public static final String UPDATE_FILE_DOWNLOAD_COUNT = "update file set `download` = `download` + 1 where `fno`=?";
}
*/