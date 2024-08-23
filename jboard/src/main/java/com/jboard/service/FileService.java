package com.jboard.service;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jboard.article.dao.FileDAO;
import jboard.article.dto.FileDTO;



public enum FileService {
	INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public FileDAO dao = FileDAO.getInstance();
	
	public void insertFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	
	public FileDTO selectFile(String fno) {
		return dao.selectFile(fno);
	}
	public List<FileDTO> selectFiles() {
		return dao.selectFiles();
	}
	public void updateFile(FileDTO dto) {
		dao.updateFile(dto);
	}
	public void updateFileDownloadCount(String fno) {
		dao.updateFileDownloadCount(fno);
	}
	public void deleteFile(int fno) {
		dao.deleteFile(fno);
	}
	
	
	public List<FileDTO> fileUpload(HttpServletRequest req) {
		
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		ServletContext ctx = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
			logger.debug("uploadPath : " + uploadPath);
		try {
			
			Collection<Part> parts = req.getParts(); // 첨부 파일 정보객체 가져오기
			
			for(Part part : parts) {
				
				// 파일명 추출
				String ofileName = part.getSubmittedFileName();
				
				if(ofileName != null && !ofileName.isEmpty()) {
					
					logger.debug("ofileName : " + ofileName);

					
					// 파일명 생성
					int idx = ofileName.lastIndexOf(".");
					String ext = ofileName.substring(idx);
					
					// 파일명 추출
					String sfileName = UUID.randomUUID().toString() + ext;
					logger.debug("ofileName : " + ofileName + "sfileName : " + sfileName);
					
					
					// 파일 저장
					part.write(uploadPath + File.separator + sfileName);

					//파일생성
					FileDTO fileDto = new FileDTO();
					fileDto.setoName(ofileName);
					fileDto.setsName(sfileName);
					files.add(fileDto);
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return files;
	}
	public void fileDownload(HttpServletRequest req, HttpServletResponse resp){
		
		FileDTO fileDto = (FileDTO)req.getAttribute("fileDto");
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			// response 헤더정보 수정
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fileDto.getoName(), "utf-8"));
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
	
			
			// 파일 내용 스트림 처리
			ServletContext ctx = req.getServletContext();
			String path = ctx.getRealPath("/uploads");
			File file = new File(path + File.separator + fileDto.getsName());
			
			bis = new BufferedInputStream(new FileInputStream(file));
			bos = new BufferedOutputStream(resp.getOutputStream());
			
			bis.transferTo(bos);
			bos.flush();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			
			try {
				bis.close();
				bos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
