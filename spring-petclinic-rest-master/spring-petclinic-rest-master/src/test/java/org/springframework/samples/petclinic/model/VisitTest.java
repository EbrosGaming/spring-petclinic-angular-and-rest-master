package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class VisitTest {

    private Visit visit;
    SimpleDateFormat dateFormat;

    @BeforeAll
    static void setup() {
        System.out.println("Starting testsuite - (Before All)");
    }

    @BeforeEach
    void setUpEach(TestInfo testInfo) throws ParseException {
        System.out.println("Test starts - " +testInfo.getDisplayName());
        dateFormat =new SimpleDateFormat("yyyy-MM-dd");
        String visitDate = "2021-05-25";

        Owner owner = new Owner();
        owner.setId(1);
        owner.setFirstName("Manasi");
        owner.setLastName("Pa");
        owner.setAddress("Idir 2");
        owner.setCity("Hyderabad");
        owner.setTelephone("939415678");

        PetType petType = new PetType();
        petType.setId(2);
        petType.setName("cat");
        Pet pet = new Pet();
        pet.setId(8);
        pet.setName("Cosy");
        pet.setBirthDate(new Date());
        pet.setOwner(owner);
        pet.setType(petType);

        visit = new Visit();
        visit.setId(2);
        visit.setPet(pet);
        visit.setDate(dateFormat.parse(visitDate));
        visit.setDescription("First checkup");
    }

    @AfterEach
    void tearDownEach(TestInfo testInfo) {
        System.out.println("Test closes - " +testInfo.getDisplayName() );
    }

    @AfterAll
    static void tearDown() {
        System.out.println("Closing testsuite - (After All)");
    }

    @Test
    @DisplayName("Test get date of visit")
    void testGetDate() throws ParseException {
        Assertions.assertEquals(dateFormat.parse("2021-05-25"), visit.getDate());

    }

    @Test
    @DisplayName("Test set date of visit")
    void testSetDate() throws ParseException {
        visit.setDate(dateFormat.parse("2021-07-01"));
        Assertions.assertEquals(dateFormat.parse("2021-07-01"),visit.getDate());

    }

    @Test
    @DisplayName("Test get description of visit")
    void testGetDescription() {
        Assertions.assertEquals("First checkup", visit.getDescription());

    }

    @Test
    @DisplayName("Test set description of visit")
    void testSetDescription() {
        visit.setDescription("Change");
        Assertions.assertEquals("Change", visit.getDescription());

    }

    @Test
    @DisplayName("Test get Pet of visit")
    void testGetPet() {
        Assertions.assertEquals("Cosy", visit.getPet().getName());
    }

    @Test
    @DisplayName("Test set Pet of visit")
    void testSetPet() {
        visit.getPet().setName("Foup");
        Assertions.assertEquals("Foup", visit.getPet().getName());

    }
}
