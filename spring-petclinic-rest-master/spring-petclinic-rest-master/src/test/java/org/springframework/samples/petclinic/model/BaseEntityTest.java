package org.springframework.samples.petclinic.model;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;

public class BaseEntityTest {

     BaseEntity testObject;

        @BeforeEach
        void initMethod() {
            testObject = new BaseEntity(); // If there is a constructor you input the data inside of the " ( ) ".
            testObject.setId(3);
        }

    @Test
    @DisplayName("Test getId")
    void getIdTest() {

        assertEquals(3, testObject.getId());
    }

    @Test
    @DisplayName("Test setId(dependent on getId-method")
    void setIdTest() {
        testObject.setId(1);
        assertEquals(1, testObject.getId());
        testObject.setId(-2);
        assertEquals(-2, testObject.getId());  // works with negative numbers.. should it?
    }



    @Test
    @DisplayName("Test ID to be an Integer")
    void testVariableTypeofId() {

        assertTrue(Integer.class.isInstance(testObject.getId())); // Integer klassen besitter metoden isInstance().
    }

    @Test
    @DisplayName("Test isNew method")
    void isNewTest() {

        assertFalse(testObject.isNew()); // this returns false instead of null, why? Due to the method returning a boolean which by default false..
    }

}
