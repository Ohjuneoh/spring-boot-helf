package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Board;
import kr.co.helf.vo.Inquires;

@Mapper
public interface InquiryMapper {

	// 문의 등록
	void insertInquiry(Inquires inquiry);
	
	// 페이징처리
	int getTotalRows(Map<String,Object> param);

	// 문의 전체조회(페이징처리 포함)
	List<Inquires> getAllInquiry(Map<String, Object> param);

	// 문의 상세조회
	Inquires getinquiryByNo(int inquiryNo);
}
