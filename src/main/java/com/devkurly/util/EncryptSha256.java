package com.devkurly.util;

import com.devkurly.global.ErrorCode;
import com.devkurly.member.exception.SignInException;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Component("EncryptSha256")
public class EncryptSha256 {
    public static String encrypt(String source) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(source.getBytes(StandardCharsets.UTF_8));
            byte[] byteData = md.digest();

            StringBuffer sb = new StringBuffer();
            for (byte datum : byteData) {
                sb.append(Integer.toString((datum & 0xff) + 0x100, 16).substring(1));
            }
            StringBuffer hexString = new StringBuffer();
            for (byte byteDatum : byteData) {
                String hex = Integer.toHexString(0xff & byteDatum);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new SignInException("암호화 오류", ErrorCode.SIGN_IN_FAIL);
        }
    }
}
