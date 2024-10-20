/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package thang.dev.util;

import java.security.SecureRandom;

/**
 *
 * @author Bắp
 */
public class StringHelper {
    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();

    public static String ramdomString (int len) {
        StringBuilder ab = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            ab.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return ab.toString();
    }
}
    