package com.smhrd.service;  // ��Ű����: service ��Ű��

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

            helper.setFrom("thkjds7173@naver.com"); // ���̹� �̸��� ����
            helper.setTo(recipientEmail);
            helper.setSubject("[SearChill] �нǹ��� �߰ߵǾ����ϴ�!");
            helper.setText("<h3>[SearChill] �нǹ��� ��ϵǾ����ϴ�!</h3>" +
                    "<p>�ȳ��ϼ���, SearChill�Դϴ�.</p>" +
                    "<p>������ ã�� ��� ������ ����Ǵ� ��ǰ�� ����Ǿ� ��ϵǾ����ϴ�.</p>" +
                    "<p>�ڼ��� ������ Ȯ���Ͻ÷��� SearChill Ȩ�������� �湮�� �ּ���.</p>" +
                    "<p><a href='http://localhost:8081/controller/' style='color:blue; font-weight:bold;'>SearChill �ٷΰ���</a></p>" +                    
                    "<p>�����մϴ�.</p>", true);


            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
