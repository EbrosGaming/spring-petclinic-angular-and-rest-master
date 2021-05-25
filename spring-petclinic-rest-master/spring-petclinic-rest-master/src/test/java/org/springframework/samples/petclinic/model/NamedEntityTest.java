package org.springframework.samples.petclinic.model;
import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class NamedEntityTest {
    NamedEntity testName;
    @BeforeEach
    public void initMethod() {
        testName = new NamedEntity();
        testName.setName("Peter");
    }
    @Test
    @DisplayName("Test get name")
    public void testgetName() {  assertEquals("Peter", testName.getName()); }

    @Test
    @DisplayName("Test set name")
    public void testSetName() {

        testName.setName("Donald");
        assertEquals("Donald", testName.getName());
    }
    @Test
    @DisplayName("Test To string to return Name")
    public void testToString()
    {
        assertEquals("Peter", testName.toString());
    }

}
