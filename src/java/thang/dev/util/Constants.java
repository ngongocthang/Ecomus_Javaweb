package thang.dev.util;

import java.util.regex.Pattern;

public class Constants {

    public static final String DB_URL = "jdbc:mysql://localhost:3306/javaweb";
    public static final String USER = "root";
    public static final String PASS = "";

    public static final int RELATED_NUMBER = 6;
    public static final int NUMBER_LIMIT_HOT = 8;
    public static final int NUMBER_LIMIT = 8;
    public static final int NUMBER_LIMIT_NEW = 12;

    public static final int PER_PAGE = 8;
    public static final int PER_PAGE_ADMIN = 10;

//    register
    public static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@(.+)$";
    public static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);
    public static final int MIN_PASSWORD_LENGTH = 8;

    //oauth google
    public static final String GOOGLE_CLIENT_ID = "";
    public static final String GOOGLE_CLIENT_SECRET = "";
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/Shop/login";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    //oath facebook
    public static final String FACEBOOK_CLIENT_ID = "";
    public static final String FACEBOOK_CLIENT_SECRET = "";
    public static final String FACEBOOK_REDIRECT_URI = "http://localhost:8080/Shop/Oauth2FacebookServlet";
    public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/v19.0/oauth/access_token";
    public static final String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";
}
