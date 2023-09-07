package kr.co.helf.service;

import kr.co.helf.form.AddUserForm;
import kr.co.helf.mapper.GroupLessonMapper;
import kr.co.helf.mapper.OrderMapper;
import kr.co.helf.mapper.TrainerReviewMapper;
import kr.co.helf.mapper.UserMapper;
import kr.co.helf.vo.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import kr.co.helf.dto.AttendanceList;
import kr.co.helf.dto.CustomerAttendanceListDto;
import kr.co.helf.dto.CustomerDetailDto;
import kr.co.helf.dto.CustomerListDto;
import kr.co.helf.dto.CustomerOrderDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.form.UpdateUserForm;
import kr.co.helf.mapper.InquiryMapper;
import java.io.*;
import java.util.*;


@Service
public class UserService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private TrainerReviewMapper trainerReviewMapper;

	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Autowired
	private GroupLessonMapper groupLessonMapper;


	// 유저 회원가입
	public void createUser(AddUserForm form) {
		User user = new User();

		BeanUtils.copyProperties(form, user);

		user.setEmail(form.getEmail1() + form.getEmail2());

		//비밀번호를 암호화해서 저장시키기
		String encryptedPassword = passwordEncoder.encode(form.getPassword());
		user.setEncryptedPassword(encryptedPassword);

		// 등급, 타입,포인트 담기
		user.setType("ROLE_USER");
		Rank rank = new Rank();
		rank.setNo(1);
		user.setRank(rank);
		user.setPoint(1000);
		user.setSocial("web");
		
		userMapper.insertUser(user);

	}

	// 트레이너 회원가입
	String directory = "C:\\Users\\drk25\\git\\spring-boot-helf\\src\\main\\webapp\\resources\\img\\photo";

	public void createTrainer(AddUserForm form) throws IOException {

		User user = new User();

		BeanUtils.copyProperties(form, user);

		user.setEmail(form.getEmail1() + form.getEmail2());

		//비밀번호를 암호화해서 저장시키기
		String encryptedPassword = passwordEncoder.encode(form.getPassword());
		user.setEncryptedPassword(encryptedPassword);

		// (1단계)유저 객체 - 타입,상태 담기
		user.setType("ROLE_TRAINER");
		user.setStatus("R");

		// (2단계)트레이너 객체에 사진파일 담기
		Trainer trainer = new Trainer();

		MultipartFile photofile = form.getPhotofile();
		if (!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			trainer.setTrainerFile(filename);

			OutputStream out = new FileOutputStream(new File(directory, filename));
			InputStream in = photofile.getInputStream();
			FileCopyUtils.copy(in, out);
		}
		trainer.setUser(user);

		//(2단계)트레이너 경력객체에 담기
		TrainerCareer trainerCareer = new TrainerCareer();
		trainerCareer.setTrainer(trainer);
		trainerCareer.setName(form.getName());
		trainerCareer.setStartDate(form.getCareerStartDate());
		trainerCareer.setEndDate(form.getCareerEndDate());

		userMapper.insertTrainer(user);
		userMapper.insertTrainer2(trainer);
		userMapper.insertTrainerCareer(trainerCareer);
	}


	// 아이디 찾기(ajax)
	public List<String> findId(String name, String tel) throws Exception {
		return userMapper.getIdByTel(name, tel);
	}

	// 아이디 중복검사(ajax)
	public int idCheck(String userId) throws Exception {
		return userMapper.idCheck(userId);
	}

	// 비밀번호 찾기 (ajax) - 인증번호 전송
	public void findPwdAuth(String userId) throws Exception {
		User user = userMapper.getUserById(userId);
		if (user == null) {
			throw new RuntimeException("아이디가 존재하지 않음");
		}

		String auth = generateAuth();
		user.setAuthenticationNo(auth);

		userMapper.updateUser(user);

		sendEmail(user.getEmail(), auth);

	}

	// 비밀번호 찾기 (ajax) - 인증번호 확인
	public void checkPwdAuth(String auth, String userId) throws Exception {
		String userAuth = userMapper.getUserAuthById(auth, userId);

		if (!userAuth.equals(auth)) {
			throw new RuntimeException("인증번호가 일치하지 않음");
		}
	}

	// 비밀번호 변경
	public void updateUserPwd(String userId, String newPwd) {

		User user = userMapper.getUserById(userId);

		user.setEncryptedPassword(newPwd);

		//비밀번호를 암호화해서 저장시키기
		String encryptedPassword = passwordEncoder.encode(user.getEncryptedPassword());
		user.setEncryptedPassword(encryptedPassword);

		userMapper.updateUser(user);
	}

	// 인증번호 생성
	private String generateAuth() {
		String text = "1234567890qwertyuiopasdfghjklzxcbnmQWERTYUIOPASDFGHJKLZXCVBNM";
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= 6; i++) {
			sb.append(text.charAt(random.nextInt(text.length())));
		}
		return sb.toString();
	}

	// 인증번호 이메일로 전송
	private void sendEmail(String email, String auth) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(email);
		message.setSubject("HELF 헬스장에서 이메일 인증번호를 보냅니다.");
		message.setText("인증번호: " + auth);

		javaMailSender.send(message);
	}


	// 마이페이지 - 유저 정보 수정
		public void updateUser(String userId, UpdateUserForm form) {
			User user = userMapper.getUserById(userId);
			  		user.setEncryptedPassword(passwordEncoder.encode(form.getPassword()));
			 		user.setEmail(form.getEmail1() + form.getEmail2());
			  		user.setTel(form.getTel());
			  		user.setMobileCarrier(form.getMobileCarrier());
			  
			  		userMapper.updateUser(user);
		}
	
	// 마이페이지 - 유저 회원탈퇴
		public void withdrawalUser(String id) {
	      User user = userMapper.getUserById(id);
	      
	      if(user == null) {
	         throw new RuntimeException("탈퇴처리를 진행할 회원이 존재하지 않습니다.");
	      }
	      
	      if("N".equals(user.getStatus())) {
	         throw new RuntimeException("이미 탈퇴처리가 완료된 회원입니다.");
	      }
	      
	      user.setStatus("N");
	      userMapper.updateUser(user);
	   }
		

	public List<User> getUsersWithFourDigits(String fourDigits) {
		return userMapper.getUsersByDigits(fourDigits);

	}


	// // 입장시 회원권 유저 아이디로 조회 - 채경 (추후 membershipService로 이동 예정) 
	public Optional<MyMembership> getMyMembershipDetail(String userId) {
		return userMapper.getMyMembership(userId);
	}

	public void createAttendance(Map<String, Object> param) {
		userMapper.insertAttendance(param);
	}


	//직원 출석 목록 조회 - 채경 
	public AttendanceList getTrainerAttendances(Map<String, Object> param) {

		int totalRows = userMapper.getTrainerTotalRows(param);

		int page = (int) param.get("page");
		Pagination pagination = new Pagination(page, totalRows);

		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);

		AttendanceList result = new AttendanceList();
		List<TrainerAttendance> attendances = userMapper.getTrainerAttendances(param);

		result.setPagination(pagination);
		result.setAttendances(attendances);

		return result;
	}

	// 직원 출퇴근 등록 - 채경
	public void createTrainerAttendance(Map<String, Object> param) {
		userMapper.insertTrainerAttendances(param);
	}

	// 고객 조회 - 채경
	public Map<String, Object> getAllCustomerInfo(Map<String, Object> param) {
		// 총 행의 개수 
		int totalRows = userMapper.getCustomerTotalRows();

		// 파라미터 값을 뽑아내서 페이지네이션에 넣는다.
		int page = (int) param.get("page");
		int rows = (int) param.get("rows");
		Pagination pagination = new Pagination(rows, page, totalRows);

		// 페이지네이션의 시작 부분, 끝 부분을 얻어내서 파라미터에 담는다.
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);


		List<CustomerListDto> customerList = userMapper.getCustomers(param);

		Map<String, Object> result = new HashMap<>();
		result.put("customerList", customerList);
		result.put("pagination", pagination);
		result.put("totalRows", totalRows);

		return result;

	}

	// 관리자 - 고객 상세 조회
	public Map<String, Object> getCustomerDetails(String id) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 개인 정보 조회
		CustomerDetailDto customerInfo =	userMapper.getCustomerInfoDetails(id); 
		result.put("customerInfo", customerInfo);
		// 수업 내역 조회
		List<LessonApply> lessonApply = userMapper.getCustomerLessons(id);
		result.put("lessonApply", lessonApply);
		
		// 결제 내역 조회 
		List<CustomerOrderDto> customerOrderDto = orderMapper.getCustomerOrders(id);
		result.put("customerOrderDto", customerOrderDto);
		
		// 이용권 목록 조회 
		List<MyMembership> myMembershipList = orderMapper.getCustomerMyMemberships(id);
		result.put("myMembershipList", myMembershipList);
		
		// 최근 방문 내역
		List<CustomerAttendance> customerAttendance = userMapper.getCustomerAttendance(id);
		result.put("customerAttendance", customerAttendance);
	
		return result; 
	}

	// 마이페이지 - 내 정보 조회(유리)
	public User getUserById(String id) {
		return userMapper.getUserById(id);
	}

	// 마이페이지 - 내 리뷰 보기(예광)
	public List<TrainerReview> getMyReviews(String userId) {
		List<TrainerReview> reviews = trainerReviewMapper.getMyReviews(userId);
		return reviews;
	}
	
	// 마이페이지 - 내 문의내역(유리)
	public List<Inquires> moreInquiries(String userId) {
		List<Inquires> inquiries = inquiryMapper.getAllInquiryMypage(userId);
		return inquiries;
	}

  // 등급 변경 (은정)
	public void checkRank() {
		
		List<User> customers = userMapper.getAllCustomer();
		for(User customer : customers) {
			Rank rank = userMapper.getNewRank(customer.getId());
			if(rank == null) {
				continue;
			}
			
			customer.setRank(rank);
			customer.setPoint(customer.getPoint() + rank.getBenefit());
			userMapper.updateUser(customer);
		}
	}

	// 마이페이지(트레이너) - 내 리뷰 보기(예광)
	public List<TrainerReview> getTrainerReviews(User user) {
		Trainer trainer = trainerReviewMapper.getTrainerById(user.getId());
		List<TrainerReview> reviews = trainerReviewMapper.getReviewByTrainerNo(trainer.getTrainerNo());

		return reviews;
	}
	// 마이페이지(트레이너) - 트레이너 번호를 전달받기 위한 메소드(예광)
	public Trainer getTrainerById(User user){
		Trainer trainer = trainerReviewMapper.getTrainerById(user.getId());
		return trainer;
	}


	// 관리자 고객상세조회 - 최근 방문 내역 조회 - 채경
	public Map<String, Object> getCustomerAttendances(Map<String, Object> param) {
		// 총 행의 갯수
		int totalRows = userMapper.getCustomerAttendanceTotalRowsById(param);
		int page = (int) param.get("page");
		int rows = 10;
		Pagination pagination = new Pagination(rows, page, totalRows);

		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);


		List<CustomerAttendanceListDto> customerAttendanceListDto = userMapper.getCustomerAttendanceList(param);

		return Map.of("recentVisits", customerAttendanceListDto, "pagination", pagination);

	}

	// 관리자 고객 상세 조회 - 개인 정보 - 채경 
	public CustomerDetailDto getPrivateInfo(String id) {
		CustomerDetailDto result = userMapper.getCustomerInfoDetails(id);
		return result;
	}


	// 관리자 트레이너 목록 조회 - 채경
	public Map<String, Object> getAllTrainerInfo(Map<String, Object> param) {

		int totalRows = userMapper.getAllTrainerTotalRows(param);

		int page = (int) param.get("page");
		int rows = (int) param.get("rows");

		Pagination pagination = new Pagination(rows, page, totalRows);

		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);

		List<Trainer> trainerList = userMapper.getAllTrainers(param);

		Map<String, Object> result = new HashMap<>();
		result.put("trainerList", trainerList);
		result.put("pagination", pagination);
		result.put("totalRows", totalRows);

		return result;

	}

	// 트레이너 상세 조회 -개인정보 - 채경
	public MySalary getTrainerDetailById(String userId) {
		// 트레이너 인적사항 조회 
		MySalary trainerInfo = userMapper.getTrainerDetailById(userId);
		return trainerInfo;
	}

	// 트레이너 상세 조회 -출결내역(목록) - 채경
	public List<TrainerAttendance> getTrainerThreeAttendances(String userId) {
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("begin", 1);
		param.put("end", 3);

		List<TrainerAttendance> trainerAttendance = userMapper.getTrainerAttendances(param);
		return trainerAttendance;
	}

	// 트레이너 그룹수업 내역 조회(최근 5개) - 예광
	public List<Lesson> getRecentLessons(String userId) {
		List<Lesson> lessons = groupLessonMapper.getRecentLessons(userId);
		return lessons;
	}

	// 트레이너 그룹수업 자세히 보기 (예광)
	public Map<String, Object> trainerMyAllLessons(Map<String, Object> param, String userId) {
		Map<String, Object> result = new HashMap<>();

		int totalRows = groupLessonMapper.getTotalRows(param);
		int page = (int) param.get("page");

		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		param.put("userId", userId);

		List<Lesson> lessons = groupLessonMapper.trainerMyAllLessons(param);

		result.put("lessons", lessons);
		result.put("pagination", pagination);

		return result;
	}
}














