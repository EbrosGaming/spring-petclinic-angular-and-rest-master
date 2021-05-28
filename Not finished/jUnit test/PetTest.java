package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class PetTest {

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy/MM/dd")

    Pet testObject;
    Date testDate;
    PetType testPetType;
    Owner testOwner;

    public void PetTest() {
        initMethod();
    }

    // @BeforeEach
    public void initMethod() {
        testObject = new Pet();
        testDate = new Date();
        testPetType = new PetType();
        testPetType.setId(4);
        testOwner = new Owner();
        testOwner.setId(8);
    }

    @Test
    public void setBirthDate() {
        testDate = new Date("1999/09/09");
        if (testObject != null) {
            testObject.setBirthDate(testDate);
            assertEquals("1999/09/09", testObject.getBirthDate());
        }
    }

    @Test
    public void getBirthDate() {
        if (testObject != null)
            System.out.println(testObject.getBirthDate());
    }

    @Test
    public void getType() {
        if (testObject != null)
            System.out.println(testObject.getType());
    }

    @Test
    public void setType() {
        if (testObject != null)
            testObject.setType(testPetType);
    }

    @Test
    public void getOwner() {
        if (testObject != null)
            System.out.println(testObject.getOwner());
    }

    @Test
    public void setOwner() {
        if (testObject != null)
            testObject.setOwner(testOwner);
    }

    @Test
    public void getVisitsInternal() {

    }

    @Test
    public void setVisitsInternal() {

    }

    @Test
    public void getVisits() {

    }

    @Test
    public void addVisit() {

    }
}
