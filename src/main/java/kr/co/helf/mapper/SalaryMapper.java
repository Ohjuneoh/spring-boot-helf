package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.MonthlyPersonalLessonDto;
import kr.co.helf.vo.MySalary;

@Mapper
public interface SalaryMapper {
	
	List<MySalary> getAllTrainerSalary(Map<String, Object> param);
	
	void insertSalaryInfoById(Map<String, Object> param);
	
	Optional<MySalary> getTrainerSalaryInfoById(String userId);

	void updateSalaryInfoById(Map<String, Object> param);
	
	List<MonthlyPersonalLessonDto> getPersonalLessonsById(Map<String, Object> param);
}
