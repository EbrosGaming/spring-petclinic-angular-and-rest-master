package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.Assert.assertThat;
import static org.hamcrest.CoreMatchers.instanceOf;             // Assert that an object is of a certain type or subtype
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;

public class UserTest {

    User testObject;

    @BeforeEach
    void initMethod() {
        testObject = new User(); // If there is a constructor you input the data inside of the " ( ) ".
        testObject.setPassword("YellowSnow");
        testObject.setUsername("DieHard");
        testObject.setEnabled(false);
    }

    @Test
    @DisplayName("Test Password ")
    void getPasswordTest() {
        assertEquals("YellowSnow", testObject.getPassword());
    }

    @Test
    @DisplayName("Test Username")
    void getUsernameTest() {
        assertEquals("DieHard", testObject.getUsername());
    }
    @Test
    @DisplayName("Test Username")
    void setUsernameTest() {
        testObject.setUsername("DieYoung");
        assertEquals("DieYoung", testObject.getUsername());
    }
    @Test
    @DisplayName("Test Password")
    void setPasswordTest() {
        testObject.setPassword("NoSnow");
        assertEquals("NoSnow", testObject.getPassword());
    }

    @Test
    @DisplayName("Test Enable")
    void getEnabledTest() {
        assertFalse(testObject.getEnabled());
    }

    @Test
    @DisplayName("Test Enable")
    void setEnabledTest2() {
        testObject.setEnabled(true);
        assertTrue(testObject.getEnabled());
    }

    @Test
    @DisplayName("Test addRole")
    void addRole() {
        testObject.addRole("Master of Coin");
        assertAll(
            () ->    assertThat(testObject.getRoles().iterator().next(), instanceOf(Role.class)),  // Assert that it is of the type Role
            () ->    assertEquals("Master of Coin", testObject.getRoles().iterator().next().getName()) // Uses iterator to target the object in hashSet
        );
    }

    @Test
    @DisplayName("Test setRoles")
    void setRoles() {
        Role testRole1 = new Role();
        testRole1.setName("Hand of the King");
        Set<Role> temp = new HashSet<>();
        temp.add(testRole1);
        testObject.setRoles(temp);
        assertEquals("Hand of the King",testObject.getRoles().iterator().next().getName()); // Used a manually created hashSet to be independent of addRole. But could have used addRole since it dose the same thing.
    }

    @Test
    @DisplayName("Test getRoles")
    void getRoles() {
        testObject.addRole("Master of Whisperers");

        assertAll(
            () ->    assertEquals("Master of Whisperers", testObject.getRoles().iterator().next().getName()),       // Assert that the getRoles returns the right hashSet
            () ->    assertThat(testObject.getRoles().iterator().next(), instanceOf(Role.class))         // Assert that getRoles returns a hashSet that consists of Role-Objects
        );
    }
}

