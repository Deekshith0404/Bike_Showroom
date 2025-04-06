package com.xworkz.bike_showroom.passwordGen;

import java.security.SecureRandom;

public class PasswordGenerator {

    private static final String DIGITS = "0123456789";

    public static String generatePassword(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(DIGITS.length());
            password.append(DIGITS.charAt(index));
        }

        return password.toString();
    }
}

