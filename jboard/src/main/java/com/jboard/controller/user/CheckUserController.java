package com.jboard.controller.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jboard.service.user.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/checkUser.do")
public class CheckUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Logger logger = LoggerFactory.getLogger(getClass());

	private UserService service = UserService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String type = req.getParameter("type");
		String value = req.getParameter("value");
		logger.debug("type: " + type);
		logger.debug("value: " + value);

		int result = service.selectCountUser(type, value);

		if (type.equals("email") && result == 0) {
			// 이메일 인증 번호 발송
			String code = service.sendEmailCode(value);

			// 세션 저장
			HttpSession session = req.getSession();
			session.setAttribute("authCode", code);
		}

		// 제이손
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		//
		PrintWriter writer = resp.getWriter();
		writer.print(json);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// String code = req.getParameter("code"); 는 안됨 post

		BufferedReader reader = req.getReader();
		StringBuilder requestBody = new StringBuilder();

		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}
		reader.close();

		// JSON 파싱
		Gson gson = new Gson();
		Properties prop = gson.fromJson(requestBody.toString(), Properties.class);
		String code = prop.getProperty("code");
		logger.debug("code");

		// 인증코드 일치 여부 확인
		HttpSession session = req.getSession();
		String authCode = (String) session.getAttribute("authCode");
		JsonObject json = new JsonObject();
		if (code.equals(authCode)) {
			// 제이슨 생성
			json.addProperty("result", 1);
		} else {
			json.addProperty("result", 0);
		}
		PrintWriter writer = resp.getWriter();
		writer.print(json);
	}
}
