package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class SpecialtyTest {

    Specialty testObject;

    @BeforeEach
    void initMethod() {
        testObject = new Specialty(); // If there is a constructor you input the data inside of the " ( ) ".
        testObject.setName("Jacob");
    }

    @Test
    @DisplayName("test GetName")
    void getNameTest() {

        assertEquals("Jacob", testObject.getName());
    }

    @Test
    @DisplayName("Test setName ")
    void setNameTest() {
        testObject.setName("Johan");
        assertEquals("Johan", testObject.getName());
    }

    @Test
    @DisplayName("Test toString to return name")
    void toStringTest() {
       assertEquals("Jacob", testObject.toString());

    }


}
