package com.smhrd.service;  // 패키지명: service 패키지

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendLostItemNotification(String recipientEmail, String itemName, String location) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom("thkjds7173@naver.com"); // 네이버 이메일 계정
            helper.setTo(recipientEmail);
            helper.setSubject("[SearChill] 분실물이 발견되었습니다!");
            helper.setText("<h3>[SearChill] 분실물이 등록되었습니다!</h3>" +
                    "<p>안녕하세요, SearChill입니다.</p>" +
                    "<p>고객님이 찾고 계신 것으로 예상되는 물품이 습득되어 등록되었습니다.</p>" +
                    "<p>자세한 정보를 확인하시려면 SearChill 홈페이지를 방문해 주세요.</p>" +
                    "<p><a href='http://localhost:8081/controller/' style='color:blue; font-weight:bold;'>SearChill 바로가기</a></p>" +                    
                    "<p>감사합니다.</p>", true);


            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
