package com.khoana.hotelmanagement.util;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {

    private static final String EMAIL_FROM = "hoangchanelqbvn@gmail.com";
    private static final String APP_PASSWORD = "hcml isdn ocew aeus";

    public static String generateOTP() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    // Hàm gửi email nền tảng - Đã tối ưu hóa TLS và Encoding
    public static boolean sendEmail(String toEmail, String subject, String body) {
        // Ép hệ thống dùng IPv4 để tránh lỗi kết nối mạng tại một số nơi
        System.setProperty("java.net.preferIPv4Stack", "true");

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        // Đảm bảo dùng TLS 1.2 cho bảo mật cao nhất hiện nay
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, APP_PASSWORD);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            // Sửa tên hiển thị Admin cho chuyên nghiệp hơn
            msg.setFrom(new InternetAddress(EMAIL_FROM, "Marriott Hotel Support", "UTF-8"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            msg.setSubject(subject, "UTF-8");
            // Sử dụng setContent kèm header charset để không bị lỗi font Tiếng Việt
            msg.setContent(body, "text/html; charset=UTF-8");

            Transport.send(msg);
            System.out.println("✅ GỬI MAIL THÀNH CÔNG TỚI: " + toEmail);
            return true;
        } catch (Exception e) {
            System.err.println("❌ LỖI GỬI MAIL: " + e.getMessage());
            return false;
        }
    }

    // Hàm chuyên dụng: Tạo HTML xịn xò để gửi xác nhận đặt phòng
    public static boolean sendBookingConfirmEmail(String toEmail, String customerName, String roomName, String checkin, String checkout, double totalAmount) {
        String subject = "Xác nhận đặt phòng thành công - Marriott Hotel";

        // Thiết kế khung HTML tối ưu hiển thị Mobile-Responsive
        StringBuilder htmlBody = new StringBuilder();
        htmlBody.append("<div style='font-family: Arial, sans-serif; max-width: 600px; margin: 20px auto; border: 1px solid #e0e0e0; padding: 30px; border-radius: 15px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);'>");
        htmlBody.append("<div style='text-align: center; margin-bottom: 20px;'>");
        htmlBody.append("<h1 style='color: #1a1a1a; margin: 0; font-size: 24px;'>MARRIOTT HOTEL</h1>");
        htmlBody.append("<p style='color: #007bff; font-weight: bold; margin: 5px 0;'>XÁC NHẬN ĐẶT PHÒNG THÀNH CÔNG</p>");
        htmlBody.append("</div>");
        htmlBody.append("<p>Xin chào <b>").append(customerName).append("</b>,</p>");
        htmlBody.append("<p>Cảm ơn bạn đã lựa chọn Marriott Hotel làm nơi dừng chân. Yêu cầu đặt phòng của bạn đã được hệ thống ghi nhận thành công!</p>");

        htmlBody.append("<div style='background-color: #f9f9f9; padding: 20px; border-radius: 10px; margin: 20px 0;'>");
        htmlBody.append("<h3 style='margin-top: 0; color: #333; border-bottom: 2px solid #007bff; display: inline-block;'>Thông tin chi tiết</h3>");
        htmlBody.append("<table style='width: 100%; margin-top: 10px;'>");
        htmlBody.append("<tr><td style='padding: 5px 0; color: #666;'>Phòng:</td><td style='text-align: right; font-weight: bold;'>").append(roomName).append("</td></tr>");
        htmlBody.append("<tr><td style='padding: 5px 0; color: #666;'>Nhận phòng:</td><td style='text-align: right;'>").append(checkin).append("</td></tr>");
        htmlBody.append("<tr><td style='padding: 5px 0; color: #666;'>Trả phòng:</td><td style='text-align: right;'>").append(checkout).append("</td></tr>");
        htmlBody.append("<tr><td style='padding: 15px 0 5px 0; color: #666; font-size: 18px;'>Tổng thanh toán:</td>");
        htmlBody.append("<td style='text-align: right; color: #d9534f; font-weight: bold; font-size: 20px;'>").append(String.format("%,.0f", totalAmount)).append(" VNĐ</td></tr>");
        htmlBody.append("</table>");
        htmlBody.append("</div>");

        htmlBody.append("<p style='font-size: 14px; color: #555;'><b>Lưu ý:</b> Vui lòng mang theo CMND/CCCD và xuất trình email này tại quầy lễ tân để làm thủ tục check-in nhanh chóng.</p>");
        htmlBody.append("<div style='text-align: center; margin-top: 30px; border-top: 1px solid #eee; padding-top: 20px;'>");
        htmlBody.append("<p style='color: #888; font-size: 12px;'>Mọi thắc mắc vui lòng liên hệ Hotline: <b>1900 1234</b></p>");
        htmlBody.append("<p style='color: #888; font-size: 12px;'><i>Trân trọng,<br>Ban Quản Lý Marriott Hotel</i></p>");
        htmlBody.append("</div>");
        htmlBody.append("</div>");

        return sendEmail(toEmail, subject, htmlBody.toString());
    }
}
