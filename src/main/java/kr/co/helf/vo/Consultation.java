package kr.co.helf.vo;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("Consultation")
public class Consultation {
	
	private int consultationNo;
	private String consultationStatus;
	private Lesson lesson;
	private Date applicationDate;
	
    @NotNull(message = "PT 목표를 입력해주세요.")
    @NotBlank(message = "PT 목표를 입력해주세요.")
	private String goal;
    
    @NotNull(message = "신체 이상유무를 입력해주세요.")
    @NotBlank(message = "신체 이상유무를 입력해주세요.")
	private String abnormalities;
    
    @NotNull(message = "희망 상담일을 입력해주세요.")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date requestDate;
    
    @NotNull(message = "희망 상담시간을 입력해주세요.")
    @NotBlank(message = "희망 상담시간을 입력해주세요.")
	private String requestTime;
	private User user;
	private Trainer trainer;
	private MyMembership myMembership;
	

}
