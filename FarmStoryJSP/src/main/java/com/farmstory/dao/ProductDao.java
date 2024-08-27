
package com.farmstory.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.ProductDto;
import com.farmstory.util.DBHelper;
import com.farmstory.util.SQL;

public class ProductDao extends DBHelper {

	private static ProductDao instance = new ProductDao();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public static ProductDao getInstance() {
		return instance;
	}

	private ProductDao() {
	}
	
	
	public int insertProduct(ProductDto dto) {
		int proNo = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(SQL.INSERT_PRODUCT);
			psmt.setInt(1, dto.getProNo());
			psmt.setString(2, dto.getProName());
			psmt.setString(3, dto.getProType());
			psmt.setInt(4, dto.getProPrice());
			psmt.setInt(5, dto.getProPoint());
			psmt.setInt(6, dto.getProSale());
			psmt.setInt(7, dto.getProDeliveryfee());
			psmt.setInt(8, dto.getProStock());
			psmt.setString(9, dto.getProImg1());
			psmt.setString(10, dto.getProImg2());
			psmt.setString(11, dto.getProImg3());
			psmt.setString(12, dto.getProETC());
			psmt.executeUpdate();
			
			
			
			rs = psmt.executeQuery(SQL.SELECT_MAX_NO);
			if(rs.next()) {
				proNo = rs.getInt(1);
			}
			conn.commit();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			closeAll();
		}
		return proNo;
	}

	public int selectCountTotal() {
		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTALs);

			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			closeAll();
		}
		return total;
	}

	public ProductDto selectProduct(int proNo) {
		ProductDto dto = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_PRODUCT);
			psmt.setInt(1, proNo);

			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new ProductDto();
				dto.setProNo(rs.getInt(1));
				dto.setProName(rs.getString(2));
				dto.setProType(rs.getString(3));
				dto.setProPrice(rs.getInt(4));
				dto.setProPoint(rs.getInt(5));
				dto.setProSale(rs.getInt(6));
				dto.setProDeliveryfee(rs.getInt(7));
				dto.setProStock(rs.getInt(8));
				dto.setProImg1(rs.getString(9));
				dto.setProImg2(rs.getString(10));
				dto.setProImg3(rs.getString(11));
				dto.setProETC(rs.getString(12));
				dto.setProRdate(rs.getString(13));
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			closeAll();
		}
		return dto;
	}

	public List<ProductDto> selectProducts(int start) {
		List<ProductDto> products = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_PRODUCTs);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductDto dto = new ProductDto();
				dto.setProNo(rs.getInt(1));
				dto.setProName(rs.getString(2));
				dto.setProType(rs.getString(3));
				dto.setProPrice(rs.getInt(4));
				dto.setProPoint(rs.getInt(5));
				dto.setProSale(rs.getInt(6));
				dto.setProDeliveryfee(rs.getInt(7));
				dto.setProStock(rs.getInt(8));
				dto.setProImg1(rs.getString(9));
				dto.setProImg2(rs.getString(10));
				dto.setProImg3(rs.getString(11));
				dto.setProETC(rs.getString(12));
				dto.setProRdate(rs.getString(13));
				products.add(dto);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			closeAll();
		}
		return products;
	}

	public void updateProduct(ProductDto dto) {

	}

	public void deleteProduct(int proNo) {

	}
}
