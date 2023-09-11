package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.MonthlyGroupLessonDto;
import kr.co.helf.dto.MonthlyPersonalLessonDto;
import kr.co.helf.dto.MonthlyTotalSalaryDto;
import kr.co.helf.vo.MonthlyGclPayRecords;
import kr.co.helf.vo.MonthlyPclPayRecords;
import kr.co.helf.vo.MySalary;
import kr.co.helf.vo.SalaryRecords;

@Mapper
public interface SalaryMapper {
	
	List<SalaryRecords> getAllTrainerSalary(Map<String, Object> param);
	
	void insertSalaryInfoById(Map<String, Object> param);
	
	Optional<MySalary> getTrainerSalaryInfoById(String userId);

	void updateSalaryInfoById(Map<String, Object> param);
	
	// Tab1 급여 목록 totalRows 조회 
	int getTotalRowsByUserId(Map<String, Object> param);
	
	// Tab1 급여 목록 조회
	List<SalaryRecords> getTrainerSalaryRecords(Map<String, Object> param);
	
	// Tab1 지난달 급여 목록 조회 - 그래프 
	List<SalaryRecords> getPreviousMonthlyTrainerSalary();
	
	// Tab2 실시간 급여 지급 내역 조회 
	Optional<MonthlyTotalSalaryDto> getTotalMonthlySalary(Map<String, Object> param);
	
	// Tab2 급여 지급 내역 조회 존재 여부 조회 
	Optional<SalaryRecords> getTrainerMonthlySalaryRecordsByInfo(Map<String, Object> param);
	
	// Tab2 급여 지급 내역 저장 
	void insertMonthlySalaryData(Map<String, Object> param);
	
	// Tab3 개인레슨 totalRows 조회 
	int getPclTotalRowsById(Map<String, Object> param);
	
	// Tab3 월별 트레이너별 개인레슨 목록 및 수당 조회 
	List<MonthlyPersonalLessonDto> getPersonalLessonsById(Map<String, Object> param);
	
	// Tab3 트레이너별 개인레슨 수당 지난 5개월 조회 
	List<MonthlyPclPayRecords> getPclMonthlyPayById(String userId);
	
	// Tab3 월별 개인 레슨 수당 내역 저장 여부 조회
	Optional<MonthlyPclPayRecords> getTrainerPclDataByInfo(Map<String, Object> param);
	
	// Tab3 개인레슨 수당내역 정산(저장)
	void savePclData(Map<String, Object> param);
	
	// Tab4 그룹레슨 totalRows 조회 
	int getGclTotalRowsById(Map<String, Object> param);
	
	// Tab4 월별 트레이너별 개인레슨 목록 및 수당 조회 
	List<MonthlyGroupLessonDto> getGroupLessonById(Map<String, Object> param);
	
	// Tab4 트레이너별 개인레슨 수당 지난 5개월 조회 
	List<MonthlyGclPayRecords> getGclMonthlyPayById(String userId);
	
	// Tab4 월별 그룹 레슨 수당 내역 저장 여부 조회 
	Optional<MonthlyGclPayRecords> getTrainerGclDataByInfo(Map<String, Object> param);
		
	// Tab4 그룹레슨 수당내역 정산(저장)
	void saveGclData(Map<String, Object> param);
	
	
	
}
