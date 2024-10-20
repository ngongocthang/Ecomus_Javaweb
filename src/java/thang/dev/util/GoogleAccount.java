package thang.dev.util;

public class GoogleAccount {
    private String id, email, name, picture;
    private boolean verified_email;

    public GoogleAccount(String id, String email, String name, String picture, boolean verified_email) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.picture = picture;
        this.verified_email = verified_email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    // Getters and Settersm
    public String getEmail() { return email; }
    public String getName() { return name; }
    public String getPicture() { return picture; }
    public boolean isVerified_email() { return verified_email; }

    @Override
    public String toString() {
        return "GoogleAccount{id='" + id + "', email='" + email + "', name='" + name + "', picture='" + picture + "', verified_email=" + verified_email + '}';
    }
}