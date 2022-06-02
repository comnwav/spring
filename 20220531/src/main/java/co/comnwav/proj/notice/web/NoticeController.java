package co.comnwav.proj.notice.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.comnwav.proj.notice.service.NoticeService;
import co.comnwav.proj.notice.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeDao;

	@Autowired
	private String saveDir;

	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {	
		model.addAttribute("notices", noticeDao.noticeSelectList(1, "전체"));
		return "notice/noticeList";
	}

	@RequestMapping("/noticeInsertForm.do")
	public String noticeInsertForm() {
		return "notice/noticeInsertForm";
	}

	@PostMapping("/noticeInsert.do")
	public String noticeInsert(NoticeVO vo, MultipartFile file) {
		String fileName = file.getOriginalFilename();

		if (fileName != null && !fileName.isEmpty() && fileName.length() != 0) {
			// uuid 범용 고유 식별자
			// uuid 사용하여 파일 명 변경
			UUID uid = UUID.randomUUID();
			System.out.println(uid);
			String saveFileName = uid + fileName.substring(fileName.indexOf("."));
			// uuid.xml
			
			File target = new File(saveDir, saveFileName);
			
			vo.setNoticeAttach(fileName); // 파일명
			vo.setNoticeDir(saveFileName); // 실제 저장경로
			
			try {
				FileCopyUtils.copy(file.getBytes(), target); // 실제 파일을 저장
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		noticeDao.noticeInsert(vo);
		return "redirect:noticeList.do";
	}

	@PostMapping("/getContent.do")
	// get 방식일때 requestparam 사용가능
//	public String getContent(@RequestParam int noticeId)
	public String getContent(NoticeVO vo, Model model) {
		noticeDao.noticeHitUpdate(vo.getNoticeId());
		model.addAttribute("content", noticeDao.noticeSelect(vo));
		return "notice/noticeContent";
	}

	@RequestMapping("/downLoad.do")
	public void downLoad(@RequestParam String saveName, HttpServletResponse resp) {

		try {
			// file을 배열로 전화
			byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\temp\\" + saveName));
			
			// 모든 타입의 데이터를 전송할떄 사용
			resp.setContentType("application/octet-stream");
			
			// 파일 길이만큼 사이즈 설정
			resp.setContentLength(fileByte.length);
			
			// 파일을 다운 받기위해 설정
			resp.setHeader("Content-Disposition",
					"attachment; fileName=\"" + URLEncoder.encode(saveName, "UTF-8") + "\";");

			System.out.println(URLEncoder.encode(saveName, "UTF-8"));
			
			resp.getOutputStream().write(fileByte);
			resp.getOutputStream().flush();
			resp.getOutputStream().close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/noticeDelete.do")
	public String delete(NoticeVO vo) {
		noticeDao.noticeDelete(vo);
		return "redirect:noticeList.do";
	}
	
	@RequestMapping("/noticeModifyForm.do")
	public String modify(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeDao.noticeSelect(vo));
		return "notice/noticeModifyForm";
	}
	
	@RequestMapping("/noticeModify.do")
	public String modifyResult (NoticeVO vo) {
		noticeDao.noticeUpdate(vo);
		return "redirect:noticeList.do";
	}
	
	@PostMapping("/ajaxSearchList.do")
	@ResponseBody
	public List<NoticeVO> ajaxSearchList(@RequestParam("state") int state, @RequestParam("key") String key) {
		return noticeDao.noticeSelectList(state, key);
	}
}
