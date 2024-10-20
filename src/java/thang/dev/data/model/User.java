package thang.dev.data.model;

public class User {

    private int id;
    private String email;
    private String password;
    private String role;
    private String confirmationCode;
    private boolean isConfirmed;

    public User() {
    }

    public User(String email, String password, String role, String confirmationCode, boolean isConfirmed) {
        super();
        this.email = email;
        this.password = password;
        this.role = role;
        this.confirmationCode = confirmationCode;
        this.isConfirmed = isConfirmed;
    }

    public User(int id, String email, String password, String role, String confirmationCode, boolean isConfirmed) {
        super();
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.confirmationCode = confirmationCode;
        this.isConfirmed = isConfirmed;
    }

    public String getConfirmationCode() {
        return confirmationCode;
    }

    public void setConfirmationCode(String confirmationCode) {
        this.confirmationCode = confirmationCode;
    }

    public boolean isIsConfirmed() {
        return isConfirmed;
    }

    public void setIsConfirmed(boolean isConfirmed) {
        this.isConfirmed = isConfirmed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setConfirmed(boolean b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
