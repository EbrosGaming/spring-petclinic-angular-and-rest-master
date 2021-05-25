package org.springframework.samples.petclinic.model;
import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class VetsTest {
    Vets testVets;
    Vet vet1,vet2,vet3;

    @BeforeEach
    void initMethod() { testVets = new Vets(); }

    @Test
    @DisplayName("Test to check If List is Empty")
    void emptyVetsList() {
        assertNotNull(testVets.getVetList());
        assertEquals(0,testVets.getVetList().size());
    }

    @Test
    @DisplayName("Test to Add New Vets to the List")
    void addVetsList() {

        vet1 = new Vet(); vet2 = new Vet(); vet3 = new Vet();
        testVets.getVetList().add(vet1);
        testVets.getVetList().add(vet2);
        assertEquals(2,testVets.getVetList().size());
        assertNotEquals(5,testVets.getVetList().size());
        assertEquals(vet1,testVets.getVetList().get(0));
        assertEquals(vet2,testVets.getVetList().get(1));

        testVets.getVetList().add(vet3);
        assertEquals(3,testVets.getVetList().size());
        assertEquals(vet3,testVets.getVetList().get(2));
        
    }

    @AfterEach
    void teardown() { testVets  = null; vet1 = null; vet2 = null; vet3 = null; }




}
