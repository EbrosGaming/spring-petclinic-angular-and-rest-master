package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;


public class RoleTest {

    Role testObject;
    User testUser;

        @BeforeEach
        void initMethod() {
            testObject = new Role();
            testUser = new User();
            testObject.setName("Admin");
            testObject.setUser(testUser);
        }

    @Test
    @DisplayName("Test Get User")
    void getUser() {
            assertEquals(testUser, testObject.getUser());
            System.out.println(testUser);
    }

    @Test
    @DisplayName("Test Set User")
    void setUser() {
            User testUser2 = new User();
            testObject.setUser(testUser2);
            assertEquals(testUser2,testObject.getUser());
    }

    @Test
    @DisplayName("Test Get Name")
    void getName() {
            assertEquals("Admin", testObject.getName());
    }

    @Test
    @DisplayName("Test Set Name")
    void setName() {
            testObject.setName("Veterinarian");
            assertEquals("Veterinarian", testObject.getName());
    }
}
