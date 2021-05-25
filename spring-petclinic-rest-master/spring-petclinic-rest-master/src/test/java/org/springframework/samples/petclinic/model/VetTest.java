package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;

import java.util.HashSet;
import java.util.Set;

public class VetTest {

    Specialty specialty1 = new Specialty();
    Specialty specialty2 = new Specialty();
    Specialty specialty3 = new Specialty();

    public VetTest(){
        initVet();
    }
    void initVet() {
        specialty1.setName("EyeSpecialist");
        specialty2.setName("Nutritionist");
        specialty3.setName("Medicineist");
    }

    @Test
    @DisplayName("Test To Get No Of Specialties")
    public void getNrOfSpecialtiesTest() {
        Vet vetObject = new Vet();
        Assertions.assertEquals(0, vetObject.getNrOfSpecialties());
    }

    @Test
    @DisplayName("Test To Add Specialties")
    public void addSpecialtiesTest() {
        Vet vetObject = new Vet();
        vetObject.addSpecialty(specialty1);
        vetObject.addSpecialty(specialty2);
        Assertions.assertEquals(2, vetObject.getNrOfSpecialties());
    }

    @Test
    @DisplayName("Test To ClearSpecialties")
    public void clearSpecialtiesTest() {
        Vet vetObject = new Vet();
        vetObject.addSpecialty(specialty2);
        vetObject.addSpecialty(specialty3);
        vetObject.clearSpecialties();
        Assertions.assertEquals(0, vetObject.getNrOfSpecialties());
    }
    @Test
    @DisplayName("Test To Set Internal Specialties")
    public void setSpecialtiesInternalTest() {
        Vet vetObject = new Vet();
        Set<Specialty> specialties=new HashSet<> ();
        specialties.add(specialty1);
        specialties.add(specialty2);
        vetObject.setSpecialtiesInternal(specialties);
        Assertions.assertEquals(2, vetObject.getSpecialtiesInternal().size());
        System.out.println(vetObject.getSpecialtiesInternal().size());
    }
    @Test
    @DisplayName("Test To Get Specialties Internal")
    public void getSpecialtiesInternalTest() {
        Vet vetObject = new Vet();
        Set<Specialty> specialties=new HashSet<> ();
        specialties.add(specialty1);
        vetObject.setSpecialtiesInternal(specialties);
        Assertions.assertEquals(1, vetObject.getSpecialtiesInternal().size());
        System.out.println(vetObject.getSpecialtiesInternal().size());
    }
    @Test
    @DisplayName("Test To getSpecialties")
    public void getSpecialtiesTest() {
        Vet vetObject = new Vet();
        vetObject.addSpecialty(specialty1);
        vetObject.addSpecialty(specialty2);
        vetObject.addSpecialty(specialty3);
        Assertions.assertEquals(3, vetObject.getSpecialties().size());
        System.out.println(vetObject.getSpecialties().size());
    }


}
