package com.xworkz.bike_showroom.emailSender;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.FileSystemResource;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;

import java.io.File;
@Slf4j
public class EmailSender {

    public static boolean emailSender(String email, String password1) {
        final String username = "deekshithdeekshi040@gmail.com";
        final String password = "srgm ucnw jjaf scyz";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); // TLS

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("ROYAL ENFIELD SHOWROOM");

            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setContent("Your TEMPORARY password to login is\n" + password1+"\n"+
                    "<html><body><h3>Hello Rider:</h3>" +
                    "<img src='cid:loaderGif'></body></html>", "text/html"
            );

            MimeBodyPart imageBodyPart = new MimeBodyPart();
            FileSystemResource image = new FileSystemResource(new File("E:\\commons\\re-page-loader-new.gif"));
            imageBodyPart.attachFile(image.getFile());
            imageBodyPart.setContentID("loaderGif"); // Content-ID to reference in HTML
            imageBodyPart.setDisposition(MimeBodyPart.INLINE);




//
//            MimeBodyPart imageBodyPart = new MimeBodyPart();
//                FileSystemResource image = new FileSystemResource(new File("E:\\commons\\re-page-loader-new.gif"));
//            imageBodyPart.attachFile(image.getFile());


//            MimeBodyPart attachmentBodyPart = new MimeBodyPart();
////            File filess=new File("E:\\commons\\Deekshit1742979555722");
////            InputStream in=new BufferedInputStream(new FileInputStream(filess));
//            FileSystemResource file = new FileSystemResource(new File("E:\\commons\\Deekshit1742979555722"));
//            attachmentBodyPart.attachFile(file.getFile());

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(imageBodyPart);
            multipart.addBodyPart(textBodyPart);
//            multipart.addBodyPart(attachmentBodyPart);



            message.setContent(multipart);

            Transport.send(message);

            log.info("Done");
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
