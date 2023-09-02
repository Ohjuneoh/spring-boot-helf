package kr.co.helf.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddInquiryForm;
import kr.co.helf.mapper.InquiryMapper;
import kr.co.helf.vo.Board;
import kr.co.helf.vo.Inquires;
import kr.co.helf.vo.User;

@Service
public class InquiryService {
	
	@Autowired
	private InquiryMapper inquiryMapper;
	
	
	String directory = "C:\\Users\\drk25\\git\\spring-boot-helf\\src\\main\\webapp\\resources\\img\\photo";
	// 문의 등록 
	public void addInquiry(User user, AddInquiryForm form)  throws IOException {
		Inquires inquiry = new Inquires();
		
		BeanUtils.copyProperties(form, inquiry);
		inquiry.setUser(user);
		
		// 사진파일 담기
		MultipartFile photofile = form.getPhotofile();
		if (!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			
			inquiry.setFilename(filename);
		
			OutputStream out = new FileOutputStream(new File(directory, filename));
			InputStream in = photofile.getInputStream();
			FileCopyUtils.copy(in, out);
		}
		inquiryMapper.insertInquiry(inquiry);
	}
	
	// 문의 전체조회(페이징처리)
		public Map<String, Object> getAllInquiry(Map<String, Object> param) {
			Map<String, Object> result = new HashMap<>();

			int totalRows = inquiryMapper.getTotalRows(param);
			int page = (int) param.get("page");
			
			Pagination pagination = new Pagination(page, totalRows);
			int begin = pagination.getBegin();
			int end = pagination.getEnd();
			param.put("begin", begin);
			param.put("end", end);
			
			List<Inquires> inquiries = inquiryMapper.getAllInquiry(param);
			
			result.put("inquiries", inquiries);
			result.put("pagination", pagination);

			return result;
		}
		
		
	// 문의 상세정보 조회
		public Inquires getinquiryByNo(int inquiryNo) {
			Inquires inquiry = inquiryMapper.getinquiryByNo(inquiryNo);
			return inquiry;
		}
	
}
