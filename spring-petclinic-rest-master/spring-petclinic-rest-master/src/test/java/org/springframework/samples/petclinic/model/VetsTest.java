package org.springframework.samples.petclinic.model;
import static org.junit.jupiter.api.Assertions.*;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class VetsTest {
    //private List<Vet> vets;
    Vets testVets;
    Vet vet1,vet2,vet3;

    @BeforeEach
    void initVets() { testVets = new Vets(); }

    @Test
    @DisplayName("Test to check If List is Empty")
    void emptyVetsList() {
        assertNotNull(testVets.getVetList());
        assertEquals(0,testVets.getVetList().size());
        assertTrue(testVets.getVetList().isEmpty());
    }

    @Test
    @DisplayName("Test to get Vet List")
    void getVetList() {
            vet1 = new Vet();
            vet2 = new Vet();
            vet3 = new Vet();
            testVets.getVetList().add(vet1);
            testVets.getVetList().add(vet2);
            testVets.getVetList().add(vet3);

        assertEquals(3,testVets.getVetList().size());
        assertFalse(testVets.getVetList().isEmpty());


    }

    @AfterEach
    void teardown() { testVets  = null; vet1 = null; vet2 = null; vet3 = null; }




}
