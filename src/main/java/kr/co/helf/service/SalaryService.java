package kr.co.helf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import kr.co.helf.dto.Pagination;
import kr.co.helf.mapper.SalaryMapper;
import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.MySalary;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SalaryService {
	
	private final SalaryMapper salaryMapper;
	private final UserMapper userMapper;
	
	// 임직원 연봉 정보 목록 조회 
	public Map<String, Object> getAllTrainerSalary(Map<String, Object> param){

		int totalRows = userMapper.getAllTrainerTotalRows(param);
		int page = (int) param.get("page");
		
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<MySalary> mySalaryList = salaryMapper.getAllTrainerSalary(param);
	
		Map<String, Object> result = new HashMap<>();
		result.put("mySalaryList", mySalaryList);
		result.put("pagination", pagination);
		result.put("totalRows", totalRows);
		
		return result;
	}
	
	// 임직원 급여 기본 설정 저장 
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
	
	private boolean dataExistsForUserId(String userId) {
		Optional<MySalary> result = salaryMapper.getTrainerSalaryInfoById(userId);
		return result.isPresent();
	}
}
