package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Answer;
import kr.co.helf.vo.Inquires;

@Mapper
public interface InquiryMapper {

	// 문의 등록
	void insertInquiry(Inquires inquiry);
	
	// 페이징처리
	int getTotalRows(Map<String,Object> param);

	// 문의 전체조회(페이징처리 포함)
	List<Inquires> getAllInquiry(Map<String, Object> param);
	
	// 문의 전체조회(페이징처리 X, 마이페이지)
	List<Inquires> getAllInquiryMypage(String userId);

	// 문의 상세조회
	Inquires getinquiryByNo(int inquiryNo);
	
	// 문의글 수정
	void updateInquiry(Inquires inquiry);

	// 문의 답변 등록
	void addAnswer(Answer answer);
	
	// 문의 답변 조회
	List<Answer> getAllAnswer(int inquiryNo);
	
	// 문의 답변 삭제
	void deleteAnswer(int answerNo);
}
