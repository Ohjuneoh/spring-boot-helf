package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.TrainerAttendance;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttendanceList {

	private Pagination pagination;
	private List<TrainerAttendance> attendances;
}
