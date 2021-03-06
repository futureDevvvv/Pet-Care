package com.last.prj.qna.web;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qtag.service.QnaTagService;
import com.last.prj.qtag.service.QnaTagVO;
import com.last.prj.qtag.service.QtagService;
import com.last.prj.qtag.service.QtagVO;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;
import com.last.prj.security.CustomUser;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaDAO;

	@Autowired
	private QnaMapper mapper;

	@Autowired
	private QtagService qtagDAO;

	@Autowired
	private QnaTagService qtDAO;

	@Autowired
	private ReportService reportDao;

	@Autowired
	private MemService memDao;

	@Autowired
	private PetService petDAO;

	@Autowired
	private PmemberService pMemberDao;

	@Autowired
	ServletContext sc;

	// ????????? ?????????, ?????????
	@RequestMapping("/qnaMain")
	public String QnaMain(Criteria cri, Model model) {

		cri.setAmount(10);
		
		model.addAttribute("page", new PagingVO(cri, qnaDAO.getTotal(cri)));
		model.addAttribute("qnaList", qnaDAO.qnaList(cri));
		model.addAttribute("tagList", qtagDAO.tagList());
		model.addAttribute("best", qnaDAO.qnaBest());

		return "qna/qnaMain";

	}

	// ?????? ?????? ??? ?????? ?????? ??? ??????
	@GetMapping(value = "/tagSearch")
	public String tagSearch(@RequestParam("t_name") String t_name, Model model) {

		model.addAttribute("tagSearch", qnaDAO.tagSearch(t_name));
		model.addAttribute("tagList", qtagDAO.tagList());
		model.addAttribute("best", mapper.qnaBest());
		
		return "qna/tagSearch";
	}

	// ?????? ?????? ?????? ??????
	@RequestMapping(value = "/newQnaReport", method = RequestMethod.POST)
	public String newQnaReport(HttpServletRequest request, ReportVO report) throws Exception {

		/*
		 * HttpSession session = request.getSession(); String m_id = (String)
		 * session.getAttribute("mId"); String p_id = (String)
		 * session.getAttribute("pId");
		 */

		reportDao.newQnaReport(report);

		return "qna/qnaDetail";
	}

	// ????????? ?????? ?????? + ????????? ?????? + ?????? ?????? ?????? ?????? + ???????????? ?????? ?????? + ????????? ?????? ?????? + ?????? ??????
	@RequestMapping(value = "/qnaDetail")
	public String qnaDetail(@RequestParam("q_no") int q_no, Model model, HttpServletRequest request, Principal principal) {

		/*
		 * HttpSession session = request.getSession(); String m_id = (String)
		 * session.getAttribute("mId"); String p_id = (String)
		 * session.getAttribute("pId");
		 */

		if (principal != null) {

			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (userDetails.getRole() == "????????????") {
				String mId = userDetails.getMember().getM_id();
				model.addAttribute("mId", mId);
			} else if (userDetails.getRole() == "???????????????") {
				String pId = userDetails.getPmember().getP_id();
				model.addAttribute("pId", pId);
			}
		}

		qnaDAO.postCnt(q_no);
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));
		model.addAttribute("ansDetail", qnaDAO.ansDetail(q_no));
		model.addAttribute("best", mapper.qnaBest());
		model.addAttribute("cnt", mapper.replyCnt(q_no));

		return "qna/qnaDetail";
	}

	// ??? ???????????? ??????
	@RequestMapping(value = "/goToPdetail")
	public String goToPdetail(@RequestParam("p_id") String p_id, Model model) {

		// ????????? ??????
		model.addAttribute("pmemdetail", pMemberDao.getPmemberinfo(p_id)); // pmember
		model.addAttribute("time", pMemberDao.getTime(p_id));// otime

		// ??????
		model.addAttribute("counsel", pMemberDao.getCounselReview(p_id));
		model.addAttribute("service", pMemberDao.getServiceReview(p_id));

		return "pmember/memberDetail";
	}

	// ?????? ????????? ?????? + m_id??? ????????? ?????????.
	@RequestMapping(value = "/qnaForm")
	public String qnaForm(Model model) throws Exception {

		/* String mId = (String) session.getAttribute("mId"); */

		/*
		 * if (mId == null) { write.setContentType("text/html; charset=UTF-8");
		 * PrintWriter out_writer = write.getWriter();
		 * out_writer.println("<script>alert('?????? ??????????????????.');</script>");
		 * out_writer.flush();
		 * 
		 * return "member/loginForm"; } else {
		 */
		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = userDetails.getMember().getM_id();

		model.addAttribute("petList", petDAO.petmemberList(id));
		return "qna/qnaForm";
	}

	// ????????? ?????? + ?????? ??????
	@PostMapping("/qForm")
	public String qForm(HttpServletRequest request, HttpSession session, HttpServletResponse write, QnaVO qna,
			QtagVO qtag, QnaTagVO qnatag) throws Exception {

		/*
		 * String mId = (String) session.getAttribute("mId"); qna.setWriter(mId);
		 */

		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = userDetails.getMember().getM_id();

		qna.setWriter(id);

		if (qtag.getNTags() != null && qtag.getNTags().size() > 0) {
			qtagDAO.newTag(qtag);
		}

		qnaDAO.newQna(qna);

		if (qnatag.getNTags() != null && qnatag.getNTags().size() > 0) {
			qtagDAO.newQtag(qnatag);
		}
		return "redirect:/qnaMain";
	}

	// ?????? ?????? ????????? ?????? + ?????? ??? ?????? + ?????? ?????? + ????????? ??? ?????? ?????????.
	@RequestMapping(value = "/qModiForm")
	public String qModiForm(@RequestParam("q_no") int q_no, @RequestParam("m_id") String m_id, Model model) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		QnaVO vo = qnaDAO.qnaDetail(q_no);

		/* String mId = (String) session.getAttribute("mId"); */

		model.addAttribute("petList", petDAO.petmemberList(m_id));
		model.addAttribute("qnaDetail", vo);
		model.addAttribute("prevTag", objectMapper.writeValueAsString(vo.getTagList())); // ?????????????????? json?????? ????????? view??? ??????
		
	 System.out.println("?????? ?????? : " + vo.getTagList()); 
		
		
		return "qna/qModiForm";
	}

	// ?????? ????????? ?????? + ?????? ?????? ??? ?????????
	@RequestMapping(value = "/qModify")
	public String qModify(@RequestParam("q_no") int q_no, HttpServletRequest request, QnaVO qna, QtagVO qtag,
			QnaTagVO qnatag) throws Exception {

		System.out.println(q_no);

		qtDAO.delTags(q_no);

		if (qtag.getNTags() != null && qtag.getNTags().size() > 0) {
			qtagDAO.newTag(qtag);
		}
		qnaDAO.ansUpdate(qna);
		if (qnatag.getNTags() != null && qnatag.getNTags().size() > 0) {
			qtagDAO.ModiTag(qnatag);
		}

		return "redirect:/qnaMain";
	}

	// ?????? ??????(1)
	@RequestMapping(value = "/qDeleteOne", method = RequestMethod.GET)
	public String qDeleteOne(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.qDeleteOne(q_no);
		qtDAO.delTags(q_no);

		return "redirect:/qnaDetail";
	}

	// ?????? ??????(2)
	
	@RequestMapping(value = "/qDeleteTwo", method = RequestMethod.GET)
	public String qDeleteTwo(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.qDeleteTwo(q_no);
		qtDAO.delTags(q_no);

		return "redirect:/qnaMain";
	}

	// ????????? ?????? ?????? ??????
	@RequestMapping(value = "/newAns", method = RequestMethod.POST)
	public String newAns(HttpServletRequest request, QnaVO qna) throws Exception {

		qnaDAO.newAns(qna);

		return "qna/qnaDetail";
	}

	// ????????? ?????? ?????? ??????
	@RequestMapping(value = "/ansUpdate", method = RequestMethod.POST)
	public String ansUpdate(HttpServletRequest request, QnaVO qna) throws Exception {

		qnaDAO.ansUpdate(qna);

		return "qna/qnaDetail";
	}

	// ????????? ?????? ajax
	@RequestMapping(value = "/ansDelete", method = RequestMethod.GET)
	public String ansDelete(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.ansDelete(q_no);
		return "qna/qnaDetail";
	}

	// ????????? ?????????
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		// ?????? ?????? ??????
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// ?????????
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try {
			// ?????? ?????? ????????????
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// ????????? ?????? ??????
			String path = "resources/upload/"; // ????????? ?????? ??????(?????? ?????? ??????)
			String realPath = sc.getRealPath(path);

			String ckUploadPath = realPath + "/" + uid + "_" + fileName;
			File folder = new File(realPath);
			System.out.println("path:" + path); // ????????? ???????????? console??? ??????
			// ?????? ???????????? ??????
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // ?????? ??????
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram??? ????????? ???????????? ???????????? ?????????

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "resources/upload/" + uid + "_" + fileName; // ????????????

			// ???????????? ????????? ??????
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}

	// ????????? ????????? ????????? ????????????
	@RequestMapping(value = "/ckImgSubmit")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ????????? ????????? ????????? ??????
		String path = "resources/upload/"; // ????????? ?????? ??????(?????? ?????? ??????)
		String realPath = sc.getRealPath(path);
		System.out.println("path:" + realPath);
		String sDirPath = realPath + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// ?????? ????????? ?????? ????????? ?????? ??????????????? ??? ????????? ????????? ????????????.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
}
