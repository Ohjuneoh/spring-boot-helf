package kr.co.helf.dto;

import kr.co.helf.vo.CustomerAttendance;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerAttendanceListDto {

	
	private Pagination paginataion;
	private CustomerAttendance customerAttendance;
	private CustomerDetailDto customerDetailDto;
}
