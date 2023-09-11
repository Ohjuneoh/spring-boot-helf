package kr.co.helf.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddInquiryForm;
import kr.co.helf.mapper.InquiryMapper;
import kr.co.helf.vo.Answer;
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
	
	// 문의 수정
	public void updateInquiry(User user, AddInquiryForm form)  throws IOException {
		Inquires inquiry = inquiryMapper.getinquiryByNo(form.getNo());
		
		BeanUtils.copyProperties(form, inquiry);
		inquiry.setUser(user);
		
		// 사진파일 
		MultipartFile photofile = form.getPhotofile();
		if (!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			
			inquiry.setFilename(filename);
		
			OutputStream out = new FileOutputStream(new File(directory, filename));
			InputStream in = photofile.getInputStream();
			FileCopyUtils.copy(in, out);
		}
		inquiryMapper.updateInquiry(inquiry);
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
			System.out.println(result);

			return result;
		}
		
		
	// 문의 상세정보 조회
		public Inquires getinquiryByNo(int inquiryNo) {
			Inquires inquiry = inquiryMapper.getinquiryByNo(inquiryNo);
			return inquiry;
		}
		
	// 문의 답변(댓글) 등록하기
		public void addAnswer(User user, int inquiryNo, String content) {
			
			// answer 객체에 user의 id 담기
			Answer answer = new Answer();
			answer.setContent(content);
			answer.setUser(user);
			Inquires inquiry = inquiryMapper.getinquiryByNo(inquiryNo);
			answer.setInquiry(inquiry);
						
			// inquiry 객체에 1:1문의 번호 담기
			inquiryMapper.addAnswer(answer);
			
			inquiry.setIsAnswer("Y");
			inquiryMapper.updateInquiry(inquiry);
		}
		
	// 문의 답변 조회하기
		public List<Answer> answerList(int inquiryNo) {

			List<Answer> answerList = inquiryMapper.getAllAnswer(inquiryNo);
			return answerList;
		}
		
	// 문의 답변 삭제하기
		public void deleteAnswer(int inquiryNo, int answerNo) {
			
			inquiryMapper.deleteAnswer(answerNo);
			
			Inquires inquiry = inquiryMapper.getinquiryByNo(inquiryNo);
			inquiry.setIsAnswer("N");
			inquiryMapper.updateInquiry(inquiry);
		}
		
}






