package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


import static org.junit.jupiter.api.Assertions.*;

class OwnerTest {
    private Owner owner;

    @BeforeAll
    static void setup() {
        System.out.println("Starting testsuite - (Before All)");
    }

    @BeforeEach
    void setUpEach(TestInfo testInfo) {
        System.out.println("Test starts - " +testInfo.getDisplayName());
        owner = new Owner();
        owner.setId(2);
        owner.setFirstName("Praveen");
        owner.setLastName("Anugu");
        owner.setAddress("Virvel");
        owner.setCity("Göteborg");
        owner.setTelephone("073210123");
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
    @DisplayName("Test get address of owner")
    void testGetAddress() {
        Assertions.assertEquals("Virvel", owner.getAddress());
    }

    @Test
    @DisplayName("Test set address of owner")
    void testSetAddress() {
        owner.setAddress("Virvelvindsgatan 26");
        Assertions.assertEquals("Virvelvindsgatan 26",owner.getAddress());
    }

    @Test
    @DisplayName("Test get city of owner")
    void testGetCity() {
        Assertions.assertEquals("Göteborg", owner.getCity());
    }

    @Test
    @DisplayName("Test set city of owner")
    void testSetCity() {
        owner.setCity("Malmö");
        Assertions.assertEquals("Malmö", owner.getCity());
    }

    @Test
    @DisplayName("Test get telephone number of owner")
    void testGetTelephone() {
        Assertions.assertEquals("073210123", owner.getTelephone());

    }

    @Test
    @DisplayName("Test set telephone number of owner")
    void testSetTelephone() {
        owner.setTelephone("0789999");
        Assertions.assertEquals("0789999", owner.getTelephone());
    }

    @Test
    @DisplayName("Test set pets internal of owner")
    void testSetPetsInternal() {
        Pet pet = new Pet();
        pet.setName("dog");
        Pet pet2 = new Pet();
        pet2.setName("cat");
        Set<Pet> temp = new HashSet<>();
        temp.add(pet);
        temp.add(pet2);
        owner.setPetsInternal(temp);
        Pet returned = owner.getPet("cat", false);
        String nameOfPet = null;
        if(returned != null){
            nameOfPet = returned.getName();
        }
        Assertions.assertEquals("cat", nameOfPet);
    }

    @Test
    @DisplayName("Test get pet of owner")
    void testGetPet() {
        Pet pet = new Pet();
        String expected = "Loote";
        owner.addPet(pet);
        pet.setName("Loote");
        Assertions.assertEquals(expected ,pet.getName());
    }

    @Test
    void testToString() {
        String expected = "" +
            "id = 1, " +
            "new = false, " +
            "lastName = 'Pannala', " +
            "firstName = 'Swetha', " +
            "address = 'Virv', " +
            "city = 'Göteborg', " +
            "telephone = '09090'";
        owner.setFirstName("Swetha");
        owner.setLastName("Pannala");
        owner.setId(1);
        owner.setCity("Göteborg");
        owner.setAddress("Virv");
        owner.setTelephone("09090");
        Assertions.assertTrue(owner.toString().contains(expected));
    }

    @Test
    @DisplayName("Test get city of owner with Invalid values")
    void testGetCityInvalidTest() {
        Assertions.assertNotEquals("Stockholm", owner.getCity());
    }

    @Test
    @DisplayName("Test get telephone number of owner with Invalid values")
    void testGetTelephoneInvalidTest() {
        Assertions.assertNotEquals("0732999923", owner.getTelephone());

    }

    @Test
    @DisplayName("Test get address of owner with Invalid values")
    void testGetAddressInvalidAddress() {
        Assertions.assertNotEquals("Edee", owner.getAddress());
    }
}
