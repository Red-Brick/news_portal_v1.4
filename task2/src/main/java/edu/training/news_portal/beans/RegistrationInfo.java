package edu.training.news_portal.beans;

public class RegistrationInfo {

    private final String email;
    private final String password;
    private final String name;
    private final String surname;

    private RegistrationInfo(RegBuilder builder){
        email = builder.getEmail();
        password = builder.getPassword();
        name = builder.getName();
        surname = builder.getSurname();

    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public static class RegBuilder implements Builder<RegistrationInfo>{
        private String email;
        private String password;
        private String name;
        private String surname;

        public RegBuilder(){}

        public RegBuilder email(String email){
            this.email = email;
            return this;
        }

        public RegBuilder password(String password){
            this.password = password;
            return this;
        }

        public RegBuilder name(String name){
            this.name = name;
            return this;
        }

        public RegBuilder surname(String surname){
            this.surname = surname;
            return this;
        }

        public String getEmail() {
            return email;
        }

        public String getPassword() {
            return password;
        }

        public String getName() {
            return name;
        }

        public String getSurname() {
            return surname;
        }

        @Override
        public RegistrationInfo build() {
            return new RegistrationInfo(this);
        }
    }
}
