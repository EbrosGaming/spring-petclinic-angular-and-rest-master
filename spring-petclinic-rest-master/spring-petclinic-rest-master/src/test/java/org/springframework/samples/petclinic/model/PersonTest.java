package org.springframework.samples.petclinic.model;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.TestInfo;



public class PersonTest {
    @BeforeEach
    void setupEach(TestInfo testInfo) {
        System.out.println("Test starts - " +testInfo.getDisplayName());
    }
    @AfterEach
    void tearDownEach(TestInfo testInfo)  {
        System.out.println("Test closes - " +testInfo.getDisplayName() );
    }

    Person personObject;

    public PersonTest(){
        initPerson();
    }
    void initPerson() {
        personObject = new Person();
        personObject.setFirstName("Vincent");
        personObject.setLastName("Adler");
    }

    @Test
    @DisplayName("Test Get FirstName")
    public void getFirstNamePassTest() {
        Assertions.assertEquals("Vincent", personObject.getFirstName());
    }

    @Test
    @DisplayName("Test Set FirstName of Person")
    public void setFirstNamePassTest() {
        String firstName="Ellon";
        personObject.setFirstName(firstName);
        Assertions.assertEquals(firstName, personObject.getFirstName());
    }

    @Test
    @DisplayName("Test Get LastName of Person")
    public void getLastNamePassTest() {
        Assertions.assertEquals("Adler", personObject.getLastName());
    }

    @Test
    @DisplayName("Test Set LastName of Person")
    public void setLastNamePassTest() {
        String lastName="Musk";
        personObject.setFirstName(lastName);
        Assertions.assertEquals(lastName, personObject.getFirstName());
    }

    //Testing with invalid values
    @Test
    @DisplayName("Test FirstName With Invalid Values")
    public void getFirstNameFailTest() {
        Assertions.assertNotEquals("Coco", personObject.getFirstName());
    }

    @Test
    @DisplayName("Test LastName With Invalid Values")
    public void getLastNameFailTest() {
        Assertions.assertNotEquals("Melon", personObject.getLastName());
    }



}
