package kr.co.helf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.MonthlyGroupLessonDto;
import kr.co.helf.dto.MonthlyPersonalLessonDto;
import kr.co.helf.dto.MonthlyTotalSalaryDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.exception.SalaryException;
import kr.co.helf.mapper.SalaryMapper;
import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.MonthlyGclPayRecords;
import kr.co.helf.vo.MonthlyPclPayRecords;
import kr.co.helf.vo.MySalary;
import kr.co.helf.vo.SalaryRecords;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SalaryService {
	
	private final SalaryMapper salaryMapper;
	private final UserMapper userMapper;
	
	// Tab1 임직원 연봉 정보 목록 조회 
	public Map<String, Object> getAllTrainerSalary(Map<String, Object> param){

		int totalRows = userMapper.getAllTrainerTotalRows(param);
		int page = (int) param.get("page");
		
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<SalaryRecords> mySalaryList = salaryMapper.getAllTrainerSalary(param);
	
		Map<String, Object> result = new HashMap<>();
		result.put("mySalaryList", mySalaryList);
		result.put("pagination", pagination);
		result.put("totalRows", totalRows);
		
		return result;
	}
	
	// Tab1 임직원 지난달 급여 조회 
	public List<SalaryRecords> getPreviousMonthlyTrainerSalary(){
		return salaryMapper.getPreviousMonthlyTrainerSalary();
	}
	
	// Tab1 임직원 급여 기본 설정 저장 
	public void saveOrUpdateSalaryInfoById(Map<String, Object> param) {
		String userId = (String) param.get("userId");
		if(userId == null) {
			throw new IllegalArgumentException("사용자 아이디가 없습니다.");
		}
		if(dataExistsForUserId(userId)) {
			salaryMapper.updateSalaryInfoById(param);
		} else {
			salaryMapper.insertSalaryInfoById(param);
		}
	}
	
	// Salary 목록 임직원 급여 기본 설정 저장 시, 기존 기본급 있는지 확인하기
	private boolean dataExistsForUserId(String userId) {
		Optional<MySalary> result = salaryMapper.getTrainerSalaryInfoById(userId);
		return result.isPresent();
	}
	
	// Tab1 트레이너 월별 급여 목록
	public Map<String, Object> getTrainerSalaryRecords(Map<String, Object> param){
		
		int totalRows = salaryMapper.getTotalRowsByUserId(param);
		int page = (int) param.get("page");
		
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<SalaryRecords> salaryRecords = salaryMapper.getTrainerSalaryRecords(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("salaryRecords", salaryRecords);
		result.put("totalRows", totalRows);
		result.put("pagination", pagination);
		
		return result;
	}
	
	// Tab2 실시간 급여 지급 내역 확인하기 
	public Optional<MonthlyTotalSalaryDto> getTotalMonthlySalary(Map<String, Object> param){
		Optional<MonthlyTotalSalaryDto> result = salaryMapper.getTotalMonthlySalary(param);
		return result;
	}
	
	// Tab2 임직원 이번 달 급여 정산 확정 정보 저장 
	public void saveMonthlySalaryData(Map<String, Object> param) {
		if(dataExistsForMonthlySalaryRecords(param)) {
			System.out.println("Data already exists for this month: " + param.get("userId"));
			throw new SalaryException("이번 달 급여 내역은 이미 정산 완료되었습니다.");
		} else {
			salaryMapper.insertMonthlySalaryData(param);
		} 
	}
	
	// Tab2 임직원 이번 달 급여 정산 확정 정보 저장 시, 기존 저장 이력이 있는지 확인하기 
	private boolean dataExistsForMonthlySalaryRecords(Map<String, Object> param) {
		Optional<SalaryRecords> result = salaryMapper.getTrainerMonthlySalaryRecordsByInfo(param);
		return result.isPresent();
	}
	
	
	// Tab3 트레이너 개인레슨 수당내역 조회 
	public Map<String, Object> getPersonalLessonsById(Map<String, Object> param){
		 
		int totalRows = salaryMapper.getPclTotalRowsById(param);
		int page = (int) param.get("page");
		
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		 List<MonthlyPersonalLessonDto> monthlyPclList = salaryMapper.getPersonalLessonsById(param);
		 
		 Map<String, Object> result = new HashMap<>();
		 result.put("monthlyPclList", monthlyPclList);
		 result.put("pagination", pagination);
		 result.put("totalRows", totalRows);
		 return result;
	}
	
	// Tab3 트레이너 개인레슨 지난 5개월 수당 내역 조회 
	public List<MonthlyPclPayRecords> getPclMonthlyPayById(String userId){
		List<MonthlyPclPayRecords> result = salaryMapper.getPclMonthlyPayById(userId);
		return result;
	}
	
	// Tab4 트레이너 그룹레슨 지난 5개월 수당 내역 조회 
	public List<MonthlyGclPayRecords> getGclMonthlyPayById(String userId){
		List<MonthlyGclPayRecords> result = salaryMapper.getGclMonthlyPayById(userId);
		return result;
	}
	
	// Tab3 트레이너 월별 그룹 수당 내역 저장 시, 이미 그룹 수당 내역 저장했는지 확인하기 
		private boolean dataExistsForPclData(Map<String, Object> param) {
			Optional<MonthlyPclPayRecords> result = salaryMapper.getTrainerPclDataByInfo(param);
			return result.isPresent();
		}
			
	// Tab3 트레이너 개인레슨 수당 저장 
		public void savePclData(Map<String, Object> param) {
			String userId = (String) param.get("userId");
			if(userId == null) {
				throw new IllegalArgumentException("사용자 아이디가 없습니다.");	
			} if(dataExistsForPclData(param)) {
				System.out.println("Data already exists for user: " + userId);
				throw new SalaryException("이번 달 개인레슨은 이미 정산 완료되었습니다.");
			} else {
			System.out.println("Data does not exist for user: " + userId + ". Saving now.");
			salaryMapper.savePclData(param);
			}
		}

	
	// Tab4 트레이너 그룹레슨 수당 내역 조회 
	public Map<String, Object> getGroupLessonsById(Map<String, Object> param){
		int totalRows = salaryMapper.getGclTotalRowsById(param);
		int page = (int) param.get("page");
		
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<MonthlyGroupLessonDto> monthlyGclList = salaryMapper.getGroupLessonById(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("monthlyGclList", monthlyGclList);
		result.put("pagination", pagination);
		result.put("totalRows", totalRows);
		
		return result;
	}
	
	// Tab4 트레이너 월별 그룹 수당 내역 저장 시, 이미 그룹 수당 내역 저장했는지 확인하기 
		private boolean dataExistsForGclData(Map<String, Object> param) {
			Optional<MonthlyGclPayRecords> result = salaryMapper.getTrainerGclDataByInfo(param);
			return result.isPresent();
		}
		
	// Tap4 월별 트레이너 그룹레슨 수당 저장 
		public void saveGclData(Map<String, Object> param) {
			String userId = (String) param.get("userId");
			if(userId == null) {
				throw new IllegalArgumentException("사용자 아이디가 없습니다.");				
			} if(dataExistsForGclData(param)) {
				   System.out.println("Data already exists for user: " + userId);
				   throw new SalaryException("이번 달 그룹레슨은 이미 정산 완료되었습니다.");
			} else {
				  System.out.println("Data does not exist for user: " + userId + ". Saving now.");
				   salaryMapper.saveGclData(param);				
				}
			}
		
	
	
}
